/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.fournisseurs;

import persistence.*;
import java.util.List;


/**
 *
 * @author macbookpro
 */
public interface FournisseurDAO
{
     
    boolean insertFournisseur(Fournisseur fournisseur);
    boolean updateFournisseur(Fournisseur fournisseur);
    List<Fournisseur> getAllFournisseurs();
    
    
}
