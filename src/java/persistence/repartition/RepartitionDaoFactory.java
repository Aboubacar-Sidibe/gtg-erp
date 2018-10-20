/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition;

/**
 *
 * @author macbookpro
 */
public class RepartitionDaoFactory {
    
     public static RepartionDao createRepartition()
    {
        return new RepartionDaoImpl();
    }
    
}
