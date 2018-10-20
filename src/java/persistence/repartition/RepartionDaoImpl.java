/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition;

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
import persistence.travaux.TravauxDAOPostImpl;

/**
 *
 * @author macbookpro
 */
public class RepartionDaoImpl implements RepartionDao {

    private Repartion extractRepartitionFromResultSet(ResultSet rs) throws SQLException {

        Repartion repartion = new Repartion();
        repartion.setId(rs.getLong("id"));
        repartion.setDate(rs.getString("date"));
        repartion.setLundi(rs.getString("lundi"));
        repartion.setMardi(rs.getString("mardi"));
        repartion.setMercredi(rs.getString("mercredi"));
        repartion.setJeudi(rs.getString("jeudi"));
        repartion.setVendredi(rs.getString("vendredi"));

        return repartion;
    }

    @Override
    public boolean insertRepartition(Repartion r) {

        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO repartion(" + "date, lundi,mardi,mercredi,jeudi,vendredi)" + "VALUES (?,?,?,?,?,?)")) {
            pstm.setString(1, r.getDate());
            pstm.setString(2, r.getLundi());
            pstm.setString(3, r.getMardi());
            pstm.setString(4, r.getMercredi());
            pstm.setString(5, r.getJeudi());
            pstm.setString(6, r.getVendredi());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<Repartion> getRepartition(String date) {

        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT * FROM repartion WHERE date=?")) {
            p.setString(1, date);
            ResultSet rs = p.executeQuery();
            List<Repartion> repartions = new ArrayList<>();
            while (rs.next()) {
                Repartion repartion = extractRepartitionFromResultSet(rs);
                repartions.add(repartion);

            }
            return repartions;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    @Override
    public boolean getRepartitionById(String date, Repartion r) {

        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT id FROM repartion WHERE date=?")) {
            p.setString(1, date);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                long id = rs.getLong("id");
                updateRepartition(r, id);

            }
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    @Override
    public boolean updateRepartition(Repartion r, long id) {

        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE repartion SET date=?,lundi=?,mardi=?,mercredi=?,jeudi=?,vendredi=? WHERE id=?")) {
            pstm.setString(1, r.getDate());
            pstm.setString(2, r.getLundi());
            pstm.setString(3, r.getMardi());
            pstm.setString(4, r.getMercredi());
            pstm.setString(5, r.getJeudi());
            pstm.setString(6, r.getVendredi());
            pstm.setLong(7, id);
            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    @Override
    public boolean isRepartitionExist(String date) {

        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT id FROM repartion WHERE date=?")) {
            p.setString(1, date);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    @Override
    public boolean deleteRepartition(String date) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("DELETE  FROM repartion WHERE date=?")) {
            p.setString(1, date);
            int i = p.executeUpdate();
            if (i != 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    @Override
    public Repartionaccess accessRepartition() {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT * FROM repartionaccess")) {
            ResultSet rs = p.executeQuery();
            Repartionaccess ra = new Repartionaccess();
            if (rs.next()) {
                ra.setNom(rs.getString("nom"));
                ra.setStatus(rs.getString("status"));
                ra.setImg(rs.getString("img"));
                ra.setAccessTime(rs.getString("acesstime"));
                ra.setEmpId(rs.getString("emp_id"));
                return ra;

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean insertRepartitionUser(Repartionaccess ra) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("insert into repartionaccess (nom,status,img,acesstime,emp_id)" + " values (?,?,?,?,?)")) {
            pstm.setString(1, ra.getNom());
            pstm.setString(2, ra.getStatus());
            pstm.setString(3, ra.getImg());
            pstm.setString(4, ra.getAccessTime());
            pstm.setString(5, ra.getEmpId());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean deleteRepartitionAccess() {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("DELETE  FROM repartionaccess")) {

            int i = p.executeUpdate();
            if (i != 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RepartionDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
