<%-- 
    Document   : CheckRepartition
    Created on : Oct 16, 2017, 4:36:04 PM
    Author     : macbookpro
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/w3.css"/>
        <title>JSP Page</title>
    </head>
    <body>



        <p class="w3-border w3-border-red">number of row: ${rowC}</p>
        <p class="w3-border w3-border-red">number of col: ${colC}</p>


        <p>${repartion.lundi}</p>
        <p>${repartion.mardi}</p>
        <p>${repartion.mercredi}</p>
        <p>${repartion.jeudi}</p>
        <p>${repartion.vendredi}</p>
        <p>${repartion.samedi}</p>

       


    </body>
</html>
