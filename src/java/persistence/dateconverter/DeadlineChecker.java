/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dateconverter;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author macbookpro
 */
public class DeadlineChecker {

    public static String getColor(ResultSet rs, String dbColumn) throws ParseException, SQLException {

        Date d1 = rs.getDate(dbColumn);
        if (d1 != null) {
            Calendar cal = Calendar.getInstance();
            Calendar today = Calendar.getInstance();

            cal.setTime(d1);

            if (today.before(cal)) {
                return "w3-green";
            } else {
                return "w3-red";

            }
        }
        return "w3-white";
    }
    
     public static String ofDessinateur(ResultSet rs, String dbColumn) throws ParseException, SQLException {

        String d1 = rs.getString(dbColumn);
        if (d1 != null) {
            Calendar cal = Calendar.getInstance();
            Calendar today = Calendar.getInstance();
             SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
             Date dt  = (Date) sdf.parse(d1);

            cal.setTime(dt);

            if (today.before(cal)) {
                return "w3-text-red";
            } else {
                return "w3-text-black";

            }
        }
        return "w3-text-black";
    }

}
