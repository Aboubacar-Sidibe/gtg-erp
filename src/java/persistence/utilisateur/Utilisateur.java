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
public class Utilisateur {

    private String id = null;
    private String nom = null;
    private String mot_de_passe = null;
    private String fonction = null;
    private String mail = null;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getMot_de_passe() {
        return mot_de_passe;
    }

    public void setMot_de_passe(String mot_de_passe) {
        this.mot_de_passe = mot_de_passe;
    }

    public Utilisateur() {
    }

    void setFonction(String fonction) {
        this.fonction = fonction;

    }

    public String getFonction() {
        return fonction;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    

}
