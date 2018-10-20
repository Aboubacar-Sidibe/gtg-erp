/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author macbookpro
 */
@Entity
@Table(name = "repartion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Repartion.findAll", query = "SELECT r FROM Repartion r")
    , @NamedQuery(name = "Repartion.findById", query = "SELECT r FROM Repartion r WHERE r.id = :id")
    , @NamedQuery(name = "Repartion.findByDate", query = "SELECT r FROM Repartion r WHERE r.date = :date")
    , @NamedQuery(name = "Repartion.findByLundi", query = "SELECT r FROM Repartion r WHERE r.lundi = :lundi")
    , @NamedQuery(name = "Repartion.findByMardi", query = "SELECT r FROM Repartion r WHERE r.mardi = :mardi")
    , @NamedQuery(name = "Repartion.findByMercredi", query = "SELECT r FROM Repartion r WHERE r.mercredi = :mercredi")
    , @NamedQuery(name = "Repartion.findByJeudi", query = "SELECT r FROM Repartion r WHERE r.jeudi = :jeudi")
    , @NamedQuery(name = "Repartion.findByVendredi", query = "SELECT r FROM Repartion r WHERE r.vendredi = :vendredi")})
public class Repartion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "date")
    private String date;
    @Size(max = 2147483647)
    @Column(name = "lundi")
    private String lundi;
    @Size(max = 2147483647)
    @Column(name = "mardi")
    private String mardi;
    @Size(max = 2147483647)
    @Column(name = "mercredi")
    private String mercredi;
    @Size(max = 2147483647)
    @Column(name = "jeudi")
    private String jeudi;
    @Size(max = 2147483647)
    @Column(name = "vendredi")
    private String vendredi;
    private String samedi;
    private String[] trlist;

    public Repartion() {
    }

    public Repartion(Long id) {
        this.id = id;
    }

    public Repartion(Long id, String date) {
        this.id = id;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLundi() {
        return lundi;
    }

    public void setLundi(String lundi) {
        this.lundi = lundi;
    }

    public String getMardi() {
        return mardi;
    }

    public void setMardi(String mardi) {
        this.mardi = mardi;
    }

    public String getMercredi() {
        return mercredi;
    }

    public void setMercredi(String mercredi) {
        this.mercredi = mercredi;
    }

    public String getJeudi() {
        return jeudi;
    }

    public void setJeudi(String jeudi) {
        this.jeudi = jeudi;
    }

    public String getVendredi() {
        return vendredi;
    }

    public void setVendredi(String vendredi) {
        this.vendredi = vendredi;
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
        if (!(object instanceof Repartion)) {
            return false;
        }
        Repartion other = (Repartion) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.repartition.Repartion[ id=" + id + " ]";
    }

    public String getSamedi() {
        return samedi;
    }

    public void setSamedi(String samedi) {
        this.samedi = samedi;
    }

    public String[] getTrlist() {
        return trlist;
    }

    public void setTrlist(String[] trlist) {
        this.trlist = trlist;
    }

}
