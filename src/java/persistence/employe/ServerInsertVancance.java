/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "ServerInsertVancance", urlPatterns = {"/ServerInsertVancance"})
public class ServerInsertVancance extends HttpServlet {

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

        String debut_de_vacance_convert = request.getParameter("debut_de_vacance");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date debut_de_vacance = sdf.parse(debut_de_vacance_convert);

        String fin_de_vacance_convert = request.getParameter("fin_de_vacance");
        java.util.Date fin_de_vacance = sdf.parse(fin_de_vacance_convert);

        String nomb = request.getParameter("nombre");
        Long nombre = Long.parseLong(nomb);

        String emp_id = request.getParameter("empid");

        EmployeVacances vacances = new EmployeVacances();
        vacances.setDebutDeVacance(debut_de_vacance);
        vacances.setFinDeVacance(fin_de_vacance);
        vacances.setNombre(nombre);
        vacances.setEmpId(emp_id);

        EmployeDAO employeDAO = EmployeDAOFactory.createEmploye();
        if (employeDAO.insertVacance(vacances)) {
            
            request.setAttribute("status", "vacances inséré avec succès");
            request.getRequestDispatcher("/ServerAllEmploye?page=1").forward(request, response);
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
            Logger.getLogger(ServerInsertVancance.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServerInsertVancance.class.getName()).log(Level.SEVERE, null, ex);
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
