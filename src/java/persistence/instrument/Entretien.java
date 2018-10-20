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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "entretien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Entretien.findAll", query = "SELECT e FROM Entretien e")
    , @NamedQuery(name = "Entretien.findById", query = "SELECT e FROM Entretien e WHERE e.id = :id")
    , @NamedQuery(name = "Entretien.findByCout", query = "SELECT e FROM Entretien e WHERE e.cout = :cout")
    , @NamedQuery(name = "Entretien.findByDetails", query = "SELECT e FROM Entretien e WHERE e.details = :details")
    , @NamedQuery(name = "Entretien.findByDateEntretien", query = "SELECT e FROM Entretien e WHERE e.dateEntretien = :dateEntretien")})
public class Entretien implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cout")
    private String cout;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "details")
    private String details;
    @Column(name = "date_entretien")
    @Temporal(TemporalType.DATE)
    private Date dateEntretien;
    
    private String numeroDeSerie;
    private long fournisseurId;
    private String fournisseurName;

    public Entretien() {
    }

    public Entretien(Long id) {
        this.id = id;
    }

    public Entretien(Long id, String cout, String details) {
        this.id = id;
        this.cout = cout;
        this.details = details;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCout() {
        return cout;
    }

    public void setCout(String cout) {
        this.cout = cout;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Date getDateEntretien() {
        return dateEntretien;
    }

    public void setDateEntretien(Date dateEntretien) {
        this.dateEntretien = dateEntretien;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Entretien)) {
            return false;
        }
        Entretien other = (Entretien) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.instrument.Entretien[ id=" + id + " ]";
    }

    public String getNumeroDeSerie() {
        return numeroDeSerie;
    }

    public void setNumeroDeSerie(String numeroDeSerie) {
        this.numeroDeSerie = numeroDeSerie;
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
    
}
