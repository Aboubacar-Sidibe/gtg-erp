/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dessinateur;

import java.io.IOException;
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

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "InsertDessinateurServer", urlPatterns = {"/InsertDessinateurServer"})
public class InsertDessinateurServer extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        String bureau = request.getParameter("bureau");
        String dossier = request.getParameter("dossier");
        String client = request.getParameter("client");

        String lieu = request.getParameter("lieu");
        String type_de_mandat = request.getParameter("type_de_mandat");
        String type_de_travail = request.getParameter("type_de_travail");
        String duree = request.getParameter("duree");
        String responsable = request.getParameter("responsable");
        String deadline_convert = request.getParameter("deadline");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        //Date deadline=null;
        //if (!deadline_convert.equals("")) {
        //    deadline = (Date) sdf.parse(deadline_convert);
        //}
        
       

        String status = request.getParameter("status");
        String priorite_string = request.getParameter("Priorite");
        char priorite = priorite_string.charAt(0);
        String prio = String.valueOf(priorite);
       
        int priori = Integer.parseInt(prio);
        String saisie_par = request.getParameter("saisie_par");
        String date_saisie_convert = request.getParameter("date_saisie");
        Date date_saisie = sdf.parse(date_saisie_convert);
        String notes = request.getParameter("notes");
        String date_de_status_convert = request.getParameter("date_de_status");
        Date date_de_status = sdf.parse(date_de_status_convert);

        Dessinateur dessinateur = new Dessinateur();
        dessinateur.setBureau(bureau);
        dessinateur.setDossier(dossier);
        dessinateur.setClient(client);
        dessinateur.setLieu(lieu);
        dessinateur.setTypeDeMandat(type_de_mandat);
        dessinateur.setTypeDeTravail(type_de_travail);
        dessinateur.setDuree(duree);
        dessinateur.setDeadline(deadline_convert);
        dessinateur.setStatus(status);
        dessinateur.setPriorite(priori);
        dessinateur.setSaisiePar(saisie_par);
        dessinateur.setDateDeSaisie(date_saisie_convert);
        dessinateur.setNotes(notes);
        dessinateur.setDateStatus(date_de_status_convert);
        dessinateur.setResponsable(responsable);

        DessinateurDAO dessinateurDAO = DessinateurDAOFactory.createDessinateur();
        if (dessinateurDAO.insertDessinateur(dessinateur)) {
            request.getRequestDispatcher("/ServerAllDessinateur?page=1").forward(request, response);

        } else {
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
        } catch (ParseException ex) {
            Logger.getLogger(InsertDessinateurServer.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InsertDessinateurServer.class.getName()).log(Level.SEVERE, null, ex);
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
