/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.utilisateur;

import java.util.List;

/**
 *
 * @author macbookpro
 */
public interface UtilisateurDAO {
    

    Utilisateur getUtilisateur(String id);

    List<Utilisateur> getTousLesUtilisateurs();

    Utilisateur getUtilisateurParNomETMotDePasse(String nom,String motdepasse);
    
    boolean isEmployee(Utilisateur utilisateur);

    boolean insertUtilisateur(Utilisateur utilisateur);

    boolean updateUtilisateur(Utilisateur utilisateur);

    boolean deleteUtilisateur(int id);

}
