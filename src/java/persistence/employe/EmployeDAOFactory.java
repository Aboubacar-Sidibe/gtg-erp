/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import persistence.employe.*;

/**
 *
 * @author macbookpro
 */
public class EmployeDAOFactory {
    
    public static EmployeDAO createEmploye()
    {
        return new EmployeDAOPostImpl();
    }
    
}
