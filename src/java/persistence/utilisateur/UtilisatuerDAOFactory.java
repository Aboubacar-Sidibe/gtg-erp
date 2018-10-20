/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.utilisateur;

/**
 *
 * @author macbookpro
 */
public class UtilisatuerDAOFactory {
    
    public static UtilisateurDAO createUtilisateur()
    {
        return new UtilisatuerDAOPostImpl();
    }
    
}
