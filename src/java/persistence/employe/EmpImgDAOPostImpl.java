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

/**
 *
 * @author macbookpro
 */
public class EmpImgDAOPostImpl implements EmpImgDAO {


    @Override
    public boolean insertEmpImg(EmpImg em) {

        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO empimage(" + "emp_id, img)" + "VALUES (?,?)")) {
            pstm.setString(1, em.getEmpId());
            pstm.setString(2, em.getImg());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            try {
                throw new Exception(ex.toString());
            } catch (Exception ex1) {
                Logger.getLogger(EmpImgDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex1);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    @Override
    public boolean updateEmpImg(EmpImg em) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE empimage SET img=? WHERE emp_id=?")) {
            pstm.setString(1, em.getImg());
            pstm.setString(2, em.getEmpId());

            //number of row affected
            int i = pstm.executeUpdate();

            if (i != 0) {
                return true;
            }

        } catch (SQLException ex) {
            try {
                throw new Exception(ex.toString());
            } catch (Exception ex1) {
                Logger.getLogger(EmpImgDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean deleteEmpImg(String id) {
        try {
            Connection connection = ConnectionFactory.getConnection();
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM empimage WHERE emp_id=" + id);
            if (i != 0) {
                return true;
            }
        } catch (SQLException ex) {
            try {
                throw new Exception(ex.toString());
            } catch (Exception ex1) {
                Logger.getLogger(EmpImgDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmployeDAOPostImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

   

}
