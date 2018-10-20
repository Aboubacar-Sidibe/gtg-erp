<%-- 
    Document   : ShowUsers
    Created on : Aug 13, 2017, 7:55:55 PM
    Author     : macbookpro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/w3.css">
        <script src="https://www.w3schools.com/lib/w3.js"></script>
        <link rel="stylesheet" href="css/pulsatingButton.css"/>


        <!-- Javascript -->
        <script>
            $(function () {
                $("#datepicker-1").datepicker();
            });
        </script>

        <title>Fournisseurs</title>
        <style>
            .w3-card-32,.w3-hover-shadow:hover{box-shadow:0 32px 10px 0 rgba(0,0,0,0.2),0 32px 20px 0 rgba(0,0,0,0.19)};
            .w3-animate-opacity{animation:opac 2.5s}@keyframes opac{from{opacity:0} to{opacity:1}};
            p { color: white;display:inline-block; margin:0;text-transform:uppercase; }
            p:after {
                display:block;
                content: '';
                border-bottom: solid 3px rgb(163,0,43);  
                transform: scaleX(0);  
                transition: transform 250ms ease-in-out;
            }
            p:hover:after { transform: scaleX(1); }
            p.fromRight:after{ transform-origin:100% 50%; }
            p.fromLeft:after{  transform-origin:  0% 50%; }
            input:focus
            {
                outline: none;
            }

            .switch {
                position: relative;
                display: inline-block;
                width: 80px;
                height: 34px;
            }

            .switch input {display:none;}

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider {
                background-color: rgb(163,0,43);
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(46px);
                -ms-transform: translateX(46px);
                transform: translateX(46px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

            .slider.round:before {
                border-radius: 50%;
            }
            #form{
                position: relative;
                margin-top: 0px;
                margin-left: 0;
            }

            #id01
            {
                margin-left: 30px;
            }

            @media only screen and (max-width:601px){

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #form
                {
                    position: relative;
                    margin-top: 400px;
                }

                #filtre-container
                {
                    position: absolute;
                    margin-top: 25px;
                    width: 50%;    
                    right: 30px;
                }
                #filtre
                {
                    position: absolute;
                    right: 68px;

                    width: 100%;
                }
                #id01
                {
                    position: relative;
                    margin-top:100px;
                    margin-left: 0;
                }
                #title
                {
                    position: relative;
                }
                #pagination
                {
                    position: relative;
                    top: 90px;
                }

            }
            #user
            {
                display: none;
            }


            .tooltip {
                position: relative;
                display: inline-block;
                border-bottom: 1px dotted black;
            }

            .tooltip .tooltiptext {
                visibility: hidden;
                width: 120px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px 0;
                position: absolute;
                z-index: 1;
                bottom: 125%;
                left: 50%;
                margin-left: -60px;
                opacity: 0;
                transition: opacity 1s;
            }

            .tooltip .tooltiptext::after {
                content: "";
                position: absolute;
                top: 100%;
                left: 50%;
                margin-left: -5px;
                border-width: 5px;
                border-style: solid;
                border-color: #555 transparent transparent transparent;
            }

            .tooltip:hover .tooltiptext {
                visibility: visible;
                opacity: 1;
            }


        </style>

    </head>
    <body>

        <div class="w3-row-padding w3-container w3-margin-bottom w3-animate-right">
            <div class="w3-container">

                <header class="w3-row">
                    <div class="w3-row w3-right">
                        <c:if test="${fonction=='Arpenteur'}">
                            <button title="Ajouter fournisseur"  class="pulsatingCircle w3-btnP w3-margin-top" style="position: fixed;float:right;right: 10px;" onclick="document.getElementById('addfournisseur').style.display = 'block'">

                                <span class="firstCircle"><span style="position: relative;top:-12px"><i class="fa fa-truck" style="font-size: 5px;color: #fff"></i><i class="fa fa-plus" style="font-size: 3px;position: relative;right: 0px;color: #fff"></i></span></span>


                                <span class="secondCircle"></span>

                                <span class="thirdCircle"></span>

                            </button>
                        </c:if>

                        <a class=" w3-container w3-right w3-rest">
                            <img style="position: relative;right: 10px" class="w3-round-xxlarge  w3-card-32" src="img/${sessionScope.empImg}" alt="Utilisateur" height="50" width="50" title="${sessionScope.utilisateur.nom}" onclick="document.getElementById('imageCard').style.display = 'block'"/>
                        </a>

                        <%@include file="SetImage.jsp"%>

                    </div>
                    <div class="w3-row w3-center">
                        <h2 class="w3-center w3-container w3-text-white w3-btn w3-card-32" style="background: rgb(163,0,43);">Liste de  fournisseurs</h2>
                    </div>





                </header>


                <c:if test="${fonction=='Arpenteur'}">
                    <%@include file="AddFournisseur.jsp"%>
                </c:if>


                <%--pagination--%>
                <div id="filtre-container" class="w3-hide-medium w3-hide-large">
                    <button class="w3-btn w3-white w3-right w3-card-4" onclick="document.getElementById('filtre').style.display = 'block'">Filtre</button>
                    <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray" id="filtre" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Entre un mot clé" style="display: none">
                </div>

                <div class="w3-margin-bottom w3-padding w3-hide-medium w3-hide-large w3-padding" id="pagination" style="overflow-x: auto;">
                    <c:forEach var = "i" begin = "1" end = "${no}">
                        <a class="w3-border w3-padding w3-hover-opacity w3-card-4 w3-round-xxlarge w3-dark-gray" href="./ServerAllFournisseur?page=${i}">${i} </a>

                    </c:forEach>
                </div>




                <div style="overflow-x: auto;">
                    <div class="w3-white w3-margin-bottom">
                        <table class="w3-table w3-table-all w3-card-32" id="id01" style="width: 90%;">


                            <tr class="w3-text-white" style="background: rgb(163,0,43)">
                                <th class="w3-border-right"  onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">Nom<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right"  onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">Télephone<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>

                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(2)')" style="cursor:pointer;wi">Email<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(3)')" style="cursor:pointer">Ville<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(4)')" style="cursor:pointer">Pays<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th colspan="6" class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(6)')" style="cursor:pointer">Actions<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    


                            </tr>
                            <c:forEach  var="fournisseur" items="${fournisseurs}">
                                <tr class="w3-text-black  w3-hover-pink item">
                                    <td class="w3-border-right"><c:out value="${fournisseur.nom}"/></td>
                                    <td class="w3-border-right"><c:out value="${fournisseur.telephone}"/></td>
                                    <td class="w3-border-right"><c:out value="${fournisseur.email}"/></td>
                                    <td class="w3-border-right"><c:out value="${fournisseur.ville}"/></td>
                                    <td class="w3-border-right"><c:out value="${fournisseur.pays}"/></td>
                                    <td title="modification" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="${fournisseur.id}"/>').style.display = 'block'"><i  class="fa fa-pencil" style="font-size:14px"></i></td>                                   
                                    <td title="Delete" class="w3-hover-blue-gray w3-gray w3-text-white"><a class="w3-text-white" href="./ServerDeleteFournisseur?id=<c:out value="${fournisseur.id}"/>"><i class="fa fa fa-trash-o w3-hover-text-white" style="font-size:14px"></i></a></td>





















                                <div class="w3-container w3-modal w3-animate-zoom w3-text-black" id="${fournisseur.id}" style="display: none;">



                                    <div  id="form" class='w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32' style=" border:solid 5px black;width: 60%;">
                                        <header>

                                            <h2 class="w3-text-white w3-center gtg-background">Modification</h2>
                                            <span onclick="document.getElementById('<c:out value="${fournisseur.id}"/>').style.display = 'none'" 
                                                  class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px" >&times;</span>
                                        </header>

                                        <form class="w3-container w3-card-4 " action="./ServerUpdateFournisseur" method="post">

                                            <input type="hidden" name="id" value="${fournisseur.id}"/>

                                            <div class="w3-row-padding w3-margin-bottom">
                                                <div class="w3-third">
                                                    <p>   
                                                        <label class="w3-text-blue-gray"><b>Nom</b></label><i class="fa fa-user-circle-o w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom "  name="nom" type="text"  value="${fournisseur.nom}" required=""/></p>
                                                </div>
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Télephone</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">phone</i>
                                                        <input class="w3-input w3-border-bottom "  name="telephone" type="text" value="${fournisseur.telephone}" required=""/></p>
                                                </div>
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>E-mail</b></label><i class="fa fa-envelope-square w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom "  name="email" type="email" value="${fournisseur.email}" required=""/></p>
                                                </div>


                                            </div>

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Ville</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="ville" type="text" value="${fournisseur.ville}" required=""></p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Pays</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="pays" type="text" value="${fournisseur.pays}" required=""></p>
                                                </div>

                                            </div>







                                            <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                                                <h6 class="w3-center">      
                                                    <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Modifier<i class="fa fa-braille" style="font-size:18px;position: relative;right: -8px"></i></button></h6>
                                            </div>

                                        </form>

                                    </div>
                                </div>
                                </tr>



                            </c:forEach>

                            <%--pagination--%>
                            <button class="w3-btn w3-white w3-right w3-card-4 w3-hide-small" onclick="document.getElementById('filtre2').style.display = 'block'">Filtre</button>
                            <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray w3-hide-small" id="filtre2" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Entrez un mot clé" style="width: 28%;display: none">


                            <div class="w3-margin-bottom w3-padding">
                                <c:forEach var = "i" begin = "1" end = "${no}">
                                    <a class="w3-border w3-padding w3-hover-opacity w3-card-4 w3-round-xxlarge w3-dark-gray w3-hide-small" href="./ServerAllFournisseur?page=${i}">${i} </a>

                                </c:forEach>
                            </div>









                        </table>
                    </div>
                </div>
            </div>

        </div>


        <script>
            // Get the modal
            var modal = document.getElementById('<c:out value="${fournisseur.id}"/>');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

        </script>

        <script>
            // Get the modal
            var modal2 = document.getElementById('addfournisseur');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal2) {
                    modal2.style.display = "none";
                }
            }
        </script>



    </body>
</html>
