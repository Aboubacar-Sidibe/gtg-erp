/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dessinateur;

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
@Table(name = "dessinateur")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Dessinateur.findAll", query = "SELECT d FROM Dessinateur d")
    , @NamedQuery(name = "Dessinateur.findById", query = "SELECT d FROM Dessinateur d WHERE d.id = :id")
    , @NamedQuery(name = "Dessinateur.findByBureau", query = "SELECT d FROM Dessinateur d WHERE d.bureau = :bureau")
    , @NamedQuery(name = "Dessinateur.findByDossier", query = "SELECT d FROM Dessinateur d WHERE d.dossier = :dossier")
    , @NamedQuery(name = "Dessinateur.findByClient", query = "SELECT d FROM Dessinateur d WHERE d.client = :client")
    , @NamedQuery(name = "Dessinateur.findByLieu", query = "SELECT d FROM Dessinateur d WHERE d.lieu = :lieu")
    , @NamedQuery(name = "Dessinateur.findByTypeDeMandat", query = "SELECT d FROM Dessinateur d WHERE d.typeDeMandat = :typeDeMandat")
    , @NamedQuery(name = "Dessinateur.findByTypeDeTravail", query = "SELECT d FROM Dessinateur d WHERE d.typeDeTravail = :typeDeTravail")
    , @NamedQuery(name = "Dessinateur.findByDuree", query = "SELECT d FROM Dessinateur d WHERE d.duree = :duree")
    , @NamedQuery(name = "Dessinateur.findByDeadline", query = "SELECT d FROM Dessinateur d WHERE d.deadline = :deadline")
    , @NamedQuery(name = "Dessinateur.findByPriorite", query = "SELECT d FROM Dessinateur d WHERE d.priorite = :priorite")
    , @NamedQuery(name = "Dessinateur.findBySaisiePar", query = "SELECT d FROM Dessinateur d WHERE d.saisiePar = :saisiePar")
    , @NamedQuery(name = "Dessinateur.findByDateDeSaisie", query = "SELECT d FROM Dessinateur d WHERE d.dateDeSaisie = :dateDeSaisie")
    , @NamedQuery(name = "Dessinateur.findByNotes", query = "SELECT d FROM Dessinateur d WHERE d.notes = :notes")
    , @NamedQuery(name = "Dessinateur.findByStatus", query = "SELECT d FROM Dessinateur d WHERE d.status = :status")
    , @NamedQuery(name = "Dessinateur.findByDateStatus", query = "SELECT d FROM Dessinateur d WHERE d.dateStatus = :dateStatus")
    , @NamedQuery(name = "Dessinateur.findByResponsable", query = "SELECT d FROM Dessinateur d WHERE d.responsable = :responsable")})
public class Dessinateur implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "id")
    private long id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "bureau")
    private String bureau;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "dossier")
    private String dossier;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "client")
    private String client;
    @Size(max = 2147483647)
    @Column(name = "lieu")
    private String lieu;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "type_de_mandat")
    private String typeDeMandat;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "type_de_travail")
    private String typeDeTravail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "duree")
    private String duree;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deadline")
    @Temporal(TemporalType.DATE)
    private String deadline;
    @Basic(optional = false)
    @NotNull
    @Column(name = "priorite")
    private int priorite;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "saisie_par")
    private String saisiePar;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_de_saisie")
    @Temporal(TemporalType.DATE)
    private String dateDeSaisie;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "notes")
    private String notes;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "status")
    private String status;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_status")
    @Temporal(TemporalType.DATE)
    private String dateStatus;
    @Size(max = 2147483647)
    @Column(name = "responsable")
    private String responsable;
    private String deadlineStr;
    private String dateDeSaisieStr;
    private String dateStatusStr;
    
    private String color;
    

    public Dessinateur() {
    }

    public Dessinateur(String dossier) {
        this.dossier = dossier;
    }

    public Dessinateur(String dossier, long id, String bureau, String client, String typeDeMandat, String typeDeTravail, String duree, String deadline, int priorite, String saisiePar, String dateDeSaisie, String notes, String status, String dateStatus) {
        this.dossier = dossier;
        this.id = id;
        this.bureau = bureau;
        this.client = client;
        this.typeDeMandat = typeDeMandat;
        this.typeDeTravail = typeDeTravail;
        this.duree = duree;
        this.deadline = deadline;
        this.priorite = priorite;
        this.saisiePar = saisiePar;
        this.dateDeSaisie = dateDeSaisie;
        this.notes = notes;
        this.status = status;
        this.dateStatus = dateStatus;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getBureau() {
        return bureau;
    }

    public void setBureau(String bureau) {
        this.bureau = bureau;
    }

    public String getDossier() {
        return dossier;
    }

    public void setDossier(String dossier) {
        this.dossier = dossier;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getTypeDeMandat() {
        return typeDeMandat;
    }

    public void setTypeDeMandat(String typeDeMandat) {
        this.typeDeMandat = typeDeMandat;
    }

    public String getTypeDeTravail() {
        return typeDeTravail;
    }

    public void setTypeDeTravail(String typeDeTravail) {
        this.typeDeTravail = typeDeTravail;
    }

    public String getDuree() {
        return duree;
    }

    public void setDuree(String duree) {
        this.duree = duree;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public int getPriorite() {
        return priorite;
    }

    public void setPriorite(int priorite) {
        this.priorite = priorite;
    }

    public String getSaisiePar() {
        return saisiePar;
    }

    public void setSaisiePar(String saisiePar) {
        this.saisiePar = saisiePar;
    }

    public String getDateDeSaisie() {
        return dateDeSaisie;
    }

    public void setDateDeSaisie(String dateDeSaisie) {
        this.dateDeSaisie = dateDeSaisie;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDateStatus() {
        return dateStatus;
    }

    public void setDateStatus(String dateStatus) {
        this.dateStatus = dateStatus;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (dossier != null ? dossier.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Dessinateur)) {
            return false;
        }
        Dessinateur other = (Dessinateur) object;
        if ((this.dossier == null && other.dossier != null) || (this.dossier != null && !this.dossier.equals(other.dossier))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.dessinateur.Dessinateur[ dossier=" + dossier + " ]";
    }

    public String getDeadlineStr() {
        return deadlineStr;
    }

    public void setDeadlineStr(String deadlineStr) {
        this.deadlineStr = deadlineStr;
    }

    public String getDateDeSaisieStr() {
        return dateDeSaisieStr;
    }

    public void setDateDeSaisieStr(String dateDeSaisieStr) {
        this.dateDeSaisieStr = dateDeSaisieStr;
    }

    public String getDateStatusStr() {
        return dateStatusStr;
    }

    public void setDateStatusStr(String dateStatusStr) {
        this.dateStatusStr = dateStatusStr;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
}
