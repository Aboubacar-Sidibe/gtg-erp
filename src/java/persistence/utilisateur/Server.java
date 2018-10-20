/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.utilisateur;

import persistence.utilisateur.UtilisatuerDAOFactory;
import persistence.utilisateur.Utilisateur;
import persistence.utilisateur.UtilisateurDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.parser.TokenType;
import persistence.ConnectionFactory;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "Server", urlPatterns = {"/Server"})
public class Server extends HttpServlet {

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
        String id = request.getParameter("id");
        String mot_de_passe = request.getParameter("motdepasse");
        String nom = request.getParameter("nom_utilisateur");
        String action = request.getParameter("action");

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId(id);
        utilisateur.setMot_de_passe(mot_de_passe);
        utilisateur.setNom(nom);

        Class.forName("org.postgresql.Driver");

        if (action.equalsIgnoreCase("modify")) {
            UtilisateurDAO utilisateurDAO = UtilisatuerDAOFactory.createUtilisateur();
            boolean reponse = utilisateurDAO.updateUtilisateur(utilisateur);
            if (reponse) {
                request.setAttribute("success", "Modifier avec succès");
                request.getRequestDispatcher("/Server?action=alluser").forward(request, response);
            } else {
                request.setAttribute("error", "Erreur!!!! Verifier que le id correspond a celui d'un  employé existant");
                request.getRequestDispatcher("/Server?action=alluser").forward(request, response);
            }

        } else if (action.equalsIgnoreCase("adduser")) {

            UtilisateurDAO utilisateurDAO = UtilisatuerDAOFactory.createUtilisateur();
            boolean reponse = utilisateurDAO.insertUtilisateur(utilisateur);
            if (reponse) {
                request.setAttribute("success", "Ajouter avec succès");
                request.getRequestDispatcher("/Server?action=alluser").forward(request, response);
            } else {
                request.setAttribute("error", "Erreur!!!! Verifier que le id correspond a celui d'un  employé existant");
                request.getRequestDispatcher("/Server?action=alluser").forward(request, response);
            }
        } else if (action.equalsIgnoreCase("alluser")) {

            try (Connection connection = ConnectionFactory.getConnection();
                    Statement stm = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs = stm.executeQuery("SELECT * FROM utilusateur ORDER BY count DESC")) {

                int rowCount = 0;
                
                int currRow = rs.getRow();
                if (!rs.last()) {
                }
                rowCount = rs.getRow();

                if (currRow == 0) {
                    rs.beforeFirst();
                } else {
                    rs.absolute(currRow);
                }

                List<Utilisateur> utilisateurs = new ArrayList<>();
                while (rs.next()) {
                    Utilisateur utilisateur2 = new Utilisateur();
                    String empid = rs.getString("id");
                    PreparedStatement emprs = connection.prepareStatement("SELECT fonction,email FROM employe WHERE emp_id=?");
                    emprs.setString(1, empid);
                    ResultSet rs1 = emprs.executeQuery();
                    if (rs1.next()) {
                        String fonction = rs1.getString("fonction");
                        String mail = rs1.getString("email");
                        utilisateur2.setFonction(fonction);
                        utilisateur2.setMail(mail);
                        utilisateur2.setId(rs.getString("id"));
                        utilisateur2.setMot_de_passe(rs.getString("mot_de_passe"));
                        utilisateur2.setNom(rs.getString("nom_utilisateur"));
                    }

                    utilisateurs.add(utilisateur2);

                }
                request.setAttribute("rowcount", rowCount);
                request.setAttribute("users", utilisateurs);
                request.getRequestDispatcher("ContainerUsers.jsp").forward(request, response);
            } catch (SQLException ex) {

                ex.printStackTrace();
                request.setAttribute("status", ex);
                request.getRequestDispatcher("Login.jsp").forward(request, response);

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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Server.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Server.class.getName()).log(Level.SEVERE, null, ex);
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
