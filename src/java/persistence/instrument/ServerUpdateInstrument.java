/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.instrument;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ServerUpdateInstrument", urlPatterns = {"/ServerUpdateInstrument"})
public class ServerUpdateInstrument extends HttpServlet {

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
        
        String nserie = request.getParameter("numerodeserie");
        String nom = request.getParameter("nom");
        String marque = request.getParameter("marque");
        String model = request.getParameter("model");
        String version = request.getParameter("version");
        String numero = request.getParameter("numero");
        String type = request.getParameter("type");
        String compatibilite = request.getParameter("compatibilite");
        String disponibilite = request.getParameter("disponibilite");
        String dacqui_convert = request.getParameter("dacqui");
        String fingarantie_convert = request.getParameter("fingarantie");
        String fourni = request.getParameter("fournisseur");
       long fourni_id= Long.parseLong(fourni);
        
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date dacqui = sdf.parse(dacqui_convert);
        Date fingarantie = sdf.parse(fingarantie_convert);
        
        String cout = request.getParameter("cout");
        String abbreviation = request.getParameter("abbreviation");
        String actif = request.getParameter("actif");
        String couleur = request.getParameter("couleur");
        
        Instrument i = new Instrument();
        i.setNumeroDeSerie(nserie);
        i.setNom(nom);
        i.setMarque(marque);
        i.setModel(model);
        i.setVersion(version);
        i.setNumero(numero);
        i.setType(type);
        i.setCompatibilite(compatibilite);
        i.setDisponibilite(disponibilite);
        i.setDateDacquisition(dacqui);
        i.setFinGarantie(fingarantie);
        i.setCoutDacquisition(cout);
        i.setAbbreviation(abbreviation);
        i.setActif(actif);
        i.setCouleur(couleur);
        i.setFournisseurId(fourni_id);
        InstrumentDAO instrumentDAO = InstrumentDAOFactory.createInstrument();
        if(instrumentDAO.updateInstrument(i))
        {
            request.getRequestDispatcher("./ServerAllInstrument?page=1").forward(request, response);
        }
        else
        {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
            Logger.getLogger(ServerUpdateInstrument.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServerUpdateInstrument.class.getName()).log(Level.SEVERE, null, ex);
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
