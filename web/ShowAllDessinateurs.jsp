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
        <link rel="stylesheet" type="text/css" href="date_time_calendar/jquery.datetimepicker.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/w3.css">
        <script src="https://www.w3schools.com/lib/w3.js"></script>
        <link rel="stylesheet" href="css/pulsatingButton.css"/>





        <title>Employés</title>
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

            #form
            {
                margin-top: 350px;
            }
            #filtre
            {
                width: 28%;
            }
            @media only screen and (max-width:601px)
            {

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #form
                {
                    margin-top: 680px;
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
                    top: 80px;
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

            .afairebg
            {
                background: rgb(1,20,128);
            }
            .encours
            {
                background: rgb(128,201,189);
            }
            .standby
            {
                background: rgb(128,13,0);
            }

        </style>

    </head>
    <body>

        <div class="w3-row-padding w3-container w3-margin-bottom w3-animate-right">
            <div class="w3-container">

                <header class="w3-row">
                    <div class="w3-row w3-right">
                        <c:if test="${fonction=='Arpenteur'}">
                            <button title="Ajouter un nouveau dessinateur"  class="pulsatingCircle w3-btnP w3-margin-top" style="position: fixed;float:right;right: 10px;" onclick="document.getElementById('adddessinateur').style.display = 'block'">

                                <span class="firstCircle"><span style="position: relative;top:-12px"><i class="material-icons" style="font-size: 5px;color: #fff">brush</i><i class="fa fa-plus" style="font-size: 3px;position: relative;right: 0px;color: #fff"></i></span></span>


                                <span class="secondCircle"></span>

                                <span class="thirdCircle"></span>

                            </button>

                        </c:if>

                        <a class=" w3-container w3-right w3-rest">
                            <img style="position: relative;right: 15px" class="w3-round-xxlarge  w3-card-32" src="img/${sessionScope.empImg}" alt="Utilisateur" height="50" width="50" title="${sessionScope.utilisateur.nom}" onclick="document.getElementById('imageCard').style.display = 'block'"/>
                        </a>

                        <%@include file="SetImage.jsp"%>

                    </div>
                    <div class="w3-row w3-center">
                        <h2 class="w3-center w3-container w3-text-white w3-btn w3-card-32" style="background: rgb(163,0,43);">Travaux dessinateur</h2>
                    </div>





                </header>


                <c:if test="${fonction=='Arpenteur'}">
                    <%@include file="AddDessinateur.jsp"%>
                </c:if>



                <%--pagination--%>
                <div id="filtre-container" class="w3-hide-medium w3-hide-large">
                    <button class="w3-btn w3-white w3-right w3-card-4" onclick="document.getElementById('filtre').style.display = 'block'">Filtre</button>
                    <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray" id="filtre" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Entrez un mot clé" style="display: none">
                </div>

                <div class="w3-margin-bottom w3-padding" id="pagination" style="overflow-x: auto;">
                    <c:forEach var = "i" begin = "1" end = "${no}">
                        <a class="w3-border w3-padding w3-hover-opacity w3-card-4 w3-round-xxlarge w3-dark-gray" href="./ServerAllDessinateur?page=${i}">${i} </a>

                    </c:forEach>
                </div>

                <div class="w3-white w3-margin-bottom" style="overflow-x: auto;">
                    <table class="w3-table w3-table-all w3-card-32" id="id01" style="width:100%;">


                        <tr class="w3-text-white" style="background: rgb(163,0,43)">
                            <th class="w3-border-right"  onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">Dossier<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right"  onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(2)')" style="cursor:pointer">Bureau<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>

                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(3)')" style="cursor:pointer">Client<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(4)')" style="cursor:pointer">Lieu<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(5)')" style="cursor:pointer">Type de mandat<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(6)')" style="cursor:pointer;">Type de travail<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(7)')" style="cursor:pointer;">Entrer par<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(8)')" style="cursor:pointer;">Date d'entrée<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(9)')" style="cursor:pointer">Durée estimés<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(10)')" style="cursor:pointer;">Deadline<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(11)')" style="cursor:pointer;">Priorité<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(12)')" style="cursor:pointer;">Status<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(13)')" style="cursor:pointer;">Date status <i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                            <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(14)')" style="cursor:pointer;">Responsable<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                            <th colspan="2" class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(15)')" style="cursor:pointer">Actions<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    


                        </tr>
                        <c:forEach  var="dessinateur" items="${dessinateurs}">
                            <tr class="w3-text-black  w3-hover-pink item">
                                <td class="w3-border-right"><c:out value="${dessinateur.dossier}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.bureau}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.client}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.lieu}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.typeDeMandat}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.typeDeTravail}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.saisiePar}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.dateDeSaisieStr}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.duree}"/></td>
                                <td class="w3-border-right ${dessinateur.color}"><c:out value="${dessinateur.deadlineStr}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.priorite}"/></td>
                                <c:choose>
                                    <c:when test="${dessinateur.status=='À faire'}">
                                        <td class="w3-border-right afairebg w3-text-white w3-center"><c:out value="${dessinateur.status}"/></td>
                                    </c:when>
                                    <c:when test="${dessinateur.status=='En attente'}">
                                        <td class="w3-border-right w3-orange w3-text-white w3-center"><c:out value="${dessinateur.status}"/></td>
                                    </c:when>
                                    <c:when test="${dessinateur.status=='En cours'}">
                                        <td class="w3-border-right encours w3-text-white w3-center"><c:out value="${dessinateur.status}"/></td>
                                    </c:when>
                                    <c:when test="${dessinateur.status=='Stand by'}">
                                        <td class="w3-border-right standby w3-text-white w3-center"><c:out value="${dessinateur.status}"/></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="w3-border-right w3-text-white w3-center" style="background: #000"><c:out value="${dessinateur.status}"/></td>
                                    </c:otherwise>
                                </c:choose>                                <td class="w3-border-right"><c:out value="${dessinateur.dateStatusStr}"/></td>
                                <td class="w3-border-right"><c:out value="${dessinateur.responsable}"/></td>
                                <td title="modification" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="${dessinateur.dossier}"/>').style.display = 'block'"><i  class="fa fa-pencil" style="font-size:14px"></i></td>                               
                                <td title="supprimé" class="w3-hover-blue-gray w3-gray w3-text-white"><a class="w3-text-white" href="./ServerDeleteDessinateur?dossier=<c:out value="${dessinateur.dossier}"/>"><i class="fa fa fa-trash-o w3-hover-text-white" style="font-size:14px"></i></a></td>





















                            <div class="w3-container w3-modal w3-animate-zoom w3-text-black" id="${dessinateur.dossier}" style="display: none;">



                                <div  id="form" class=' w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32 ' style=" border:solid 5px black;width: 60%;">
                                    <header>

                                        <h2 class="w3-text-white w3-center gtg-background">Modification</h2>
                                        <span onclick="document.getElementById('<c:out value="${dessinateur.dossier}"/>').style.display = 'none'" 
                                              class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px" >&times;</span>
                                    </header>

                                    <form class="w3-container w3-card-4 " action="./ServerUpdateDessinateur" method="post">
                                        <div class="w3-row-padding w3-margin-bottom">
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Bureau</b></label><i class="fa fa-desktop w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom "  name="bureau" type="text"  value="Alma"  readonly="" required=""/></p>
                                            </div>
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Dossier</b></label><i class="fa fa-folder-open w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom "  name="dossier" type="text" value="${dessinateur.dossier}"  required=""/></p>
                                            </div>
                                            <div class="w3-third">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Lieu</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                                    <input class="w3-input w3-border-bottom "  name="lieu" type="text" value="${dessinateur.lieu}" required=""/></p>
                                            </div>


                                        </div>

                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Type de mandat </b></label><br><br>
                                                    <select class="w3-select w3-light-grey" name="type_de_mandat" required="">
                                                        <option value="Description technique" selected=""> Description technique </option>
                                                        <option value="Projet Implantation">Projet Implantation</option>
                                                        <option value="Certificat Implantation">Certificat Implantation</option>
                                                        <option value="Piquetage">Piquetage</option>
                                                        <option value="Levé">Levé</option>
                                                        <option value="Construction">Construction</option>
                                                        <option value="Carnet BAGQ">Carnet BAGQ</option>
                                                        <option value="Cadraste">Cadraste</option>
                                                        <option value="Lotissement">Lotissement</option>


                                                    </select>

                                                </p>
                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Type de travail </b></label><br><br>
                                                    <select class="w3-select w3-light-grey" name="type_de_travail" required="">
                                                        <option value="${dessinateur.typeDeTravail}" selected="">${dessinateur.typeDeTravail}</option>
                                                        <option value="Carnet" selected="">Carnet</option>
                                                        <option value="Dessin">Dessin</option>
                                                        <option value="Preparation de terrain">Preparation de terrain</option>
                                                        <option value="Calcul">Calcul</option>


                                                    </select>

                                                </p>
                                            </div>

                                        </div>
                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Responsable</b></label><i class="fa fa-user-secret w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray"  name="responsable" type="text" value="${dessinateur.responsable}" required=""></p>
                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Client</b></label><i class="fa fa-commenting w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray" value="${dessinateur.client}" name="client" type="text" required=""></p>
                                            </div>

                                        </div>



                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-col" style="width: 50%">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Durée estimée</b></label><i class="fa fa-hourglass-half w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray"  name="duree" type="text" value="${dessinateur.duree}" required=""></p>
                                            </div>
                                            <div class="w3-col" style="width: 50%">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Deadline</b></label><i class="fa fa-hourglass-half w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-grey"  name="deadline" id="datetimepicker4" value="${dessinateur.deadlineStr}" required=""></p>

                                            </div>
                                            

                                        </div>
                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Status</b></label>

                                                    <c:choose>
                                                        <c:when test="${dessinateur.status=='En attente'}">
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${dessinateur.status}" selected="">${dessinateur.status}</option>
                                                                <option value="À faire">À faire</option>
                                                                <option value="En cours">En cours</option>
                                                                <option value="Stand by">Stand by</option>
                                                                <option value="Terminé">Terminé</option>



                                                            </select>
                                                        </c:when>
                                                        <c:when test="${dessinateur.status=='En cours'}">
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${dessinateur.status}" selected="">${dessinateur.status}</option>
                                                                <option value="À faire">À faire</option>
                                                                <option value="En attente">En attente</option>
                                                                <option value="Stand by">Stand by</option>
                                                                <option value="Terminé">Terminé</option>



                                                            </select>
                                                        </c:when>
                                                        <c:when test="${dessinateur.status=='Stand by'}">
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${dessinateur.status}" selected="">${dessinateur.status}</option>
                                                                <option value="À faire">À faire</option>
                                                                <option value="En attente">En attente</option>
                                                                <option value="En cours">En cours</option>
                                                                <option value="Terminé">Terminé</option>



                                                            </select>
                                                        </c:when>
                                                        <c:when test="${dessinateur.status=='Terminé'}">
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${dessinateur.status}" selected="">${dessinateur.status}</option>
                                                                <option value="To do">À faire</option>
                                                                <option value="En attente">En attente</option>
                                                                <option value="En cours">En cours</option>
                                                                <option value="Stand by">Stand by</option>



                                                            </select>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <select class="w3-select w3-light-grey" name="status" required="">
                                                                <option value="${dessinateur.status}" selected="">${dessinateur.status}</option>
                                                                <option value="En attente">En attente</option>
                                                                <option value="En cours">En cours</option>
                                                                <option value="Stand by">Stand by</option>
                                                                <option value="Terminé">Terminé</option>



                                                            </select>                                                   
                                                        </c:otherwise>
                                                    </c:choose>

                                            </div>
                                            <div>
                                                <p class="w3-half">      
                                                    <label class="w3-text-blue-gray"><b>Priorité</b></label>
                                                    <select class="w3-select w3-light-grey" name="Priorite" required="">
                                                        <option value="${dessinateur.priorite}" selected="">${dessinateur.priorite}</option>
                                                        <option value="1">1(0 à 4h)</option>
                                                        <option value="2">2(4h à 72h)</option>
                                                        <option value="3">3(24h à 72h)</option>
                                                        <option value="4">4(72h à 1sem)</option>
                                                        <option value="5">5(1sem à 2.5sem)</option>
                                                        <option value="6">6(2.5sem à 4sem)</option>



                                                    </select>


                                                </p>
                                            </div>



                                        </div>


                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Saisie par</b></label><i class="fa fa-user-circle-o w3-right " style="font-size:16px;position: relative;top:52px;color: rgb(163,0,43)"></i>
                                                    <select class="w3-select w3-light-grey" name="saisie_par" required="">
                                                        <option value="${dessinateur.saisiePar}" selected="">${dessinateur.saisiePar}</option>
                                                        <c:forEach var="name" items="${names}">
                                                            <option value="${name}">${name}</option>
                                                        </c:forEach>
                                                    </select>



                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Date de saisie</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray" id="datetimepicker5" name="date_saisie" value="${dessinateur.dateDeSaisieStr}"  required="" readonly=""></p>
                                            </div>


                                        </div>
                                         



                                        <div class="w3-row-padding w3-white">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Notes</b></label><i class="fa fa-commenting w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray"  name="notes" type="text" value="${dessinateur.notes}" required=""></p>
                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b> Date de status  </b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray " id="datetimepicker6"  name="date_de_status" readonly="" value="${dessinateur.dateStatusStr}"  required=""></p>
                                            </div>

                                        </div>


                                        <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                                            <h6 class="w3-center">      
                                                <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Enregistrer<i style="position: relative;right: -18px;font-size: 24px" class="fa fa-cloud-download"></i></button></h6>
                                        </div>

                                    </form>

                                </div>
                            </div>
                            </tr>



                        </c:forEach>










                        <div id="filtre-container" class="w3-hide-small">
                            <button class="w3-btn w3-white w3-right w3-card-4" onclick="document.getElementById('filtre2').style.display = 'block'">Filtre</button>
                            <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray" id="filtre2" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Dis-moi le mot clé que tu cherches" style="width: 28%;display: none">
                        </div>
                    </table>
                </div>
            </div>

        </div>

        <script>

            var d = new Date();
            var day = d.getDate();
            var month = d.getMonth() + 1;
            var year = d.getFullYear();
            if (day < 10) {
                day = '0' + day;
            }

            if (month < 10) {
                month = '0' + month;
            }
            today = day + '/' + month + '/' + year;
            var x = document.getElementsByClassName("sal");
            var i;
            for (i = 0; i < x.length; i++) {
                x[i].value = today;
            }

        </script>

        <script>
            // Get the modal
            var modal = document.getElementById('<c:out value="${dessinateur.dossier}"/>');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

        </script>

        <script>
            // Get the modal
            var modal2 = document.getElementById('adddessinateur');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal2) {
                    modal2.style.display = "none";
                }
            }
        </script>

        <script src="date_time_calendar/jquery.js"></script>
        <script src="date_time_calendar/jquery.datetimepicker.min.js"></script>
        <script>/*
         window.onerror = function(errorMsg) {
         $('#console').html($('#console').html()+'<br>'+errorMsg)
         }*/

            $.datetimepicker.setLocale('fr');

            //$('#datetimepicker_format').datetimepicker({value: '2015/04/15 05:03', format: $("#datetimepicker_format_value").val()});
            //$("#datetimepicker_format_change").on("click", function (e) {
            //    $("#datetimepicker_format").data('xdsoft_datetimepicker').setOptions({format: $("#datetimepicker_format_value").val()});
            // });
            $("#datetimepicker_format_locale").on("change", function (e) {
                $.datetimepicker.setLocale($(e.currentTarget).val());
            });

            $('#datetimepicker4').datetimepicker({
                //theme: 'dark',
                dayOfWeekStart: 1,
                lang: 'en',
                format: 'd/m/Y H:i',
                timepicker: true,
                disabledDates: ['1986/01/08', '1986/01/09', '1986/01/10'],
                startDate: '1986/01/05'
            });
            $('#datetimepicker4').datetimepicker({value: '2015/04/15 05:03', step: 10});


            $('#datetimepicker5').datetimepicker({
                //theme: 'dark',
                dayOfWeekStart: 1,
                lang: 'en',
                format: 'd/m/Y H:i',
                timepicker: true,
                disabledDates: ['1986/01/08', '1986/01/09', '1986/01/10'],
                startDate: '1986/01/05'
            });
            $('#datetimepicker5').datetimepicker({value: '2015/04/15 05:03', step: 10});


            $('#datetimepicker6').datetimepicker({
                //theme: 'dark',
                dayOfWeekStart: 1,
                lang: 'en',
                format: 'd/m/Y H:i',
                timepicker: true,
                disabledDates: ['1986/01/08', '1986/01/09', '1986/01/10'],
                startDate: '1986/01/05'
            });
            $('#datetimepicker6').datetimepicker({value: '2015/04/15 05:03', step: 10});











            var logic = function (currentDateTime) {
                if (currentDateTime && currentDateTime.getDay() == 6) {
                    this.setOptions({
                        minTime: '11:00'
                    });
                } else
                    this.setOptions({
                        minTime: '8:00'
                    });
            };




        </script>



    </body>
</html>
