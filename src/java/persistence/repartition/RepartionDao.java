/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.repartition;

import java.util.List;

/**
 *
 * @author macbookpro
 */
public interface RepartionDao {

    boolean insertRepartition(Repartion r);

    boolean updateRepartition(Repartion r, long id);

    boolean isRepartitionExist(String date);

    Repartionaccess accessRepartition();

    boolean insertRepartitionUser(Repartionaccess ra);

    boolean getRepartitionById(String date, Repartion r);

    boolean deleteRepartition(String date);

    boolean deleteRepartitionAccess();

    List<Repartion> getRepartition(String date);

}
