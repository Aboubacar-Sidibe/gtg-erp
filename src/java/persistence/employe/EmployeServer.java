/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import persistence.employe.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
@WebServlet(name = "EmployeServer", urlPatterns = {"/EmployeServer"})
public class EmployeServer extends HttpServlet {

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

        String empid = request.getParameter("empid");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String date_de_naissance_convert = request.getParameter("date_de_naissance");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date_de_naissance = sdf.parse(date_de_naissance_convert);
        String sex = request.getParameter("sex");
        String fonction = request.getParameter("fonction");
        String diplome = request.getParameter("diplome");
        String telephone_residence = request.getParameter("telephone_residence");
        String cellulaire = request.getParameter("cellulaire");
        String numero_de_rue = request.getParameter("numero_de_rue");
        String code_postale = request.getParameter("code_postale");
        String ville = request.getParameter("ville");
        String pays = request.getParameter("pays");
        String etat = request.getParameter("etat");
        String email = request.getParameter("email");
        String montant_salaire = request.getParameter("montant_salaire");
        String date_de_payement_convert = request.getParameter("date_de_payement");
        Date date_de_payement = sdf.parse(date_de_payement_convert);
        String status = request.getParameter("status");

        Employe employe = new Employe();
        employe.setEmpId(empid);
        employe.setNom(nom);
        employe.setPrenom(prenom);
        employe.setDateDeNaissance(date_de_naissance);
        employe.setSex(sex);
        employe.setFonction(fonction);
        employe.setDiplome(diplome);
        employe.setTelephoneResidence(telephone_residence);
        employe.setCellulaire(cellulaire);
        employe.setNumeroDeRue(numero_de_rue);
        employe.setCodePostale(code_postale);
        employe.setVille(ville);
        employe.setPays(pays);
        employe.setEtat(etat);
        employe.setEmail(email);
        employe.setMontantSalaire(montant_salaire);
        employe.setDateDePayement(date_de_payement);
        employe.setStatus(status);

            EmployeDAO employeDAO = EmployeDAOFactory.createEmploye();
            if (employeDAO.insertEmploye(employe)) {
                request.setAttribute("status", "Ajouter avec succès");
                request.getRequestDispatcher("/ServerAllEmploye?page=1").forward(request, response);
            } else {
                request.setAttribute("error", "Erreur!!!! Verifier que le id  correspond a celui d'un  employé existant");
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
            Logger.getLogger(EmployeServer.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EmployeServer.class.getName()).log(Level.SEVERE, null, ex);
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
