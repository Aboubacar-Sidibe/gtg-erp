/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence.dateconverter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author macbookpro
 */
public class DateApi {

    public static String getTodayDate() {
        Date date = null; // your date
        date = new Date();

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH) + 1;
        int day = cal.get(Calendar.DAY_OF_MONTH);
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        int firstDayOfWeek = day - dayOfWeek + 2; //add + 2 in java, monday has index 2 in java
        String datstr = "";
        datstr = cal.getFirstDayOfWeek() + "/" + month + "/" + year;
        return datstr;
    }
    
    public static String getRepartitionAccessDate()
    {
         /* new java api, est à ce jour la meilleure manière  de travailler avec la date
          Elle es très simple comme je peux le comparer moi même au code juste en haut pour obtenir la date d'aujourd'hui.
         */
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        String formatDateTime = now.format(formatter);        
        return formatDateTime;
    }
}
