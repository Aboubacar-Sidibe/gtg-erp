/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.fournisseurs;

import persistence.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistence.ConnectionFactory;
import persistence.employe.Employe;
import persistence.employe.EmployeDAOPostImpl;

/**
 *
 * @author macbookpro
 */
public class FournisseurDAOImpl implements FournisseurDAO {
    
    private Fournisseur extractFournisseurFromResultSet(ResultSet rs) throws SQLException {
        Fournisseur fournisseur = new Fournisseur();
         fournisseur.setId(rs.getLong("id"));
         fournisseur.setNom(rs.getString("nom"));
         fournisseur.setTelephone(rs.getString("telephone"));
         fournisseur.setEmail(rs.getString("email"));
         fournisseur.setVille(rs.getString("ville"));
         fournisseur.setPays(rs.getString("pays"));
        

        return fournisseur;
    }
    
    @Override
    public List<Fournisseur> getAllFournisseurs()
    {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT * FROM fournisseur")) {
            
            ResultSet rs = p.executeQuery();

            List<Fournisseur> fournisseurs = new ArrayList<>();
            while (rs.next()) {

                Fournisseur fournisseur = extractFournisseurFromResultSet(rs);

               fournisseurs.add(fournisseur);

            }
            return fournisseurs;
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FournisseurDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean insertFournisseur(Fournisseur fournisseur) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO fournisseur(" + "nom,telephone,email,ville,pays)" + "VALUES (?,?,?,?,?)")) {
            pstm.setString(1, fournisseur.getNom());
            pstm.setString(2, fournisseur.getTelephone());
            pstm.setString(3, fournisseur.getEmail());
            pstm.setString(4, fournisseur.getVille());
            pstm.setString(5, fournisseur.getPays());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FournisseurDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean updateFournisseur(Fournisseur fournisseur) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE  fournisseur SET  nom=?,telephone=?,email=?,ville=?,pays=? WHERE id=?")) {
            pstm.setString(1, fournisseur.getNom());
            pstm.setString(2, fournisseur.getTelephone());
            pstm.setString(3, fournisseur.getEmail());
            pstm.setString(4, fournisseur.getVille());
            pstm.setString(5, fournisseur.getPays());
            pstm.setLong(6, fournisseur.getId());

            int i = pstm.executeUpdate();
            if (i != 0) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
