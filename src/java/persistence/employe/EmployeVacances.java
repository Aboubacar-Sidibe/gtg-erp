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
@Entity
@Table(name = "employe_vacances")
@NamedQueries({
    @NamedQuery(name = "EmployeVacances.findAll", query = "SELECT e FROM EmployeVacances e")})
public class EmployeVacances implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "debut_de_vacance")
    @Temporal(TemporalType.DATE)
    private Date debutDeVacance;
    @Column(name = "fin_de_vacance")
    @Temporal(TemporalType.DATE)
    private Date finDeVacance;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "emp_id")
    private String empId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "nombre")
    private long nombre;
    
    private String debutDeVacanceStr;
    private String finDeVacanceStr;

    public EmployeVacances() {
    }

    public EmployeVacances(String empId) {
        this.empId = empId;
    }

    public EmployeVacances(String empId, long nombre) {
        this.empId = empId;
        this.nombre = nombre;
    }

    public Date getDebutDeVacance() {
        return debutDeVacance;
    }

    public void setDebutDeVacance(Date debutDeVacance) {
        this.debutDeVacance = debutDeVacance;
    }

    public Date getFinDeVacance() {
        return finDeVacance;
    }

    public void setFinDeVacance(Date finDeVacance) {
        this.finDeVacance = finDeVacance;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public long getNombre() {
        return nombre;
    }

    public void setNombre(long nombre) {
        this.nombre = nombre;
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
        if (!(object instanceof EmployeVacances)) {
            return false;
        }
        EmployeVacances other = (EmployeVacances) object;
        if ((this.empId == null && other.empId != null) || (this.empId != null && !this.empId.equals(other.empId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.EmployeVacances[ empId=" + empId + " ]";
    }

    public String getDebutDeVacanceStr() {
        return debutDeVacanceStr;
    }

    public void setDebutDeVacanceStr(String debutDeVacanceStr) {
        this.debutDeVacanceStr = debutDeVacanceStr;
    }

    public String getFinDeVacanceStr() {
        return finDeVacanceStr;
    }

    public void setFinDeVacanceStr(String finDeVacanceStr) {
        this.finDeVacanceStr = finDeVacanceStr;
    }
    
}
