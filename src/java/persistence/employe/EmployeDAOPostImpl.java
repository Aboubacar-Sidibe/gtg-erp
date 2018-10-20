/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import persistence.employe.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistence.ConnectionFactory;
import persistence.ConnectionFactory;
import persistence.employe.SalaireHistorique;

/**
 *
 * @author macbookpro
 */
public class EmployeDAOPostImpl implements EmployeDAO {
    
    
    private Employe extractArpenteurFromRs(ResultSet rs) throws SQLException {
        Employe employe = new Employe();
        employe.setEmpId(rs.getString("emp_id"));
        employe.setNom(rs.getString("nom"));
        employe.setPrenom(rs.getString("prenom"));
        return employe;
    }

    private Employe extractEmployeFromResultSet(ResultSet rs) throws SQLException {
        Employe employe = new Employe();
        employe.setEmpId(rs.getString("emp_id"));
        employe.setCellulaire(rs.getString("cellulaire"));
        employe.setCodePostale(rs.getString("code_postale"));
        employe.setDateDeNaissance(rs.getDate("date_de_naissance"));
        employe.setDateDePayement(rs.getDate("date_de_payement"));
        employe.setDiplome(rs.getString("diplome"));
        employe.setEmail(rs.getString("email"));
        employe.setEtat(rs.getString("etat"));
        employe.setFonction(rs.getString("fonction"));
        employe.setMontantSalaire(rs.getString("montant_salaire"));
        employe.setNom(rs.getString("nom"));
        employe.setNumeroDeRue(rs.getString("numero_de_rue"));
        employe.setPays(rs.getString("pays"));
        employe.setPrenom(rs.getString("prenom"));
        employe.setSex(rs.getString("sex"));
        employe.setStatus(rs.getString("status"));
        employe.setTelephoneResidence(rs.getString("telephone_residence"));
        employe.setVille(rs.getString("ville"));

        return employe;
    }

    @Override
    public Employe getEmploye(String id) {
        try (Connection connection = ConnectionFactory.getConnection();
                Statement stm = connection.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM employe WHERE id=" + id)) {
            if (rs.next()) {
                return extractEmployeFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<Employe> getAllEmployes(int start, int total) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT * FROM employe  limit ? offset ? ORDER BY id DESC");) {

            p.setInt(1, total);
            p.setInt(2, start);
            ResultSet rs = p.executeQuery();

            List<Employe> employes = new ArrayList<>();
            while (rs.next()) {

                Employe employe = extractEmployeFromResultSet(rs);

                employes.add(employe);

            }
            return employes;
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List getAllEmployesNames() {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT nom FROM employe");) {

            ResultSet rs = p.executeQuery();

            List names= new ArrayList();
            while (rs.next()) {

                String nom = rs.getString("nom");
               names.add(nom);

            }
            return names;
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean insertEmploye(Employe employe) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO employe(" + "emp_id, nom, prenom,date_de_naissance,sex,fonction,diplome,telephone_residence,cellulaire,numero_de_rue,code_postale,ville,pays,etat,email,montant_salaire,date_de_payement,status)" + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)")) {
            pstm.setString(1, employe.getEmpId());
            pstm.setString(2, employe.getNom());
            pstm.setString(3, employe.getPrenom());
            pstm.setDate(4, new Date(employe.getDateDeNaissance().getTime()));
            pstm.setString(5, employe.getSex());
            pstm.setString(6, employe.getFonction());
            pstm.setString(7, employe.getDiplome());
            pstm.setString(8, employe.getTelephoneResidence());
            pstm.setString(9, employe.getCellulaire());
            pstm.setString(10, employe.getNumeroDeRue());
            pstm.setString(11, employe.getCodePostale());
            pstm.setString(12, employe.getVille());
            pstm.setString(13, employe.getPays());
            pstm.setString(14, employe.getEtat());
            pstm.setString(15, employe.getEmail());
            pstm.setString(16, employe.getMontantSalaire());
            pstm.setDate(17, new Date(employe.getDateDePayement().getTime()));
            pstm.setString(18, employe.getStatus());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean insertVacance(EmployeVacances vacances) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO employe_vacances(" + "debut_de_vacance,fin_de_vacance, emp_id,nombre)" + "VALUES (?,?,?,?)")) {
            pstm.setDate(1, new Date(vacances.getDebutDeVacance().getTime()));
            pstm.setDate(2, new Date(vacances.getFinDeVacance().getTime()));
            pstm.setString(3, vacances.getEmpId());
            pstm.setLong(4, vacances.getNombre());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean updateEmploye(Employe employe) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE employe SET nom=?,prenom=?,date_de_naissance=?,sex=?,fonction=?,diplome=?,telephone_residence=?,cellulaire=?,numero_de_rue=?,code_postale=?,ville=?,pays=?,etat=?,email=?,status=? WHERE emp_id=?")) {
            pstm.setString(1, employe.getNom());
            pstm.setString(2, employe.getPrenom());
            pstm.setDate(3, new Date(employe.getDateDeNaissance().getTime()));
            pstm.setString(4, employe.getSex());
            pstm.setString(5, employe.getFonction());
            pstm.setString(6, employe.getDiplome());
            pstm.setString(7, employe.getTelephoneResidence());
            pstm.setString(8, employe.getCellulaire());
            pstm.setString(9, employe.getNumeroDeRue());
            pstm.setString(10, employe.getCodePostale());
            pstm.setString(11, employe.getVille());
            pstm.setString(12, employe.getPays());
            pstm.setString(13, employe.getEtat());
            pstm.setString(14, employe.getEmail());
            pstm.setString(15, employe.getStatus());
            pstm.setString(16, employe.getEmpId());
            //number of row affected
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

    @Override
    public boolean updateSalary(java.util.Date lastModified, String salary, String id) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement insertSalary = connection.prepareStatement("INSERT INTO salaire_historique(" + "emp_id,last_modified ,montant)" + "VALUES (?,?,?)");
                PreparedStatement pstm = connection.prepareStatement("UPDATE employe SET montant_salaire=? WHERE emp_id=?")) {
            insertSalary.setString(1, id);
            insertSalary.setDate(2, new Date(lastModified.getTime()));
            insertSalary.setString(3, salary);

            pstm.setString(1, salary);
            pstm.setString(2, id);

            int insSal = insertSalary.executeUpdate();
            int UpSal = pstm.executeUpdate();
            if (insSal != 0 && UpSal != 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<SalaireHistorique> getSalaryHistories() {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT * FROM salaire_historique");) {

            ResultSet rs = p.executeQuery();

            List<SalaireHistorique> SalaryHistories = new ArrayList<>();
            while (rs.next()) {

                SalaireHistorique salaryHistory = new SalaireHistorique();
                salaryHistory.setLastModified(rs.getDate("last_modified"));
                salaryHistory.setMontant(rs.getString("montant"));

                SalaryHistories.add(salaryHistory);

            }
            return SalaryHistories;
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean deleteEmploye(String id) {
        try {
            Connection connection = ConnectionFactory.getConnection();
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM employe WHERE id=" + id);
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
    
     @Override
    public List<Employe> getAllTechniciensTerrain() {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT emp_id,nom,prenom  FROM employe where fonction=?")) {
            p.setString(1, "Field Technician");

            ResultSet rs = p.executeQuery();

            List<Employe> arpenteurs = new ArrayList<>();
            while (rs.next()) {

                Employe employe = extractArpenteurFromRs(rs);
                arpenteurs.add(employe);

            }
            return arpenteurs;
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpImgDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
