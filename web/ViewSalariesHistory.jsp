<%-- 
    Document   : ViewSalariesHistory
    Created on : Aug 21, 2017, 8:18:55 AM
    Author     : macbookpro
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

        <title>Historique salaire</title>
    </head>
    <body>
        <div class="w3-display-container">
            <div class="w3-row w3-light-gray w3-display-topmiddle" style="width: 70%;">
                <div class="w3-light-gray w3-center">
                    <header>
                        <h1 class="w3-center">Historique salaire</h1>
                    </header>

                    <table class="w3-table w3-table-all w3-card-32" id="id01" style="width: 70%;">

                        <tr class="w3-text-white" style="background: rgb(163,0,43)">
                            <th class="w3-border-right w3-center w3-text-white">Dernière modification<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center w3-text-white">Montant<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                        </tr>
                        <c:forEach var="salaire" items="${salaries}">
                            <tr class="w3-text-black  w3-hover-pink item" >
                                <td class="w3-border-right"><c:out value="${salaire.lastModifiedStr}"/></td>
                                <td class="w3-border-right"><c:out value="${salaire.montant}"/></td>
                            </tr>

                        </c:forEach>

                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
