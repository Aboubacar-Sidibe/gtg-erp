/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import persistence.employe.*;
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
import persistence.ConnectionFactory;
import persistence.dateconverter.DateConverter;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "ServerAllEmploye", urlPatterns = {"/ServerAllEmploye"})
public class ServerAllEmploye extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, ParseException {
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

        try (Connection connection = ConnectionFactory.getConnection();
                Statement stm = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet r = stm.executeQuery("SELECT * FROM employe");
                PreparedStatement p = connection.prepareStatement("SELECT * FROM employe ORDER BY id DESC limit ? offset ? ")) {

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

            List<Employe> employes = new ArrayList<>();
            while (rs.next()) {
                Employe employe = new Employe();
                employe.setEmpId(rs.getString("emp_id"));
                employe.setCellulaire(rs.getString("cellulaire"));
                employe.setCodePostale(rs.getString("code_postale"));
                employe.setDateDeNaissanceStr(DateConverter.convertToFrFormat(rs, "date_de_naissance"));
                employe.setDateDePayementStr(DateConverter.convertToFrFormat(rs, "date_de_payement"));
                employe.setDiplome(rs.getString("diplome"));
                employe.setEmail(rs.getString("email"));
                employe.setEtat(rs.getString("etat"));
                employe.setFonction(rs.getString("fonction"));
                employe.setMontantSalaire(rs.getString("montant_salaire"));
                employe.setNom(rs.getString("nom"));
                employe.setNumeroDeRue(rs.getString("numero_de_rue"));
                employe.setPays(rs.getString("pays"));
                employe.setPrenom(rs.getString("prenom"));
                employe.setSex(rs.getString("sex"));
                employe.setStatus(rs.getString("status"));
                employe.setTelephoneResidence(rs.getString("telephone_residence"));
                employe.setVille(rs.getString("ville"));

                employes.add(employe);

            }
            if (!employes.isEmpty()) {
                request.setAttribute("no", paginationNo);
                request.setAttribute("rowcount", rowCount);
                request.setAttribute("employes", employes);
                request.getRequestDispatcher("ContainerEmployees.jsp").forward(request, response);
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
            Logger.getLogger(ServerAllEmploye.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ServerAllEmploye.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServerAllEmploye.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ServerAllEmploye.class.getName()).log(Level.SEVERE, null, ex);
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
