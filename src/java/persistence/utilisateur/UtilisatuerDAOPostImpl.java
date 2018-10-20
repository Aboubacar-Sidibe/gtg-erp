/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.utilisateur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistence.ConnectionFactory;

/**
 *
 * @author macbookpro
 */
public class UtilisatuerDAOPostImpl implements UtilisateurDAO {

    String ERR = null;

    @Override
    public boolean isEmployee(Utilisateur utilisateur) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("SELECT emp_id FROM employe WHERE emp_id=?")) {
            pstm.setString(1, utilisateur.getId());
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UtilisatuerDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private Utilisateur extractUserFromResultSet(ResultSet rs) throws SQLException {
        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setId(rs.getString("id"));
        utilisateur.setMot_de_passe("mot_de_passe");
        utilisateur.setNom("nom_utilisateur");
        return utilisateur;
    }

    public UtilisatuerDAOPostImpl() {
    }

    @Override
    public Utilisateur getUtilisateur(String id) {
        try (Connection connection = ConnectionFactory.getConnection();
                Statement stm = connection.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM utilusateur WHERE id=" + id)) {
            if (rs.next()) {
                return extractUserFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UtilisatuerDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Utilisateur> getTousLesUtilisateurs() {
        try (Connection connection = ConnectionFactory.getConnection();
                Statement stm = connection.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM utilusateur")) {

            List<Utilisateur> utilisateurs = new ArrayList<>();
            while (rs.next()) {
                String empid = rs.getString("id");
                PreparedStatement emprs = connection.prepareStatement("SELECT fonction FROM employe WHERE emp_id=?");
                emprs.setString(1, empid);
                ResultSet rs1 = emprs.executeQuery();
                
                String fonction = rs1.getString("fonction");
                
                Utilisateur utilisateur = extractUserFromResultSet(rs);
                
                utilisateur.setFonction(fonction);

                utilisateurs.add(utilisateur);

            }
            return utilisateurs;
        } catch (SQLException ex) {

            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UtilisatuerDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Utilisateur getUtilisateurParNomETMotDePasse(String nom, String motdepasse) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("SELECT * FROM utilusateur WHERE nom=? AND mot_de_passe=?")) {
            pstm.setString(1, nom);
            pstm.setString(2, motdepasse);

            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                return extractUserFromResultSet(rs);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UtilisatuerDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean insertUtilisateur(Utilisateur utilisateur) {

        boolean answer = isEmployee(utilisateur);

        if (answer == true) {

            try (Connection connection = ConnectionFactory.getConnection();
                    PreparedStatement pstm = connection.prepareStatement("INSERT INTO utilusateur(" + "id, mot_de_passe, nom_utilisateur)" + "VALUES (?, ?, ?)")) {
                pstm.setString(1, utilisateur.getId());
                pstm.setString(2, utilisateur.getMot_de_passe());
                pstm.setString(3, utilisateur.getNom());
                int i = pstm.executeUpdate();
                if (i == 1) {
                    return true;
                }

            } catch (SQLException ex) {
                ERR = ex.toString();

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UtilisatuerDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return false;
    }

    @Override
    public boolean updateUtilisateur(Utilisateur utilisateur) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE utilusateur SET mot_de_passe=?,nom_utilisateur=? WHERE id=?")) {
            pstm.setString(1, utilisateur.getMot_de_passe());
            pstm.setString(2, utilisateur.getNom());
            pstm.setString(3, utilisateur.getId());
            //number of row affected
            int i = pstm.executeUpdate();

            if (i !=0) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UtilisatuerDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean deleteUtilisateur(int id) {
        try {
            Connection connection = ConnectionFactory.getConnection();
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM utilusateur WHERE id=" + id);
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UtilisatuerDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
