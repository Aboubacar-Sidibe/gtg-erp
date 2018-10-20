/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import java.util.List;
import persistence.employe.*;

/**
 *
 * @author macbookpro
 */
public interface EmpImgDAO {
    
    
    
    boolean insertEmpImg(EmpImg em);

    boolean updateEmpImg(EmpImg em);

    boolean deleteEmpImg(String id);
    
    
}
