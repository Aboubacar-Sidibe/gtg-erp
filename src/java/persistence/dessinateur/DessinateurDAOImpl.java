/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dessinateur;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistence.ConnectionFactory;
import persistence.instrument.InstrumentDAOImpl;

/**
 *
 * @author macbookpro
 */
public class DessinateurDAOImpl implements DessinateurDAO {

    @Override
    public boolean insertDessinateur(Dessinateur dessinateur) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO dessinateur(" + " bureau, dossier,client,lieu,type_de_mandat,type_de_travail,duree,deadline,priorite,saisie_par,date_de_saisie,notes,status,date_status,responsable)" + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)")) {

            pstm.setString(1, dessinateur.getBureau());
            pstm.setString(2, dessinateur.getDossier());
            pstm.setString(3, dessinateur.getClient());
            pstm.setString(4, dessinateur.getLieu());
            pstm.setString(5, dessinateur.getTypeDeMandat());
            pstm.setString(6, dessinateur.getTypeDeTravail());
            pstm.setString(7, dessinateur.getDuree());
            if(dessinateur.getDeadline()==null || dessinateur.getDeadline().equals(""))
                pstm.setString(8, null);
            else
            {
                          pstm.setString(8, dessinateur.getDeadline());
  
            }
            pstm.setInt(9, dessinateur.getPriorite());
            pstm.setString(10, dessinateur.getSaisiePar());
            pstm.setString(11, dessinateur.getDateDeSaisie());
            pstm.setString(12, dessinateur.getNotes());
            pstm.setString(13, dessinateur.getStatus());
            pstm.setString(14, dessinateur.getDateStatus());
            pstm.setString(15, dessinateur.getResponsable());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DessinateurDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean updateDessinateur(Dessinateur dessinateur) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE  dessinateur SET  bureau=?,dossier=?,client=?,lieu=?,type_de_mandat=?,type_de_travail=?,duree=?,deadline=?,priorite=?,saisie_par=?,date_de_saisie=?,notes=?,status=?,date_status=? ,responsable=?  WHERE  dossier=?")) {
            pstm.setString(1, dessinateur.getBureau());
            pstm.setString(2, dessinateur.getDossier());
            pstm.setString(3, dessinateur.getClient());
            pstm.setString(4, dessinateur.getLieu());
            pstm.setString(5, dessinateur.getTypeDeMandat());
            pstm.setString(6, dessinateur.getTypeDeTravail());
            pstm.setString(7, dessinateur.getDuree());
            
                pstm.setString(8, dessinateur.getDeadline());
            
            pstm.setInt(9, dessinateur.getPriorite());
            pstm.setString(10, dessinateur.getSaisiePar());
            pstm.setString(11,dessinateur.getDateDeSaisie());
            pstm.setString(12, dessinateur.getNotes());
            pstm.setString(13, dessinateur.getStatus());
            pstm.setString(14, dessinateur.getDateStatus());
            pstm.setString(15, dessinateur.getResponsable());
            pstm.setString(16, dessinateur.getDossier());

            int i = pstm.executeUpdate();
            if (i != 0) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstrumentDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
