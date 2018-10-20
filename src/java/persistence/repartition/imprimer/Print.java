/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition.imprimer;

import java.util.ArrayList;
import java.util.List;
import persistence.travaux.Travaux;

/**
 *
 * @author macbookpro
 */
public class Print {
    private String instrument_equipe="";
    private List<Travaux> print_Travaux= new ArrayList<>();

    public String getInstrumentEquipe() {
        return instrument_equipe;
    }

    public void setInstrumentEquipe(String instrument_equipe) {
        this.instrument_equipe = instrument_equipe;
    }

    public List<Travaux> getPrintTravaux() {
        return this.print_Travaux;
    }

    public void setPrintTravaux(Travaux travaux) {
        this.print_Travaux.add(travaux);
    }
    
    
            
            
    
    
}
