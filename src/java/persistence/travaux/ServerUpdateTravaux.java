/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.travaux;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.ConnectionFactory;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "ServerUpdateTravaux", urlPatterns = {"/ServerUpdateTravaux"})
public class ServerUpdateTravaux extends HttpServlet {

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
            throws ServletException, IOException, ParseException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String dossier = request.getParameter("dossier");
        String client = request.getParameter("client");
        String type_de_travail = request.getParameter("type_de_travail");
        String status = request.getParameter("status");
        String lieu = request.getParameter("lieu");
        String dure_estime = request.getParameter("dure_estime");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String deadline_con = request.getParameter("deadline");
        String rendez_vous_con = request.getParameter("rendez_vous");

        Date deadline = null;
        if (!deadline_con.equals("")) {
            deadline = (Date) sdf.parse(deadline_con);
        }

        Date rendez_vous = null;
        if (!rendez_vous_con.equals("")) {
            rendez_vous = (Date) sdf.parse(rendez_vous_con);

        }
        
        String chef = request.getParameter("chef");
        String donneur = request.getParameter("donneur");
        String notes = request.getParameter("notes");
        String empIdS = request.getParameter("empid");
        long empId= Long.parseLong(empIdS);
        

        Travaux travail = new Travaux();
        travail.setTravailId(empId);
        travail.setDossier(dossier);
        travail.setClient(client);
        travail.setTypeDeTravail(type_de_travail);
        travail.setStatus(status);
        travail.setLieu(lieu);
        travail.setDureEstime(dure_estime);
        travail.setDeadline(deadline);
        travail.setRendezVous(rendez_vous);
        travail.setChef(chef);
        travail.setDonneur(donneur);
        travail.setNotes(notes);

        TravauxDAO travauxDAO = TravauxDAOFactory.createTravaux();
        if(status.equalsIgnoreCase("Annulé"))
        {
            try {
            Connection connection = ConnectionFactory.getConnection();
             PreparedStatement pstmt = connection.prepareStatement("DELETE FROM travaux WHERE dossier =?");
             pstmt.setString(1, dossier);
            int i = pstmt.executeUpdate();
            if (i != 0) {
                request.setAttribute("success", "Supprimé avec succès");
               request.getRequestDispatcher("/ServerAllTravaux?page=1").forward(request, response);
            }
        } catch (SQLException ex) {
            request.setAttribute("error", ex.toString());
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
        }
        else{
        if (travauxDAO.updateTravaux(travail, (java.util.Date) rendez_vous,deadline)) {
            request.setAttribute("status", "Modifié avec succès");
            request.getRequestDispatcher("/ServerAllTravaux?page=1").forward(request, response);
        } else {
            request.setAttribute("error", "Erreur!!!! Verifier que le id  correspond a celui d'un  employé existant");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
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
        } catch (ParseException ex) {
            Logger.getLogger(ServerUpdateTravaux.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServerUpdateTravaux.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(ServerUpdateTravaux.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServerUpdateTravaux.class.getName()).log(Level.SEVERE, null, ex);
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
