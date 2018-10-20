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



        <title>Utilisateurs</title>
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

            #ModForm
            {
                margin-top: 150px;
            }

            @media only screen and (max-width:601px)
            {

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #ModForm
                {
                    margin-top: 480px;
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
            .w3-theme-d1 {color:#fff !important; background-color:#930027 !important}
            .w3-theme-d2 {color:#fff !important; background-color:#830023 !important}
            .w3-theme-d3 {color:#fff !important; background-color:#72001e !important}
            .w3-theme-d4 {color:#fff !important; background-color:#62001a !important}
            .w3-theme-d5 {color:#fff !important; background-color:#797979 !important}
            .w3-theme-light {color:#000 !important; background-color:#ffeaf0 !important}
            .w3-theme-dark {color:#fff !important; background-color:#520016 !important}
            .w3-theme-action {color:#fff !important; background-color:#520016 !important}

            .w3-theme {color:#fff !important; background-color:#b4c3d8  !important}
            .w3-text-theme {color:#a3002b !important}
            .w3-border-theme {border-color:#a3002b !important}

            .w3-hover-theme:hover {color:#000 !important; background-color:#d9e1ec !important}
            .gtg-hover-theme:hover {color:#fff !important; background-color:#26364a !important}


            .w3-hover-text-theme {color:#a3002b !important}
            .w3-hover-border-theme:hover {border-color:#a3002b !important}


        </style>
        <script type="text/javascript"
        src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script>
            function updateDiv()
            {
                $("#here").load("Home.jsp" + " #here");
            }
        </script>
    </head>
    <body>

        <div class="w3-row-padding w3-container w3-margin-bottom w3-animate-right">



            <div class="w3-container">


                <header class="w3-row w3-white" id="here">
                    <button class="w3-btn w3-left" onclick="updateDiv()" title="rafraîchir"><i class="fa fa-refresh fa-spin " style="font-size:24px;color: rgb(163,0,43)"></i><span style="position: relative;top: -5px">Sync</span></button>

                    <div class="w3-row w3-right">
                        <a class=" w3-container w3-right w3-rest">
                            <img style="position: relative;right: 15px" class="w3-round-xxlarge" src="img/${sessionScope.empImg}" alt="Utilisateur" height="50" width="50" title="${sessionScope.utilisateur.nom}" onclick="document.getElementById('imageCard').style.display = 'block'"/>
                        </a>
                        <%@include file="SetImage.jsp"%>

                        <button title="Ajouter un nouveau travail"  class="pulsatingCircle w3-btnP w3-margin-top" style="position: fixed;float:right;right: 10px;" onclick="showtravail()">

                            <span class="firstCircle"><span style="position:relative;top:-11px;left:0px;font-size:5px;color:#fff">+</span></span>


                            <span class="secondCircle"></span>

                            <span class="thirdCircle"></span>

                        </button>
                    </div>
                    <div class="w3-row w3-center">
                        <h2 class="w3-center w3-text-white w3-container w3-btn w3-card-32" style="background: rgb(163,0,43)" id="title">Liste de travaux</h2>

                    </div>



                </header>

                <%@include file="AddTravail.jsp"%>




                <%--pagination--%>
                <div id="filtre-container" class="w3-hide-medium w3-hide-large">
                    <button class="w3-btn w3-white w3-right w3-card-4" onclick="document.getElementById('filtre').style.display = 'block'">Filtre</button>
                    <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray" id="filtre" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Entre un mot clé" style="display: none">
                </div>

                <div class="w3-margin-bottom w3-padding" id="pagination" style="overflow-x: auto;">
                    <c:forEach var = "i" begin = "1" end = "${no}">
                        <a class="w3-border w3-padding w3-hover-opacity w3-card-4 w3-round-xxlarge w3-dark-gray" href="./ServerAllTravaux?page=${i}">${i} </a>

                    </c:forEach>
                </div>

                <div style="overflow-x: auto;">


                    <table class="w3-table w3-table-all w3-card-32" id="id01">

                        <tr class="w3-text-white" style="background: rgb(163,0,43)">
                            <th class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">NUMERO<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(2)')" style="cursor:pointer">DOSSIER<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(3)')" style="cursor:pointer">CLIENT<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(4)')" style="cursor:pointer">TYPE<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(5)')" style="cursor:pointer">PAR<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(6)')" style="cursor:pointer">STATUT<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th colspan="2" class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(7)')" style="cursor:pointer">Actions<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    




                        </tr>
                        <c:forEach  var="travail" items="${travaux}">
                            <tr class="w3-text-black w3-hover-pink item ">
                                <td class="w3-border-right w3-center"><c:out value="${travail.travailId}"/></td>
                                <td class="w3-border-right w3-center"><c:out value="${travail.dossier}"/></td>
                                <td class="w3-border-right w3-center"><c:out value="${travail.client}"/></td>
                                <td class="w3-border-right w3-center"><c:out value="${travail.typeDeTravail}"/></td>
                                <td class="w3-border-right w3-center"><c:out value="${travail.donneur}"/></td>
                                <c:choose>
                                    <c:when test="${travail.status=='Planifié'}">
                                        <td class="w3-border-right w3-green w3-text-white w3-center"><c:out value="${travail.status}"/></td>
                                    </c:when>
                                    <c:when test="${travail.status=='Annulé'}">
                                        <td class="w3-border-right gtg-background w3-text-white w3-center"><c:out value="${travail.status}"/></td>
                                    </c:when>
                                    <c:when test="${travail.status=='Validé'}">
                                        <td class="w3-border-right w3-orange w3-text-white w3-center"><c:out value="${travail.status}"/></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="w3-border-right  w3-text-white w3-center" style="background: rgb(0,0,255)"><c:out value="${travail.status}"/></td>
                                    </c:otherwise>
                                </c:choose>
                                <td title="modification" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="${travail.travailId}"/>').style.display = 'block'"><i  class="fa fa-pencil" style="font-size:14px"></i></td>
                                <td title="supprimé" class="w3-hover-blue-gray w3-gray w3-text-white"><a class="w3-text-white" href="./ServerDeleteTravail?travailId=<c:out value="${travail.dossier}"/>"><i class="fa fa fa-trash-o w3-hover-text-white" style="font-size:14px"></i></a></td>






                            <div class="w3-container w3-modal w3-animate-zoom w3-text-black" id="${travail.travailId}" style="display: none;">



                                <div  id="ModForm" class=' w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32 ' style=" border:solid 5px black;width: 60%;">
                                    <header>

                                        <h2 class="w3-text-white w3-center gtg-background">Modification</h2>
                                        <span onclick="document.getElementById('<c:out value="${travail.travailId}"/>').style.display = 'none'" 
                                              class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px">&times;</span>
                                    </header>

                                    <form class="w3-container w3-card-4 " action="./ServerUpdateTravaux" method="post">
                                        <div class="w3-row-padding w3-margin-bottom">
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Numéro d'identification</b></label><i class="fa fa-user-circle-o w3-right" style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom "  name="empid" type="text" value="${travail.travailId}"  readonly="" required=""/></p>
                                            </div>
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Dossier</b></label><i class="fa fa-folder-open w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom "  name="dossier" type="text"  value="${travail.dossier}" required=""/></p>
                                            </div>
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Client</b></label><i class="fa fa-handshake-o w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom "  name="client" type="text" value="${travail.client}"  required="" /></p>

                                                </p>
                                            </div>

                                        </div>
                                        <div class="w3-row-padding w3-light-grey">
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Type de travail </b></label><br><br>
                                                    <select class="w3-select w3-light-grey" name="type_de_travail" required="">
                                                        <option value="Certificat de localisation">Certificat de localisation</option>
                                                        <option value="Implantation">Implantation</option>
                                                        <option value="Piquetage">Piquetage</option>
                                                        <option value="Bornage">Bornage</option>
                                                        <option value="Levé topographique">Levé topographique</option>
                                                        <option value="Arpentage de construction">Arpentage de construction</option>
                                                        <option value="Chainage">Chainage</option>

                                                    </select
                                                    </select>

                                                </p>

                                            </div>
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Lieu</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                                    <input class="w3-input w3-border-bottom "  name="lieu" type="text" required="" value="${travail.lieu}"></p>
                                            </div>
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Durée estimée(heures)</b></label><i class="fa fa-hourglass-half w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom "  name="dure_estime" type="text" required="" value="${travail.dureEstime}"></p>
                                            </div>

                                        </div>
                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Deadline</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray"  name="deadline" value="${travail.deadlineStr}" id="TrModMyDatePicker${travail.travailId}" required=""></p>
                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Rendez-vous</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-grey"  name="rendez_vous" id="TrModMyDate${travail.travailId}" value="${travail.rendezVousStr}" required="" ></p>
                                            </div>

                                        </div>

                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Chef</b></label><i class="fa fa-user-secret w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray"  name="chef" value="${travail.chef}" type="text" required=""></p>
                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Donneur</b></label><i class="fa fa-check-square-o w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-grey"  name="donneur" value="${travail.donneur}" type="text" required=""></p>
                                            </div>

                                        </div>

                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Status</b></label>
                                                    <c:choose>
                                                        <c:when test="${travail.status=='Planifié'}">
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${travail.status}" selected="">${travail.status}</option>
                                                                <option value="Edition">Edition</option>
                                                                <option value="Validé">Validé</option>
                                                                <option value="Annulé">Annulé</option>


                                                            </select>
                                                        </c:when>
                                                        <c:when test="${travail.status=='Annulé'}">
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${travail.status}" selected="">${travail.status}</option>
                                                                <option value="Edition">Edition</option>
                                                                <option value="Validé">Validé</option>
                                                                <option value="Planifié">Planifié</option>


                                                            </select>
                                                        </c:when>
                                                        <c:when test="${travail.status=='Validé'}">
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${travail.status}" selected="">${travail.status}</option>
                                                                <option value="Planifié">Planifié</option>
                                                                <option value="Edition">Edition</option>
                                                                <option value="Annulé">Annulé</option>


                                                            </select>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${travail.status}" selected="">${travail.status}</option>
                                                                <option value="Validé">Validé</option>

                                                                <option value="Planifié">Planifié</option>
                                                                <option value="Annulé">Annulé</option>


                                                            </select>

                                                        </c:otherwise>
                                                    </c:choose>

                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Notes</b></label><i class="fa fa-commenting w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray"  name="notes" type="text" value="${travail.notes}" required=""></p>
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
                        <div class="w3-hide-small">
                            <button class="w3-btn w3-white w3-right w3-card-4" onclick="document.getElementById('filtre2').style.display = 'block'">Filtre</button>
                            <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray" id="filtre2" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Entrez un mot clé" style="width: 28%;display: none">
                        </div>
                    </table>
                </div>


            </div>

        </div>

        <script>
// Get the modal
            var modal = document.getElementById('<c:out value="${travail.travailId}"/>');
// When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            function showtravail()
            {

                document.getElementById('addtravail').style.display = 'block';

            }
            function closetravail()
            {

                document.getElementById('addtravail').style.display = 'none';


            }
        </script>

        <script>
// Get the modal
            var modal2 = document.getElementById('addtravail');
// When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal2) {
                    modal2.style.display = "none";
                }
            }
        </script>


    </body>
</html>
