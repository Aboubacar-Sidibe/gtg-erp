/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dessinateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.ConnectionFactory;
import persistence.employe.*;
import persistence.dateconverter.DeadlineChecker;


/**
 *
 * @author macbookpro
 */
@WebServlet(name = "ServerAllDessinateur", urlPatterns = {"/ServerAllDessinateur"})
public class ServerAllDessinateur extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String spageid = request.getParameter("page");

        int pageid = Integer.parseInt(spageid);
        int total = 30;
        if (pageid == 1) {
            pageid = 0;
        } else {
            pageid = pageid - 1;
            pageid = pageid * total;
        }

        EmployeDAO employeDAO = EmployeDAOFactory.createEmploye();
        List names = employeDAO.getAllEmployesNames();

        try (Connection connection = ConnectionFactory.getConnection();
                Statement stm = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet r = stm.executeQuery("SELECT * FROM dessinateur");
                PreparedStatement p = connection.prepareStatement("SELECT * FROM dessinateur ORDER BY id DESC limit ? offset ?")) {

            int rowCount = 0;
            int paginationNo = 0;
            int currRow = r.getRow();
            if (!r.last()) {
            }
            rowCount = r.getRow();

            if (currRow == 0) {
                r.beforeFirst();
            } else {
                r.absolute(currRow);
            }

            if (rowCount % 30 == 0) {
                paginationNo = rowCount / 30;
            } else {
                paginationNo = (rowCount / 30) + 1;
            }

            p.setInt(1, total);
            p.setInt(2, pageid);
            ResultSet rs = p.executeQuery();

            List<Dessinateur> dessinateurs = new ArrayList<>();
            while (rs.next()) {

                Dessinateur dessinateur = new Dessinateur();
                
                dessinateur.setBureau(rs.getString("bureau"));
                dessinateur.setDossier(rs.getString("dossier"));
                dessinateur.setClient(rs.getString("client"));
                dessinateur.setLieu(rs.getString("lieu"));
                dessinateur.setTypeDeMandat(rs.getString("type_de_mandat"));
                dessinateur.setTypeDeTravail(rs.getString("type_de_travail"));
                dessinateur.setDuree(rs.getString("duree"));
                dessinateur.setDeadlineStr(rs.getString("deadline"));
                dessinateur.setPriorite(rs.getInt("priorite"));
                dessinateur.setSaisiePar(rs.getString("saisie_par"));
                //dessinateur.setDateDeSaisieStr(DateConverter.convertToFrFormat(rs, "date_de_saisie"));
                dessinateur.setDateDeSaisieStr(rs.getString("date_de_saisie"));
                dessinateur.setNotes(rs.getString("notes"));
                //dessinateur.setDateStatusStr(DateConverter.convertToFrFormat(rs, "date_status"));
                dessinateur.setDateStatusStr(rs.getString("date_status"));
                dessinateur.setResponsable(rs.getString("responsable"));
                dessinateur.setStatus(rs.getString("status"));
                
                dessinateur.setColor(DeadlineChecker.ofDessinateur(rs, "deadline"));

                dessinateurs.add(dessinateur);

            }
            if (!dessinateurs.isEmpty()) {
                request.setAttribute("no", paginationNo);
                request.setAttribute("rowcount", rowCount);
                request.setAttribute("dessinateurs", dessinateurs);
                request.setAttribute("names", names);
                request.getRequestDispatcher("ContainerDessinateurs.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            request.setAttribute("error", ex);
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServerAllDessinateur.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServerAllDessinateur.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ServerAllDessinateur.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServerAllDessinateur.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServerAllDessinateur.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ServerAllDessinateur.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
