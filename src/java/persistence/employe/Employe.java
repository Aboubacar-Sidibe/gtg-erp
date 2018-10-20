/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import persistence.employe.*;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author macbookpro
 */
public class Employe {

    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "emp_id")
    private String empId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "nom")
    private String nom;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "prenom")
    private String prenom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_de_naissance")
    @Temporal(TemporalType.DATE)
    private Date dateDeNaissance;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "sex")
    private String sex;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "fonction")
    private String fonction;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "diplome")
    private String diplome;
    @Basic(optional = false)
    @NotNull
    @Column(name = "telephone_residence")
    private String telephoneResidence;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cellulaire")
    private String cellulaire;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "numero_de_rue")
    private String numeroDeRue;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "code_postale")
    private String codePostale;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "ville")
    private String ville;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "pays")
    private String pays;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "etat")
    private String etat;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Column(name = "montant_salaire")
    private String montantSalaire;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_de_payement")
    @Temporal(TemporalType.DATE)
    private Date dateDePayement;

    @Size(max = 2147483647)
    @Column(name = "status")
    private String status;

    private String dateDePayementStr;
    private String dateDeNaissanceStr;

    public Employe() {
    }

    public Employe(String empId) {
        this.empId = empId;
    }

    public Employe(String empId, String nom, String prenom, Date dateDeNaissance, String sex, String fonction, String diplome, String telephoneResidence, String cellulaire, String numeroDeRue, String codePostale, String ville, String pays, String etat, String email, String montantSalaire, Date dateDePayement) {
        this.empId = empId;
        this.nom = nom;
        this.prenom = prenom;
        this.dateDeNaissance = dateDeNaissance;
        this.sex = sex;
        this.fonction = fonction;
        this.diplome = diplome;
        this.telephoneResidence = telephoneResidence;
        this.cellulaire = cellulaire;
        this.numeroDeRue = numeroDeRue;
        this.codePostale = codePostale;
        this.ville = ville;
        this.pays = pays;
        this.etat = etat;
        this.email = email;
        this.montantSalaire = montantSalaire;
        this.dateDePayement = dateDePayement;

    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Date getDateDeNaissance() {
        return dateDeNaissance;
    }

    public void setDateDeNaissance(Date dateDeNaissance) {
        this.dateDeNaissance = dateDeNaissance;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getFonction() {
        return fonction;
    }

    public void setFonction(String fonction) {
        this.fonction = fonction;
    }

    public String getDiplome() {
        return diplome;
    }

    public void setDiplome(String diplome) {
        this.diplome = diplome;
    }

    public String getTelephoneResidence() {
        return telephoneResidence;
    }

    public void setTelephoneResidence(String telephoneResidence) {
        this.telephoneResidence = telephoneResidence;
    }

    public String getCellulaire() {
        return cellulaire;
    }

    public void setCellulaire(String cellulaire) {
        this.cellulaire = cellulaire;
    }

    public String getNumeroDeRue() {
        return numeroDeRue;
    }

    public void setNumeroDeRue(String numeroDeRue) {
        this.numeroDeRue = numeroDeRue;
    }

    public String getCodePostale() {
        return codePostale;
    }

    public void setCodePostale(String codePostale) {
        this.codePostale = codePostale;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getPays() {
        return pays;
    }

    public void setPays(String pays) {
        this.pays = pays;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMontantSalaire() {
        return montantSalaire;
    }

    public void setMontantSalaire(String montantSalaire) {
        this.montantSalaire = montantSalaire;
    }

    public Date getDateDePayement() {
        return dateDePayement;
    }

    public void setDateDePayement(Date dateDePayement) {
        this.dateDePayement = dateDePayement;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (empId != null ? empId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Employe)) {
            return false;
        }
        Employe other = (Employe) object;
        if ((this.empId == null && other.empId != null) || (this.empId != null && !this.empId.equals(other.empId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.Employe[ empId=" + empId + " ]";
    }

    public String getDateDePayementStr() {
        return dateDePayementStr;
    }

    public void setDateDePayementStr(String dateDePayementStr) {
        this.dateDePayementStr = dateDePayementStr;
    }

    public String getDateDeNaissanceStr() {
        return dateDeNaissanceStr;
    }

    public void setDateDeNaissanceStr(String dateDeNaissanceStr) {
        this.dateDeNaissanceStr = dateDeNaissanceStr;
    }

}
