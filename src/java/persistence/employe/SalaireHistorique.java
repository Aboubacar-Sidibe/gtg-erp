/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.employe;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 *
 * @author macbookpro
 */

public class SalaireHistorique  {

    private static final long serialVersionUID = 1L;
    
    private Date lastModified;
    private String lastModifiedStr;
    
    private String montant;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
   
    private String empId;

    public SalaireHistorique() {
    }

    public SalaireHistorique(Long id) {
        this.id = id;
    }

    public SalaireHistorique(Long id, Date lastModified, String montant) {
        this.id = id;
        this.lastModified = lastModified;
        this.montant = montant;
    }

    public Date getLastModified() {
        return lastModified;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }

    public String getMontant() {
        return montant;
    }

    public void setMontant(String montant) {
        this.montant = montant;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
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
        if (!(object instanceof SalaireHistorique)) {
            return false;
        }
        SalaireHistorique other = (SalaireHistorique) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.SalaireHistorique[ id=" + id + " ]";
    }

    public String getLastModifiedStr() {
        return lastModifiedStr;
    }

    public void setLastModifiedStr(String lastModifiedStr) {
        this.lastModifiedStr = lastModifiedStr;
    }

    
    
}
