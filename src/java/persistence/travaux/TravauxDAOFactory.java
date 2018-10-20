/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.travaux;

/**
 *
 * @author macbookpro
 */
public class TravauxDAOFactory {
    
     
    public static TravauxDAO createTravaux()
    {
        return new TravauxDAOPostImpl();
    }
    
    
}
