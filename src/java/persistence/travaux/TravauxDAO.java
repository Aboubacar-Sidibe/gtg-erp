/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.travaux;

import java.util.Date;
import java.util.List;

/**
 *
 * @author macbookpro
 */
public interface TravauxDAO {

    Travaux getTravaux(String id);

    List<Travaux> getAllTravaux(int total, int pageid);

    List<Travaux> getAllTravauxNonRepartis();

    boolean insertTravaux(Travaux travaux, Date r,Date d);

    boolean updateTravaux(Travaux travaux,  Date r,Date d);

    boolean deleteTravaux(int id);

    boolean updateTravail(String s);

    public boolean updateTravailSetRepartirNon(String s);

    List getAllTravailId();

}
