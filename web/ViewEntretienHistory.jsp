<%-- 
    Document   : ViewEntretienHistory
    Created on : Sep 15, 2017, 8:13:58 AM
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

        <title>Historique d'entretien </title>
    </head>
    <body>
        <div class="w3-display-container">
            <div class="w3-row w3-light-gray w3-display-topmiddle" style="width: 70%;">
                <div class="w3-light-gray w3-center">
                    <header>
                        <h1 class="w3-center">Historique d'entretien  </h1>
                    </header>
                    <div style="overflow-x: auto">
                    <table class="w3-table w3-table-all w3-card-32" id="id01" style="width: 100%;">

                        <tr class="w3-text-white" style="background: rgb(163,0,43)">
                            <th class="w3-border-right w3-center w3-text-white">Numero de serie<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center w3-text-white">Fournisseur<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center w3-text-white">Coût d'entretien<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center w3-text-white">Date d'entretien<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center w3-text-white">Details<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>

                        </tr>
                        <c:forEach var="entretien" items="${entretiens}">
                            <tr class="w3-text-black  w3-hover-pink item" >
                                <td class="w3-border-right"><c:out value="${entretien.numeroDeSerie}"/></td>
                                <td class="w3-border-right"><c:out value="${entretien.fournisseurName}"/></td>
                                <td class="w3-border-right"><c:out value="${entretien.cout}"/></td>
                                <td class="w3-border-right"><c:out value="${entretien.dateEntretien}"/></td>
                                <td class="w3-border-right"><c:out value="${entretien.details}"/></td>
                            </tr>

                        </c:forEach>

                    </table>
                </div>
                </div>
            </div>
        </div>
    </body>
</html>
