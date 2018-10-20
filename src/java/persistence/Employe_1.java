/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import persistence.employe.EmpImg;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name = "employe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Employe_1.findAll", query = "SELECT e FROM Employe_1 e")
    , @NamedQuery(name = "Employe_1.findByEmpId", query = "SELECT e FROM Employe_1 e WHERE e.empId = :empId")
    , @NamedQuery(name = "Employe_1.findByNom", query = "SELECT e FROM Employe_1 e WHERE e.nom = :nom")
    , @NamedQuery(name = "Employe_1.findByPrenom", query = "SELECT e FROM Employe_1 e WHERE e.prenom = :prenom")
    , @NamedQuery(name = "Employe_1.findByDateDeNaissance", query = "SELECT e FROM Employe_1 e WHERE e.dateDeNaissance = :dateDeNaissance")
    , @NamedQuery(name = "Employe_1.findBySex", query = "SELECT e FROM Employe_1 e WHERE e.sex = :sex")
    , @NamedQuery(name = "Employe_1.findByFonction", query = "SELECT e FROM Employe_1 e WHERE e.fonction = :fonction")
    , @NamedQuery(name = "Employe_1.findByDiplome", query = "SELECT e FROM Employe_1 e WHERE e.diplome = :diplome")
    , @NamedQuery(name = "Employe_1.findByTelephoneResidence", query = "SELECT e FROM Employe_1 e WHERE e.telephoneResidence = :telephoneResidence")
    , @NamedQuery(name = "Employe_1.findByCellulaire", query = "SELECT e FROM Employe_1 e WHERE e.cellulaire = :cellulaire")
    , @NamedQuery(name = "Employe_1.findByNumeroDeRue", query = "SELECT e FROM Employe_1 e WHERE e.numeroDeRue = :numeroDeRue")
    , @NamedQuery(name = "Employe_1.findByCodePostale", query = "SELECT e FROM Employe_1 e WHERE e.codePostale = :codePostale")
    , @NamedQuery(name = "Employe_1.findByVille", query = "SELECT e FROM Employe_1 e WHERE e.ville = :ville")
    , @NamedQuery(name = "Employe_1.findByPays", query = "SELECT e FROM Employe_1 e WHERE e.pays = :pays")
    , @NamedQuery(name = "Employe_1.findByEtat", query = "SELECT e FROM Employe_1 e WHERE e.etat = :etat")
    , @NamedQuery(name = "Employe_1.findByEmail", query = "SELECT e FROM Employe_1 e WHERE e.email = :email")
    , @NamedQuery(name = "Employe_1.findByMontantSalaire", query = "SELECT e FROM Employe_1 e WHERE e.montantSalaire = :montantSalaire")
    , @NamedQuery(name = "Employe_1.findByDateDePayement", query = "SELECT e FROM Employe_1 e WHERE e.dateDePayement = :dateDePayement")
    , @NamedQuery(name = "Employe_1.findByStatus", query = "SELECT e FROM Employe_1 e WHERE e.status = :status")})
public class Employe_1 implements Serializable {

    private static final long serialVersionUID = 1L;
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
    private int telephoneResidence;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cellulaire")
    private int cellulaire;
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
    private float montantSalaire;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_de_payement")
    @Temporal(TemporalType.DATE)
    private Date dateDePayement;
    @Size(max = 2147483647)
    @Column(name = "status")
    private String status;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "employe")
    private EmpImg empimage;

    public Employe_1() {
    }

    public Employe_1(String empId) {
        this.empId = empId;
    }

    public Employe_1(String empId, String nom, String prenom, Date dateDeNaissance, String sex, String fonction, String diplome, int telephoneResidence, int cellulaire, String numeroDeRue, String codePostale, String ville, String pays, String etat, String email, float montantSalaire, Date dateDePayement) {
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

    public int getTelephoneResidence() {
        return telephoneResidence;
    }

    public void setTelephoneResidence(int telephoneResidence) {
        this.telephoneResidence = telephoneResidence;
    }

    public int getCellulaire() {
        return cellulaire;
    }

    public void setCellulaire(int cellulaire) {
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

    public float getMontantSalaire() {
        return montantSalaire;
    }

    public void setMontantSalaire(float montantSalaire) {
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

    public EmpImg getEmpimage() {
        return empimage;
    }

    public void setEmpimage(EmpImg empimage) {
        this.empimage = empimage;
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
        if (!(object instanceof Employe_1)) {
            return false;
        }
        Employe_1 other = (Employe_1) object;
        if ((this.empId == null && other.empId != null) || (this.empId != null && !this.empId.equals(other.empId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.Employe_1[ empId=" + empId + " ]";
    }
    
}
