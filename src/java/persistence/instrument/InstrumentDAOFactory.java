/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.instrument;

/**
 *
 * @author macbookpro
 */
public class InstrumentDAOFactory {
    
     public static InstrumentDAO createInstrument()
    {
        return new InstrumentDAOImpl();
    }
    
}
