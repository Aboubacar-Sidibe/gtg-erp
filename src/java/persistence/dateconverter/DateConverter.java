/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dateconverter;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;

/**
 *
 * @author macbookpro
 */
public class DateConverter {
    
    
  public static String convertToFrFormat(ResultSet rs, String dbColumn) throws ParseException, SQLException
  {
      
        Date dateFr = rs.getDate(dbColumn);
        
        if(dateFr!=null)
        {
        Calendar cal = Calendar.getInstance();
        cal.setTime(dateFr);
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        int time = cal.get(Calendar.HOUR);
        String datFrStr = "";

        if (day < 10 && month < 10) {
            datFrStr = "0" + day + "/" + "0" + month + "/" + year;
        } else if (day < 10) {
            datFrStr = "0" + day + "/" + month + "/" + year;
        } else if (month < 10) {
            datFrStr = day + "/" + "0" + month + "/" + year;
        } else {
            datFrStr = day + "/" + month + "/" + year;
        }

        return datFrStr + " " + time;
        }
        return "";
 }
    
}
