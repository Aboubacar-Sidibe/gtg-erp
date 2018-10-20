/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistence.travaux.*;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "RepartionServer", urlPatterns = {"/RepartionServer"})
public class RepartionServer extends HttpServlet {

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

        String[] travaux = request.getParameterValues("sumUp");
        String[] ids = request.getParameterValues("ids");
       
        String repartionDate = request.getParameter("repartionDate");
        

        StringBuilder tra = new StringBuilder();

        for (String travail : travaux) {
            if (!travail.isEmpty()) {
                tra.append(travail).append("@");
            } else {
                if (travail.contains("@")) {
                    int in = tra.lastIndexOf("@");
                    tra.deleteCharAt(in);
                    break;
                }

            }

        }
        String travauxParts = tra.toString();
        String[] travauxArray = travauxParts.split("@");
        int nombreDelements = travauxArray.length;
        int residuDelements = nombreDelements % 5;
        int nombreDeRow = (nombreDelements - residuDelements) / 5;
        if (residuDelements != 0) {
            nombreDeRow += 1;
        }
        String[][] travauxMatrix = new String[nombreDeRow][5];
        int k = 0;
        for (int i = 0; i < travauxMatrix.length; i++) {
            for (int j = 0; j < travauxMatrix[i].length; j++) {

                travauxMatrix[i][j] = travauxArray[k];
                k++;
                if (k == travauxArray.length) {
                    break;
                }

            }
        }

        Repartion repartion = new Repartion();
        repartion.setDate(repartionDate);

        for (int i = 0; i < travauxMatrix.length; i++) {
            for (int j = 0; j < travauxMatrix[i].length; j++) {
                if (j == 0) {
                    repartion.setLundi(travauxMatrix[i][j]);
                } else if (j == 1) {
                    repartion.setMardi(travauxMatrix[i][j]);
                } else if (j == 2) {
                    repartion.setMercredi(travauxMatrix[i][j]);
                } else if (j == 3) {
                    repartion.setJeudi(travauxMatrix[i][j]);
                } else if (j == 4) {
                    repartion.setVendredi(travauxMatrix[i][j]);
                }
            }
            RepartionDao repartionDao = RepartitionDaoFactory.createRepartition();

            if (repartionDao.isRepartitionExist(repartion.getDate()) && i==0) {
                repartionDao.deleteRepartition(repartion.getDate());
                repartionDao.insertRepartition(repartion);
            } else {
                repartionDao.insertRepartition(repartion);
            }


        }
        
        for(String idi : ids)
        {
            TravauxDAO travauxDAO=TravauxDAOFactory.createTravaux();
            travauxDAO.updateTravail(idi);
        }

        request.setAttribute("repartionDate", repartion.getDate());

        request.setAttribute("travaux", travauxArray);
        request.setAttribute("repartion", repartion);
        request.getRequestDispatcher("./RepartionSetUp").forward(request, response);

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
