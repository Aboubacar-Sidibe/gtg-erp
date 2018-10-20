/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import persistence.employe.*;
import java.util.Date;
import java.util.List;
import persistence.employe.SalaireHistorique;

/**
 *
 * @author macbookpro
 */
public interface EmployeDAO {

    Employe getEmploye(String id);

    List<Employe> getAllEmployes(int start, int total);

    boolean insertVacance(EmployeVacances vacances);

    boolean insertEmploye(Employe employe);

    boolean updateEmploye(Employe employe);

    boolean updateSalary(Date lastModified, String salary, String id);

    List<SalaireHistorique> getSalaryHistories();

    boolean deleteEmploye(String id);

    public List getAllEmployesNames();

    List<Employe> getAllTechniciensTerrain();

}
