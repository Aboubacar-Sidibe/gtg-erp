/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.travaux;

import persistence.employe.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import persistence.ConnectionFactory;
import persistence.ConnectionFactory;
import persistence.travaux.Travaux;
import persistence.travaux.TravauxDAO;
import persistence.travaux.TravauxDAOFactory;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "ServerAllTravaux", urlPatterns = {"/ServerAllTravaux"})
public class ServerAllTravaux extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String spageid = request.getParameter("page");
         HttpSession session = request.getSession();

        int pageid = Integer.parseInt(spageid);
        int total = 30;
        if (pageid == 1) {
            pageid = 0;
        } else {
            pageid = pageid - 1;
            pageid = pageid * total;
        }

        Connection connection = ConnectionFactory.getConnection();
        Statement stm = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r = stm.executeQuery("SELECT * FROM travaux");
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

        TravauxDAO travauxDAO = TravauxDAOFactory.createTravaux();
        List<Travaux> travauxs = travauxDAO.getAllTravaux(total, pageid);
            request.setAttribute("no", paginationNo);
            request.setAttribute("rowcount", rowCount);
            request.setAttribute("travaux", travauxs);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
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
        } catch (SQLException ex) {
            Logger.getLogger(ServerAllTravaux.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServerAllTravaux.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(ServerAllTravaux.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServerAllTravaux.class.getName()).log(Level.SEVERE, null, ex);
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
