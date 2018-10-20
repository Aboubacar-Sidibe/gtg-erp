/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.instrument;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistence.ConnectionFactory;

/**
 *
 * @author macbookpro
 */
public class InstrumentDAOImpl implements InstrumentDAO {

    private Instrument extractEmployeFromResultSet(ResultSet rs) throws SQLException {
        Instrument instrument = new Instrument();
        instrument.setNumeroDeSerie(rs.getString("numero_de_serie"));
        instrument.setNom(rs.getString("nom"));
        instrument.setMarque(rs.getString("marque"));
        instrument.setModel(rs.getString("model"));
        instrument.setVersion(rs.getString("version"));
        instrument.setNumero(rs.getString("numero"));
        instrument.setType(rs.getString("type"));
        instrument.setCouleur(rs.getString("couleur"));
        instrument.setCompatibilite(rs.getString("compatibilite"));
        instrument.setDisponibilite(rs.getString("disponibilite"));
        instrument.setDateDacquisition(rs.getDate("date_dacquisition"));
        instrument.setCoutDacquisition(rs.getString("cout_dacquisition"));
        instrument.setFinGarantie(rs.getDate("fin_garantie"));
        instrument.setAbbreviation(rs.getString("abbreviation"));
        instrument.setActif(rs.getString("actif"));

        return instrument;
    }

    private Entretien extractEntretienFromResultSet(ResultSet rs) throws SQLException {
        Entretien entretien = new Entretien();
        entretien.setNumeroDeSerie(rs.getString("numero_de_serie"));
        entretien.setFournisseurId(rs.getLong("fournisseur_id"));
        
        entretien.setCout(rs.getString("cout"));
        entretien.setDetails(rs.getString("details"));
        entretien.setDateEntretien(rs.getDate("date_entretien"));

        return entretien;
    }

    @Override
    public boolean insertInstrument(Instrument instrument) {

        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO instrument(" + "numero_de_serie, nom, marque,model,version,numero,type,couleur,compatibilite,disponibilite,date_dacquisition,cout_dacquisition,fin_garantie,abbreviation,actif,fournisseur_id)" + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)")) {

            pstm.setString(1, instrument.getNumeroDeSerie());
            pstm.setString(2, instrument.getNom());
            pstm.setString(3, instrument.getMarque());
            pstm.setString(4, instrument.getModel());
            pstm.setString(5, instrument.getVersion());
            pstm.setString(6, instrument.getNumero());
            pstm.setString(7, instrument.getType());
            pstm.setString(8, instrument.getCouleur());
            pstm.setString(9, instrument.getCompatibilite());
            pstm.setString(10, instrument.getDisponibilite());
            pstm.setDate(11, new Date(instrument.getDateDacquisition().getTime()));
            pstm.setString(12, instrument.getCoutDacquisition());
            pstm.setDate(13, new Date(instrument.getFinGarantie().getTime()));
            pstm.setString(14, instrument.getAbbreviation());
            pstm.setString(15, instrument.getActif());
            pstm.setLong(16, instrument.getFournisseurId());

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstrumentDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    @Override
    public boolean updateInstrument(Instrument instrument) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("UPDATE  instrument SET  numero_de_serie=?,nom=?,marque=?,model=?,version=?,numero=?,type=?,couleur=?,compatibilite=?,disponibilite=?,date_dacquisition=?,cout_dacquisition=?,fin_garantie=?,abbreviation=? ,actif=?,fournisseur_id=?  WHERE  numero_de_serie=?")) {
            pstm.setString(1, instrument.getNumeroDeSerie());
            pstm.setString(2, instrument.getNom());
            pstm.setString(3, instrument.getMarque());
            pstm.setString(4, instrument.getModel());
            pstm.setString(5, instrument.getVersion());
            pstm.setString(6, instrument.getNumero());
            pstm.setString(7, instrument.getType());
            pstm.setString(8, instrument.getCouleur());
            pstm.setString(9, instrument.getCompatibilite());
            pstm.setString(10, instrument.getDisponibilite());
            pstm.setDate(11, new Date(instrument.getDateDacquisition().getTime()));
            pstm.setString(12, instrument.getCoutDacquisition());
            pstm.setDate(13, new Date(instrument.getFinGarantie().getTime()));
            pstm.setString(14, instrument.getAbbreviation());
            pstm.setString(15, instrument.getActif());
            pstm.setLong(16, instrument.getFournisseurId());
            pstm.setString(17, instrument.getNumeroDeSerie());

            int i = pstm.executeUpdate();
            if (i != 0) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstrumentDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean deleteInstrument(String numerodeserie) {
        try {
            Connection connection = ConnectionFactory.getConnection();
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("DELETE FROM instrument WHERE numero_de_serie=" + numerodeserie);
            if (i != 0) {
                return true;
            }
        } catch (SQLException ex) {
            try {
                throw new Exception(ex.toString());
            } catch (Exception ex1) {
                Logger.getLogger(InstrumentDAOImpl.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstrumentDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean insertEntretien(Entretien entretien) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement pstm = connection.prepareStatement("INSERT INTO entretien(" + "cout, details, numero_de_serie,fournisseur_id,date_entretien)" + "VALUES (?,?,?,?,?)")) {

            pstm.setString(1, entretien.getCout());
            pstm.setString(2, entretien.getDetails());
            pstm.setString(3, entretien.getNumeroDeSerie());
            pstm.setFloat(4, entretien.getFournisseurId());
            pstm.setDate(5, new Date(entretien.getDateEntretien().getTime()));

            int i = pstm.executeUpdate();
            if (i == 1) {
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstrumentDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<Entretien> getAllEntretien(String numeroDeSerie) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement p = connection.prepareStatement("SELECT * FROM entretien WHERE numero_de_serie=?")) {
            p.setString(1, numeroDeSerie);

            ResultSet rs = p.executeQuery();

            List<Entretien> entretiens = new ArrayList<>();
            while (rs.next()) {

                Entretien entretien = extractEntretienFromResultSet(rs);
                PreparedStatement pfn = connection.prepareStatement("SELECT nom FROM fournisseur WHERE id=?");
                pfn.setLong(1, entretien.getFournisseurId());
                ResultSet pfnRs = pfn.executeQuery();
                if (pfnRs.next()) {
                    entretien.setFournisseurName(pfnRs.getString("nom"));
                }


                entretiens.add(entretien);
            }
            return entretiens;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(InstrumentDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
