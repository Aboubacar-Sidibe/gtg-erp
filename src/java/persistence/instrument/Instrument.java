/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.instrument;

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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name = "instrument")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Instrument.findAll", query = "SELECT i FROM Instrument i")
    , @NamedQuery(name = "Instrument.findByNumeroDeSerie", query = "SELECT i FROM Instrument i WHERE i.numeroDeSerie = :numeroDeSerie")
    , @NamedQuery(name = "Instrument.findByNom", query = "SELECT i FROM Instrument i WHERE i.nom = :nom")
    , @NamedQuery(name = "Instrument.findByMarque", query = "SELECT i FROM Instrument i WHERE i.marque = :marque")
    , @NamedQuery(name = "Instrument.findByModel", query = "SELECT i FROM Instrument i WHERE i.model = :model")
    , @NamedQuery(name = "Instrument.findByVersion", query = "SELECT i FROM Instrument i WHERE i.version = :version")
    , @NamedQuery(name = "Instrument.findByNumero", query = "SELECT i FROM Instrument i WHERE i.numero = :numero")
    , @NamedQuery(name = "Instrument.findByType", query = "SELECT i FROM Instrument i WHERE i.type = :type")
    , @NamedQuery(name = "Instrument.findByCouleur", query = "SELECT i FROM Instrument i WHERE i.couleur = :couleur")
    , @NamedQuery(name = "Instrument.findByCompatibilite", query = "SELECT i FROM Instrument i WHERE i.compatibilite = :compatibilite")
    , @NamedQuery(name = "Instrument.findByDisponibilite", query = "SELECT i FROM Instrument i WHERE i.disponibilite = :disponibilite")
    , @NamedQuery(name = "Instrument.findByDateDacquisition", query = "SELECT i FROM Instrument i WHERE i.dateDacquisition = :dateDacquisition")
    , @NamedQuery(name = "Instrument.findByCoutDacquisition", query = "SELECT i FROM Instrument i WHERE i.coutDacquisition = :coutDacquisition")
    , @NamedQuery(name = "Instrument.findByFinGarantie", query = "SELECT i FROM Instrument i WHERE i.finGarantie = :finGarantie")
    , @NamedQuery(name = "Instrument.findByAbbreviation", query = "SELECT i FROM Instrument i WHERE i.abbreviation = :abbreviation")
    , @NamedQuery(name = "Instrument.findByActif", query = "SELECT i FROM Instrument i WHERE i.actif = :actif")})
public class Instrument implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "numero_de_serie")
    private String numeroDeSerie;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "nom")
    private String nom;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "marque")
    private String marque;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "model")
    private String model;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "version")
    private String version;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numero")
    private String numero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "type")
    private String type;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "couleur")
    private String couleur;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "compatibilite")
    private String compatibilite;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "disponibilite")
    private String disponibilite;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_dacquisition")
    @Temporal(TemporalType.DATE)
    private Date dateDacquisition;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cout_dacquisition")
    private String coutDacquisition;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fin_garantie")
    @Temporal(TemporalType.DATE)
    private Date finGarantie;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "abbreviation")
    private String abbreviation;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "actif")
    private String actif;
    private long fournisseurId;
    private String fournisseurName;
    private String dateDacquisitionStr;
    private String finGarantieStr;
    

    public Instrument() {
    }

    public Instrument(String numeroDeSerie) {
        this.numeroDeSerie = numeroDeSerie;
    }

    public Instrument(String numeroDeSerie, String nom, String marque, String model, String version, String numero, String type, String couleur, String compatibilite, String disponibilite, Date dateDacquisition, String coutDacquisition, Date finGarantie, String abbreviation, String actif) {
        this.numeroDeSerie = numeroDeSerie;
        this.nom = nom;
        this.marque = marque;
        this.model = model;
        this.version = version;
        this.numero = numero;
        this.type = type;
        this.couleur = couleur;
        this.compatibilite = compatibilite;
        this.disponibilite = disponibilite;
        this.dateDacquisition = dateDacquisition;
        this.coutDacquisition = coutDacquisition;
        this.finGarantie = finGarantie;
        this.abbreviation = abbreviation;
        this.actif = actif;
    }

    public String getNumeroDeSerie() {
        return numeroDeSerie;
    }

    public void setNumeroDeSerie(String numeroDeSerie) {
        this.numeroDeSerie = numeroDeSerie;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCouleur() {
        return couleur;
    }

    public void setCouleur(String couleur) {
        this.couleur = couleur;
    }

    public String getCompatibilite() {
        return compatibilite;
    }

    public void setCompatibilite(String compatibilite) {
        this.compatibilite = compatibilite;
    }

    public String getDisponibilite() {
        return disponibilite;
    }

    public void setDisponibilite(String disponibilite) {
        this.disponibilite = disponibilite;
    }

    public Date getDateDacquisition() {
        return dateDacquisition;
    }

    public void setDateDacquisition(Date dateDacquisition) {
        this.dateDacquisition = dateDacquisition;
    }

    public String getCoutDacquisition() {
        return coutDacquisition;
    }

    public void setCoutDacquisition(String coutDacquisition) {
        this.coutDacquisition = coutDacquisition;
    }

    public Date getFinGarantie() {
        return finGarantie;
    }

    public void setFinGarantie(Date finGarantie) {
        this.finGarantie = finGarantie;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public void setAbbreviation(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    public String getActif() {
        return actif;
    }

    public void setActif(String actif) {
        this.actif = actif;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numeroDeSerie != null ? numeroDeSerie.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Instrument)) {
            return false;
        }
        Instrument other = (Instrument) object;
        if ((this.numeroDeSerie == null && other.numeroDeSerie != null) || (this.numeroDeSerie != null && !this.numeroDeSerie.equals(other.numeroDeSerie))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.instrument.Instrument[ numeroDeSerie=" + numeroDeSerie + " ]";
    }

    public long getFournisseurId() {
        return fournisseurId;
    }

    public void setFournisseurId(long fournisseurId) {
        this.fournisseurId = fournisseurId;
    }

    public String getFournisseurName() {
        return fournisseurName;
    }

    public void setFournisseurName(String fournisseurName) {
        this.fournisseurName = fournisseurName;
    }

    public String getDateDacquisitionStr() {
        return dateDacquisitionStr;
    }

    public void setDateDacquisitionStr(String dateDacquisitionStr) {
        this.dateDacquisitionStr = dateDacquisitionStr;
    }

    public String getFinGarantieStr() {
        return finGarantieStr;
    }

    public void setFinGarantieStr(String finGarantieStr) {
        this.finGarantieStr = finGarantieStr;
    }
    
}
