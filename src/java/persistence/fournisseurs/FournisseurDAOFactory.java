/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.fournisseurs;

import persistence.*;

/**
 *
 * @author macbookpro
 */
public class FournisseurDAOFactory {
    
    public static FournisseurDAO createFournisseur()
    {
        return new FournisseurDAOImpl();
    }
    
}
