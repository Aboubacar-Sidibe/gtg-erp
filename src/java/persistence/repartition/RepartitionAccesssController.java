/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.dateconverter.DateApi;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "RepartitionAccesssController", urlPatterns = {"/RepartitionAccesssController"})
public class RepartitionAccesssController extends HttpServlet {

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

        String nom = request.getParameter("user");
        String id = request.getParameter("zero");
        String date = request.getParameter("repartionDate");

        RepartionDao repartionDao = RepartitionDaoFactory.createRepartition();
        Repartionaccess access = repartionDao.accessRepartition();
        if (access == null || access.getStatus().equals("libre")) {

            Repartionaccess ra = new Repartionaccess();
            ra.setNom(nom);
            ra.setStatus("occupe");
            ra.setAccessTime(DateApi.getRepartitionAccessDate());
            ra.setImg(request.getSession().getAttribute("empImg").toString());
            ra.setEmpId(id);
            repartionDao.insertRepartitionUser(ra);

            request.setAttribute("repartionDate", request.getParameter("repartionDate"));
            request.getRequestDispatcher("/RepartionSetUp").forward(request, response);

        } else if (id.equals(access.getEmpId())) {

            request.setAttribute("repartionDate", date);
            request.getRequestDispatcher("/RepartionSetUp").forward(request, response);
        } else {
            request.setAttribute("nom", "Repartition verrouiller par " + access.getNom());
            request.setAttribute("img", access.getImg());
            request.setAttribute("accesstime", access.getAccessTime());
            request.getRequestDispatcher("./ServerAllTravaux?page=1").forward(request, response);
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
