/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.instrument;

import java.util.List;

/**
 *
 * @author macbookpro
 */
public interface InstrumentDAO {
    
    
    boolean insertInstrument(Instrument instrument);
    boolean insertEntretien(Entretien entretien);
    List<Entretien> getAllEntretien(String numeroDeSerie);
    boolean updateInstrument(Instrument instrument);
    boolean deleteInstrument(String numerodeserie);

    
}
