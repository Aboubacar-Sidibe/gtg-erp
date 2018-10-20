<%-- 
    Document   : nextweek
    Created on : Nov 7, 2017, 6:45:33 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <p id="pa"></p>
        <p id="todaysdate"></p>


        <script>

       
            var date = new Date();
            var an = date.getFullYear();
            var mois = date.getMonth() + 1;
            var jour = date.getDate();

            if (jour < 10)
                jour = "0" + jour;
            if (mois < 10)
                mois = "0" + mois;

            var trueDate = an + "-" + mois + "-" + jour;

            document.getElementById('todaysdate').innerHTML = trueDate;





            var d = new Date("2017-11-20");
            d.setDate(d.getDate() + (1 + 7 - d.getDay()) % 7);
            document.getElementById('pa').innerHTML = d;
        </script>
    </body>
</html>
