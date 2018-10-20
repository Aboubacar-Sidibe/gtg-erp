/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.travaux;

import java.util.Date;

/**
 *
 * @author macbookpro
 */
public class Travaux {

    private Long travailId;

    private String dossier;

    private String client;

    private String typeDeTravail;

    private String status;

    private String lieu;

    private String dureEstime;

    private Date deadline;

    private String deadlineStr;

    private Date rendezVous;

    private String rendezVousStr;

    private String chef;

    private String donneur;

    private String notes;
    
    private String color="";

    public Travaux() {
    }

    public Travaux(Long travailId) {
        this.travailId = travailId;
    }

    public Travaux(Long travailId, String dossier, String client, String typeDeTravail, String status, Date deadline) {
        this.travailId = travailId;
        this.dossier = dossier;
        this.client = client;
        this.typeDeTravail = typeDeTravail;
        this.status = status;
        this.deadline = deadline;
    }

    public Long getTravailId() {
        return travailId;
    }

    public void setTravailId(Long travailId) {
        this.travailId = travailId;
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

    public String getTypeDeTravail() {
        return typeDeTravail;
    }

    public void setTypeDeTravail(String typeDeTravail) {
        this.typeDeTravail = typeDeTravail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getDureEstime() {
        return dureEstime;
    }

    public void setDureEstime(String dureEstime) {
        this.dureEstime = dureEstime;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Date getRendezVous() {
        return rendezVous;
    }

    public void setRendezVous(Date rendezVous) {
        this.rendezVous = rendezVous;
    }

    public String getChef() {
        return chef;
    }

    public void setChef(String chef) {
        this.chef = chef;
    }

    public String getDonneur() {
        return donneur;
    }

    public void setDonneur(String donneur) {
        this.donneur = donneur;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (travailId != null ? travailId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Travaux)) {
            return false;
        }
        Travaux other = (Travaux) object;
        if ((this.travailId == null && other.travailId != null) || (this.travailId != null && !this.travailId.equals(other.travailId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "persistence.Travaux[ travailId=" + travailId + " ]";
    }

    public String getDeadlineStr() {
        return deadlineStr;
    }

    public void setDeadlineStr(String deadlineStr) {
        this.deadlineStr = deadlineStr;
    }

    public String getRendezVousStr() {
        return rendezVousStr;
    }

    public void setRendezVousStr(String rendezVousStr) {
        this.rendezVousStr = rendezVousStr;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}
