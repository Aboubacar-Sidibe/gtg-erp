/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.images;

import persistence.employe.EmpImg;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import persistence.ConnectionFactory;
import persistence.utilisateur.Utilisateur;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "InsertImage", urlPatterns = {"/InsertImage"})
public class InsertImage extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        String empid = request.getAttribute("empId").toString();
        String fname = request.getAttribute("empImg").toString();
        
        EmpImg empImg = new EmpImg();
        
        
        
        empImg.setEmpId(empid);
        empImg.setImg(fname);
        
        HttpSession session = request.getSession();
      
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO empimage(" + "emp_id, img)" + "VALUES (?,?)")) {
            pstm.setString(1, empImg.getEmpId());
            pstm.setString(2, empImg.getImg());
            if(empImg.getEmpId()!=null)
            {
            int i = pstm.executeUpdate();
            request.setAttribute("status", "Veuillez vous re-connecter pourque les changement prennent effet");
            request.getRequestDispatcher("/LoginServer?nom="+session.getAttribute("nom")+"&"+"motdepasse="+session.getAttribute("mot_de_passe")+"&"+"action=").forward(request, response);
            
            }
            else
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            

        } catch (SQLException ex) {
            throw new Exception(ex.toString());
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
            Logger.getLogger(InsertImage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(InsertImage.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InsertImage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(InsertImage.class.getName()).log(Level.SEVERE, null, ex);
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
