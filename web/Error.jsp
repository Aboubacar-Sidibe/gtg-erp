<%-- 
    Document   : Error
    Created on : Aug 16, 2017, 9:56:24 AM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/w3.css">
        <title>Conseil pour régler le problème</title>
        <style>
            body, html {
                height: 100%;
            }

            .bg { 
                /* The image used */
                background-image: url(img/error.jpg);

                /* Full height */
                height: 100%; 

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body class="bg">
        <h1 class="w3-center w3-text-red">«Houston, on a eu un problème» </h1>
        <div class="w3-display-middle w3-card-4 w3-padding-16" style="background: rgba(255,255,255,0.6)">
            <h1 class="w3-center w3-text-black" style="text-decoration: underline">Description: Ajout d'un employé</h1>
            <div class="w3-container">
                <h2 class="w3-center" style="text-decoration: underline">Solution: Verifier que:</h2>

                <ul class="w3-ul">
                    <li>Le numéro d'identifaction n'est pas utilisé par quelqu'un d'autre car il doit être unique par employé.</li>
                    <li>Replissez tous les champs</li>
                    <li><a href="AddEmploye.jsp">Ressayer</a></li>
                    <li>${error}</li>

                </ul>
            </div>
        </div>
    </body>
</html>
