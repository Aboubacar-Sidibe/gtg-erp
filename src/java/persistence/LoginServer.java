/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import persistence.utilisateur.Utilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "LoginServer", urlPatterns = {"/LoginServer"})
public class LoginServer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String nom = request.getParameter("nom");
        String mot_de_passe = request.getParameter("motdepasse");
        String action = request.getParameter("action");
        String fonction = "";
        String empImg="";
        
        HttpSession session = request.getSession();
        
        
        
        
       

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setNom(nom);
        utilisateur.setMot_de_passe(mot_de_passe);
        Class.forName("org.postgresql.Driver");

        if (action.equalsIgnoreCase("logout")) {
            session.invalidate();
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("SELECT * FROM utilusateur WHERE nom_utilisateur=? AND mot_de_passe=?")) {
            pstm.setString(1, utilisateur.getNom());
            pstm.setString(2, utilisateur.getMot_de_passe());

            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {

                String id = rs.getString("id");
                PreparedStatement rsFonction = connection.prepareStatement("SELECT fonction FROM employe WHERE emp_id=?");
                PreparedStatement rsImage = connection.prepareStatement("SELECT img FROM empimage WHERE emp_id=?");
                rsFonction.setString(1, id);
                rsImage.setString(1, id);
                ResultSet fonctionRs = rsFonction.executeQuery();
                ResultSet imageRs =  rsImage.executeQuery();
                if(imageRs.next())
                {
                    empImg=imageRs.getString("img");
                }
                if(fonctionRs.next())
                {
                fonction = fonctionRs.getString("fonction");
                }

                session.setAttribute("utilisateur", utilisateur);
                session.setAttribute("fonction", fonction);
                session.setAttribute("empid", id);
                session.setAttribute("empImg", empImg);
                session.setAttribute("nom", nom);
                session.setAttribute("mot_de_passe", mot_de_passe);
                
                request.getRequestDispatcher("./ServerAllTravaux?page=1").forward(request, response);

            } else {

                request.setAttribute("status", "L'utilisateur n'existe pas,Veuillez conctatez l'admin");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            System.err.println("L'utilisateur n'existe pas,Veuillez conctatez l'admin");

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
            Logger.getLogger(LoginServer.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (IOException io) {
            request.setAttribute("status", "verifier le log file");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
            Logger.getLogger(LoginServer.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (IOException io) {
            request.setAttribute("status", "verifier le log file");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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
