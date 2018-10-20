/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.travaux;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistence.ConnectionFactory;
import persistence.dateconverter.DateConverter;
import persistence.dateconverter.DeadlineChecker;

/**
 *
 * @author macbookpro
 */
public class TravauxDAOPostImpl implements TravauxDAO {

    private Travaux extractTravailFromResultSet(ResultSet rs) throws SQLException, ParseException {

       Travaux travaux = new Travaux();
        travaux.setTravailId(rs.getLong("travail_id"));
        travaux.setDossier(rs.getString("dossier"));
        travaux.setClient(rs.getString("client"));
        travaux.setTypeDeTravail(rs.getString("type_de_travail"));
        travaux.setStatus(rs.getString("status"));
        travaux.setLieu(rs.getString("lieu"));
        travaux.setDureEstime(rs.getString("dure_estime"));
        
        if (rs.getDate("deadline") == null) {
            travaux.setDeadlineStr("");
        } else {
            travaux.setDeadlineStr(DateConverter.convertToFrFormat(rs, "deadline"));
        }
        
        
        if (rs.getDate("rendez_vous") == null) {
            travaux.setRendezVousStr("");
        } else {
            travaux.setRendezVousStr(DateConverter.convertToFrFormat(rs, "rendez_vous"));
        }
        travaux.setChef(rs.getString("chef"));
        travaux.setDonneur(rs.getString("donneur"));
        travaux.setNotes(rs.getString("notes"));
         if (rs.getDate("rendez_vous") == null) {
             travaux.setColor("w3-white");
         }
         else
        travaux.setColor(DeadlineChecker.getColor(rs, "deadline"));

        return travaux;
    }

    @Override
    public Travaux getTravaux(String id) {
        try (Connection connection = ConnectionFactory.getConnection();
                Statement stm = connection.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM travaux WHERE travail_id=" + id)) {
            if (rs.next()) {
                return extractTravailFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Travaux> getAllTravaux(int total, int pageid) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT * FROM travaux ORDER BY travail_id DESC  limit ? offset ?")) {

            p.setInt(1, total);
            p.setInt(2, pageid);
            ResultSet rs = p.executeQuery();

            List<Travaux> travauxs = new ArrayList<>();
            while (rs.next()) {

                Travaux travaux = extractTravailFromResultSet(rs);

                travauxs.add(travaux);
            }
            return travauxs;
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean insertTravaux(Travaux travaux, java.util.Date r,java.util.Date d) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO travaux(" + "dossier, client,type_de_travail,lieu,dure_estime,deadline,rendez_vous,chef,donneur,notes)" + "VALUES (?,?,?,?,?,?,?,?,? ,?)")) {
            pstm.setString(1, travaux.getDossier());
            pstm.setString(2, travaux.getClient());
            pstm.setString(3, travaux.getTypeDeTravail());
            pstm.setString(4, travaux.getLieu());
            pstm.setString(5, travaux.getDureEstime());
            if (d != null) {
                pstm.setDate(6, new Date(travaux.getDeadline().getTime()));
            } else {
                pstm.setDate(6, null);
            }
            
            if (r != null) {
                pstm.setDate(7, new Date(travaux.getRendezVous().getTime()));
            } else {
                pstm.setDate(7, null);
            }
            pstm.setString(8, travaux.getChef());
            pstm.setString(9, travaux.getDonneur());
            pstm.setString(10, travaux.getNotes());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean updateTravaux(Travaux travaux, java.util.Date r,java.util.Date d) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE travaux SET dossier=?,client=?,type_de_travail=?,status=?,lieu=?,dure_estime=?,deadline=?,rendez_vous=?,chef=?,donneur=?,notes=? WHERE travail_id=?")) {
            pstm.setString(1, travaux.getDossier());
            pstm.setString(2, travaux.getClient());
            pstm.setString(3, travaux.getTypeDeTravail());
            pstm.setString(4, travaux.getStatus());
            pstm.setString(5, travaux.getLieu());
            pstm.setString(6, travaux.getDureEstime());
            
            
            
            if (d != null) {
                pstm.setDate(7, new Date(travaux.getDeadline().getTime()));
            } else {
                pstm.setDate(7, null);
            }
            
            if (r != null) {
                pstm.setDate(8, new Date(travaux.getRendezVous().getTime()));
            } else {
                pstm.setDate(8, null);
            }
            
            
            

            pstm.setString(9, travaux.getChef());
            pstm.setString(10, travaux.getDonneur());
            pstm.setString(11, travaux.getNotes());
            pstm.setLong(12, travaux.getTravailId());
            //number of row affected
            int i = pstm.executeUpdate();

            if (i != 0) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean updateTravail(String s) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE travaux SET repartir=? WHERE travail_id=?")) {
            pstm.setString(1, "oui");
            pstm.setLong(2, Long.parseLong(s));

            //number of row affected
            int i = pstm.executeUpdate();

            if (i != 0) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    @Override
    public boolean updateTravailSetRepartirNon(String s) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE travaux SET repartir=? WHERE travail_id=?")) {
            pstm.setString(1, "non");
            pstm.setLong(2, Long.parseLong(s));

            //number of row affected
            int i = pstm.executeUpdate();

            if (i != 0) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean deleteTravaux(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Travaux> getAllTravauxNonRepartis() {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT * FROM travaux where repartir=?")) {

            p.setString(1, "non");
            ResultSet rs = p.executeQuery();

            List<Travaux> travauxs = new ArrayList<>();
            while (rs.next()) {

                Travaux travaux = extractTravailFromResultSet(rs);

                travauxs.add(travaux);
            }
            return travauxs;
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List getAllTravailId() {
        
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT travail_id FROM travaux")) {

           
            ResultSet rs = p.executeQuery();

            List ids = new ArrayList<>();
            while (rs.next()) {

                String id= rs.getString("travail_id");

                ids.add(id);
            }
            return ids;
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TravauxDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
        
    }

}
