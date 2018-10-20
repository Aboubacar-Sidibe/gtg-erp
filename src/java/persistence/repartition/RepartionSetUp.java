/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.employe.Employe;
import persistence.employe.EmployeDAO;
import persistence.employe.EmployeDAOFactory;
import persistence.travaux.*;
import persistence.dateconverter.DateApi;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "RepartionSetUp", urlPatterns = {"/RepartionSetUp"})
public class RepartionSetUp extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String repartionDate = request.getAttribute("repartionDate").toString();

        String date = "";

        if (repartionDate == null) {
            date = DateApi.getTodayDate();
        } else {
            date = repartionDate;
        }

        EmployeDAO employeDAO = EmployeDAOFactory.createEmploye();
        List<Employe> TechniciensTerrain = employeDAO.getAllTechniciensTerrain();

        TravauxDAO travauxDAO = TravauxDAOFactory.createTravaux();
        List<Travaux> travauxs = travauxDAO.getAllTravauxNonRepartis();

        List ids = travauxDAO.getAllTravailId();

        RepartionDao repartionDao = RepartitionDaoFactory.createRepartition();
        List<Repartion> repartions = repartionDao.getRepartition(date);

        request.setAttribute("TechniciensTerrain", TechniciensTerrain);
        request.setAttribute("travaux", travauxs);
        request.setAttribute("repartitionDate", date);
        request.setAttribute("repartions", repartions);
        request.setAttribute("ids", ids);
        request.getRequestDispatcher("./Dates.jsp").forward(request, response);

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
        processRequest(request, response);
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
        processRequest(request, response);
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
