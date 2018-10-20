<%-- 
    Document   : Dates
    Created on : Sep 19, 2017, 6:34:36 AM
    Author     : macbookpro
--%>

<%@page import="java.time.ZoneId"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/pulsatingButton.css"/>



        <link rel="stylesheet" href="css/w3.css"/>
        <style>
            tr{
                border: 1px solid black;
                height:80px;


            }
            td{
                border-right:  1px solid black;
                max-width: 30px;
            }


            .gtg-font{
                font-size: 12px;
            }
            .w3-theme-l22 {
                color:#fff !important;background-color:#7986cb !important}
            .w3-theme-l5 {color:#000 !important; background-color:#6888b1 !important}
            .w3-theme-l4 {color:#000 !important; background-color:#ffbacc !important}
            .w3-theme-l3 {color:#fff !important; background-color:#ff7499 !important}
            .w3-theme-l2 {color:#fff !important; background-color:#ff2f66 !important}
            .w3-theme-l1 {color:#fff !important; background-color:#e9003e !important}
            .w3-theme-d1 {color:#fff !important; background-color:#930027 !important}
            .w3-theme-d2 {color:#fff !important; background-color:#830023 !important}
            .w3-theme-d3 {color:#fff !important; background-color:#72001e !important}
            .w3-theme-d4 {color:#fff !important; background-color:#62001a !important}
            .w3-theme-d5 {color:#fff !important; background-color:#797979 !important}

            .w3-theme-light {color:#000 !important; background-color:#ffeaf0 !important}
            .w3-theme-dark {color:#fff !important; background-color:#520016 !important}
            .w3-theme-action {color:#fff !important; background-color:#520016 !important}

            .w3-theme {color:#fff !important; background-color:#a0002b  !important}
            .w3-text-theme {color:#a3002b !important}
            .w3-border-theme {border-color:#a3002b !important}

            .w3-hover-theme:hover {color:#fff !important; background-color:#a0002b !important}
            .gtg-hover-theme:hover {color:#fff !important; background-color:#26364a !important}


            .w3-hover-text-theme {color:#a3002b !important}
            .w3-hover-border-theme:hover {border-color:#a3002b !important}
            .w3-text-gtg
            {
                color: #a0002b;
            }



            .tooltip {
                position: absolute;
                display: inline-block;
                border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
            }

            /* Tooltip text */
            .tooltip .tooltiptext {
                visibility: hidden;
                width: 120px;
                background-color: black;
                color: #fff;
                text-align: center;
                padding: 5px 0;
                border-radius: 6px;

                /* Position the tooltip text - see examples below! */
                position: absolute;
                z-index: 1;
            }

            /* Show the tooltip text when you mouse over the tooltip container */
            .tooltip:hover .tooltiptext {
                visibility: visible;
            }

            .draggable
            {
                position: relative;
            }
            .follower
            {
                position: absolute;
            }


            #sidebar {

                width: 18%;

            }

            #sidebar ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            #sidebar ul li { margin: 0; }

            #sidebar ul li a {
                padding: 15px 20px;
                padding-left: 0;
                font-size: 16px;
                font-weight: 100;
                color: black;
                text-decoration: none;
                display: block;
                border-bottom: 1px solid #C9223D;
                -webkit-transition: background 0.3s ease-in-out;
                -moz-transition: background 0.3s ease-in-out;
                -ms-transition: background 0.3s ease-in-out;
                -o-transition: background 0.3s ease-in-out;
                transition: background 0.3s ease-in-out;
            }

            #sidebar li
            {
                background:rgb(163,0,43);
                /* Old browsers */
                background: -ms-linear-gradient(left, white 30% ,rgb(163,0,43) 70% );
                background: -webkit-linear-gradient(left, white 30% ,rgb(163,0,43) 70% );
                background: -o-linear-gradient(left,white 30% ,rgb(163,0,43) 70% );
                background: -moz-linear-gradient(left, white 30% ,rgb(163,0,43) 70% );
                background: linear-gradient(left, white ,rgb(163,0,43) 70% );
                background-size: 200% 100%;
                background-position:left bottom;
                margin-left:5px;
                transition:all 3s ease;
            }

            #sidebar li:hover{
                background-position: right bottom;
            }

            #toshow,#toshow2,#toshow3,#toshow4
            {
                display: none;
            }

            a.accordion.active {
                background: rgb(163,0,43);
            }


            a.accordion:after {
                content: '\02795'; /* Unicode character for "plus" sign (+) */
                font-size: 13px;
                color: #777;
                float: right;
                margin-left: 5px;
            }

            a.accordion.active:after {
                content: "\2796"; /* Unicode character for "minus" sign (-) */
            }

            #big-icon-1,#big-icon-2,#big-icon-3,#big-icon-4,#big-icon-5,#big-icon-6,#big-icon-7,#big-icon-8
            {
                font-size: 14px;
            }
            @media (max-width:601px) {
                #img{
                    height: 80px;
                    width: 70px;
                }
                #big-icon-1,#big-icon-2,#big-icon-3,#big-icon-4,#big-icon-5,#big-icon-6,#big-icon-7,#big-icon-8
                {
                    font-size: 26px;


                }
                .s-small-text
                {
                    font-size: 13px;
                }
                .s-hide{
                    display: none;
                }


            }






        </style>

        <title>Répartition</title>
        <script>
            $(document).ready(function () {
                $("#arpenteur").click(function () {
                    $("#toshow").toggle(1000);
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#dessinateur").click(function () {
                    $("#toshow2").toggle(1000);
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#secretaire").click(function () {
                    $("#toshow3").toggle(1000);
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#admin").click(function () {
                    $("#toshow4").toggle(1000);
                });
            });
        </script>
    </head>
    <body onload="setTableWeek()">
        <% String dateRe = request.getParameter("repartionDate");%>

        <!-- Sidebar -->
        <div class="w3-sidebar w3-bar-block w3-border-right w3-animate-left w3-theme-dark" style="display:none;z-index: 11;" id="sidebar">
            <button onclick="w3_close()" class="w3-bar-item w3-large">Fermer &times;</button>
            <div class="w3-row">
                <header>
                    <h1 class="w3-center"><img  src="img/gtg.jpg"  height="120" width="150" id="img"/></h1>
                </header>
            </div>

            <ul>
                <li class="w3-text-black  paddingLeft" id="arpenteur"><a class="accordion big-icon" href="#"><i class="fa fa-user-circle-o w3-left " style="position:relative;color: rgb(163,0,43)" id="big-icon-1"></i><span class="s-small-text"><span class="s-hide">Système</span> Arpenteur</span></a></li>
                <div id="toshow">
                    <li class="w3-text-black w3-center"><a href="./ServerAllTravaux?page=1">Travaux</a></li>





                </div>

            </ul>
            <ul>
                <li class="w3-text-black  " id="dessinateur"><a class="accordion" href="#"><i class="fa fa-paint-brush w3-left" style="position: relative;;color: rgb(163,0,43)" id="big-icon-2"></i><span class="s-small-text"><span class="s-hide">Système</span> dessinateur</span></a></li>
                <div id="toshow2">
                    <li class="w3-text-black w3-center" ><a href="./ServerAllDessinateur?page=1">Travaux</a></li>
                </div>


            </ul>


            
            
                                <ul>

                                    <li class="w3-text-black " id="admin"><a class="accordion" href="#"><i class="fa fa-user-secret w3-left" style="position: relative;;color: rgb(163,0,43)" id="big-icon-5"></i><span class="s-small-text">Admi<span class="s-hide">stratio</span>n</span></a></li>
                                    <div id="toshow4">
                                        <li class="w3-text-black w3-center"><a href="./ServerAllEmploye?page=1">Gestion employés </a></li>
                                        <li class="w3-text-black w3-center"><a href="./Server?action=alluser">Gestion des utilisateurs</a></li>
                                        <li class="w3-text-black w3-center"><a href="./DeleteRepAccess"><i class="fa fa-unlock w3-left" style="position: relative;color: rgb(163,0,43)"></i>Déverouiller la répartition</a></li>

                                    </div>

                                </ul>
                                <ul>
                                    <li class="w3-text-black  accordion"><a href="./ServerAllFournisseur?page=1"><i class="fa fa-truck w3-left" style="position: relative;;color: rgb(163,0,43)" id="big-icon-6"></i><span class="s-small-text">Fournisseur</span></a></li>

                                </ul>
                                <ul>
                                    <li class="w3-text-black  accordion"><a href="./ServerAllInstrument?page=1"><i class="fa fa-gavel w3-left" style="position: relative;;color: rgb(163,0,43)" id="big-icon-7"></i><span class="s-small-text">Instruments</span></a></li>

                                </ul>


                                <ul>
                                    <li class="w3-text-black  accordion"><a href="./LoginServer?action=logout"><i class="fa fa-sign-out w3-left" style="position: relative;color: rgb(163,0,43)" id="big-icon-8"></i><span class="s-small-text">Fermer session</span></a></li>

                                </ul>
                                </div><%-- End of side bar--%>

                                <div class="w3-bar w3-theme-dark w3-text-white">

                                    <a href="#" class="w3-bar-item w3-button w3-mobile w3-right w3-hover-theme"><img class="w3-round-xxlarge" src="img/${sessionScope.empImg}" alt="${sessionScope.nom}" height="50" width="50" title="${sessionScope.utilisateur.nom}" onclick="document.getElementById('imageCard').style.display = 'block'"/></a>
                                    <a href="#" class="w3-bar-item w3-button w3-mobile w3-right w3-hover-theme"><img class="w3-round-xxlarge" src="img/print.png" alt="imprimante" height="50" width="50" title="Visualisation ou impression de la répartition des travaux" onclick="preparerImpression()"/></a>

                                    <%@include file="SetImage.jsp"%>
                                    <button class="w3-button w3-hover-theme w3-xlarge" onclick="w3_open()">☰</button>


                                </div>

                                <form id="sav" action="./ImprimerServer" method="get">
                                    <input type="hidden" id="save" name="AllIds">
                                </form>

                                <button onclick="submit()"  title="Enregistrer" class="w3-btn w3-theme w3-round-xxlarge " style="position: absolute;right: 10px;z-index: 10;padding: 15px;top: 80px;" ><i class=" fa fa-download " style="font-size:20px"></i></button>
                                <form action="./DeleteRepAccess" method="get" style="position: absolute;left:  10px;z-index: 10;padding: 10px;top: 77px;">

                                    <a title="Déverouiller" class="w3-btn w3-theme w3-round-xxlarge " onclick="document.getElementById('info').style.display = 'block'"><i class="fa fa-unlock" style="font-size:25px"></i></a>
                                    <div class="w3-panel w3-theme w3-padding w3-animate-left" style="position: absolute;width: 350px;display: none" id="info">
                                        <span onclick="document.getElementById('info').style.display = 'none'" 
                                              class="w3-btn w3-round-xxlarge w3-card w3-display-topright w3-margin-left">&times;</span>
                                        <p>Veuillez sauvegarder votre repartion avant de la deverouiller sinon elle ne sera pas prise en compte.<br>Si elle a déjà été  sauvegarder,veuillez ignorer ce message.</p>
                                        <p class="w3-center"><button title="deverouiller" class="w3-btn    w3-card"><i class="fa fa-unlock" style="font-size:25px"></i></button></p>


                                    </div>
                                </form>

                                <div class="w3-row w3-center " style="position: relative;top: -20px;">
                                    <h3 class="w3-theme w3-padding">Changer de semaine</h3>
                                    <input id="dat1"/><i  class="fa fa-calendar " style="position: relative;left: -20px;"></i>
                                    <button title="changer de semaine" class="w3-btn  w3-theme w3-text-white" onclick="getWeekDay()" style="position: relative;left: -10px;top: -2px;padding: 2px;width: 50px"><i class="fa fa-eye" ></i></button>
                                    <p class="w3-large w3-text-gtg"><strong>Semaine du <span id="firstday"></span> au <span id="lastday"></span></strong></p>

                                    <div class="w3-row-padding">
                                        <button onclick="getPreviousWeek()" title="semaine précédente" class="w3-btn w3-white w3-round-xxlarge w3-border w3-border-theme w3-card" style="padding-top: 0;padding-bottom: 0;"><i  class="fa fa-calendar w3-text-theme" style="position: relative;left: -5px;top: -8px;"></i><i class="material-icons w3-text-theme" style="font-size:26px">arrow_back</i></button> Semaine 
                                        <button onclick="getNextWeek()" title="semaine suivante" class="w3-btn w3-white w3-round-xxlarge w3-border w3-border-theme w3-card" style="padding-top: 0;padding-bottom: 0"><i class="material-icons w3-text-theme" style="font-size:26px">arrow_forward</i><i  class="fa fa-calendar w3-text-theme" style="position: relative;right: -5px;top: -8px;"></i></button>
                                    </div>

                                </div>

















                                <div class="w3-row-padding w3-margin-top w3-margin-bottom">

                                    <div class="w3-row-padding w3-margin-bottom" style="margin-left: -15px" >
                                        <button class="w3-btn w3-green w3-card-4">Rendez-vous</button>
                                        <button  class="w3-btn w3-red w3-card-4">Deadline atteint</button>
                                        <button  class="w3-btn w3-white w3-card-4">Pas de rendez-vous</button>


                                    </div>





                                    <div class="w3-container   w3-white w3-border-gray w3-card-4" style="width: 300px;border:solid 5px">
                                        <div class="w3-row">
                                            <p class="w3-half ">
                                                <select class="w3-select w3-theme w3-card-4" name="option" id="ddlViewBy">
                                                    <option value="" disabled selected>Numéro travail</option>
                                                    <c:forEach var="id" items="${ids}">
                                                        <option value="${id}">${id}</option>
                                                    </c:forEach>



                                                </select>
                                            </p>

                                            <p class="w3-third w3-margin-left"><button class="w3-btn w3-theme w3-card-4" onclick="doUpdate()">Dupliquer</button></p>
                                        </div>
                                    </div>

                                    <div  id="trDiv" class="w3-col w3-card-4 w3-margin-right w3-grey" ondragover="allowDrop(event)" ondrop="dropBack(event)" style="width:10%;overflow-y: scroll">

                                        <header class="w3-gray">
                                            <h4 class="w3-center w3-card-4">Travaux</h4>
                                        </header>

                                        <c:forEach var="travail" items="${travaux}">
                                            <p trav="" class="w3-card <c:out value="${travail.color}"/>  w3-padding w3-margin-bottom w3-text-black draggable" id="<c:out value="${travail.travailId}"/>" draggable="true" ondragstart="drag(event)" ondragleave="hideCancel()"><span><strong><c:out value="${travail.dossier}"/><br>
                                                        <c:out value="${travail.client}"/></strong> <br> <c:out value="${travail.lieu}"/> [<strong><c:out value="${travail.dureEstime}"/></strong>]


                                            </p>




                                        </c:forEach>


                                    </div>

                                    <div  class="w3-col w3-card-4 w3-grey" style="width:10%;overflow-y: scroll">

                                        <header class="w3-gray">
                                            <h4 class="w3-center w3-card-4">Equipe</h4>
                                        </header>

                                        <c:forEach var="technicien" items="${TechniciensTerrain}">
                                            <p  arp="" class=" w3-card  w3-text-black w3-padding w3-margin-bottom" id="<c:out value="${technicien.empId}"/>" draggable="true" ondragstart="drag(event)" ondragleave="hideIcons()"><c:out value="${technicien.nom}"/> <c:out value="${technicien.prenom}"/></p>

                                        </c:forEach>



                                    </div>



                                    <div class="w3-col w3-card-4 w3-grey  w3-margin-left w3-margin-right"  style="width:8%;">
                                        <header class="w3-card-4 w3-gray">
                                            <h4 class="w3-center ">Intruments</h4>
                                        </header>


                                        <p class=" w3-card  w3-padding" style="background:Cyan" id="GPS" draggable="true" ondragstart="drag(event)" abbr="GPS"  ondragleave="hideIcons()">GPS</p>
                                        <p class=" w3-card  w3-padding" style="background:#ff0000" id="NIV" draggable="true" ondragstart="drag(event)" abbr="NIV"  ondragleave="hideIcons()">NIVEAU</p>
                                        <p class= " w3-card  w3-padding" style="background:#B22222" id="PRS" draggable="true" ondragstart="drag(event)" abbr="PRM"  ondragleave="hideIcons()">PRISME</p>
                                        <p class="w3-card  w3-padding"  style="background:#000000;color:white" id="JAL" draggable="true" ondragstart="drag(event)" abbr="JAL"  ondragleave="hideIcons()">JALON</p>
                                        <p class=" w3-card  w3-padding" style="background:#8B008B" id="TRE" draggable="true" ondragstart="drag(event)" abbr="TRP"  ondragleave="hideIcons()">TREPIED</p>
                                        <p class="w3-card w3-padding"  style="background:#FFFF00" id="STR" draggable="true" ondragstart="drag(event)" abbr="ROB"  ondragleave="hideIcons()">STATION TOTALE ROBOTISEE</p>
                                        <p class="w3-card  w3-padding" style="background: #778899" id="STV" draggable="true" ondragstart="drag(event)"  abbr="CON"  ondragleave="hideIcons()">STATION TOTALE CONV</p>
                                        <p class="w3-card  w3-padding" style="background: #778899" id="STV" draggable="true" ondragstart="drag(event)"  abbr="CON"  ondragleave="hideIcons()">STATION TOTALE CONV</p>
                                        <p class="w3-card  w3-padding" style="background:#FF1493" id="BATT" draggable="true" ondragstart="drag(event)"  abbr="BATT"  ondragleave="hideIcons()">BATTERIE</p>


                                    </div>



                                    <div class="w3-col" style="width:67%">
                                        <form action="./RepartionServer" method="post" id="repartionForm">
                                            <table id="myTable" class="w3-table-all all-slides ">

                                                <thead>
                                                    <tr>
                                                        <th class="w3-border-right   w3-grey w3-border-black"></th>
                                                        <th class="sal  w3-border-right  w3-grey w3-border-black" id="lun">Lundi <%= dateRe.substring(0, 5)%></th>
                                                        <th  class="sal w3-border-right  w3-grey w3-border-black" id="mar">Mardi</th>
                                                        <th  class="sal  w3-border-right  w3-grey w3-border-black" id="mer">Mercredi</th>
                                                        <th  class="sal  w3-border-right  w3-grey w3-border-black" id="jeu">Jeudi</th>
                                                        <th  class="sal  w3-border-right  w3-grey w3-border-black" id="ven">Vendredi</th>

                                                    </tr>
                                                </thead>
                                                <c:set var="count" value="0" scope="request"/>
                                                <c:set var="tdId" value="1" scope="request"/>

                                                <c:forEach var="repartition" items="${repartions}">

                                                    <tr  id="dropHere" ondragover="allowDrop(event)" ondrop="drop(event)">
                                                        <c:set var="count" value="${count + 1}" scope="request"/>
                                                        <td class=" w3-grey" numero=''>#${count}</td>
                                                        <td class="w3-margin-bottom"><input  class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;" id="lundi<c:out value="${repartition.id}"/>" value="<c:out value="${repartition.lundi}"/>"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>
                                                        <td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;" id="mardi<c:out value="${repartition.id}"/>" value="<c:out value="${repartition.mardi}"/>"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>
                                                        <td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;" id="mercredi<c:out value="${repartition.id}"/>" value="<c:out value="${repartition.mercredi}"/>"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>
                                                        <td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;" id="jeudi<c:out value="${repartition.id}"/>" value="<c:out value="${repartition.jeudi}"/>"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>
                                                        <td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;" id="vendredi<c:out value="${repartition.id}"/>" value="<c:out value="${repartition.vendredi}"/>"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>

                                                    </tr>
                                                </c:forEach>





                                            </table>
                                            <div>
                                                <input class="w3-btn w3-card-4" type="hidden" id="repartionDate" name="repartionDate" readonly="">
                                                <input type="hidden" id="ini"/>
                                            </div>
                                        </form>
                                        <div class="w3-border-red w3-round-xxlarge">
                                            <button title="Enlever une equipe" onclick="myDeleteFunction()" class="pulsatingCircle  w3-btnP w3-margin-top w3-left">

                                                <span class="firstCircle"><span style="position:relative;top:-10.5px;left:0px;font-size:5px;color:#fff">-</span></span>


                                                <span class="secondCircle"></span>

                                                <span class="thirdCircle"></span>

                                            </button>

                                            <button title="Ajouter une equipe" onclick="myCreateFunction()" class="pulsatingCircle  w3-btnP w3-margin-top w3-right">

                                                <span class="firstCircle"><span style="position:relative;top:-10.5px;left:0px;font-size:5px;color:#fff">+</span></span>


                                                <span class="secondCircle"></span>

                                                <span class="thirdCircle"></span>

                                            </button>
                                        </div>



                                    </div>



                                    <script>
                                        function preparerImpression()
                                        {
                                            var tds = document.getElementsByTagName('td');
                                            var AllIds = " ";
                                            for (var i = 0; i < tds.length; i++)
                                            {
                                                var sumOfInputs = "rien";
                                                var allpara = [];
                                                if (!tds[i].hasAttribute("numero"))
                                                {

                                                    sumOfInputs = tds[i].getElementsByTagName('input')[0].value;
                                                    if (sumOfInputs == " " || sumOfInputs == "")
                                                        sumOfInputs = "rien";
                                                    allpara = tds[i].getElementsByTagName('p');
                                                    var print = document.createElement("INPUT");
                                                    print.setAttribute("name", "print");



                                                    for (var y = 0; y < allpara.length; y++) // inputs.length-1 pour ne pas inclure dans le string a saved dans la db le id du travail qui est generé à la ligne 407
                                                    {

                                                        sumOfInputs += "," + allpara[y].getAttribute("id");

                                                    }



                                                    print.value = sumOfInputs;
                                                    print.classList.add('w3-hide');
                                                    tds[i].appendChild(print);
                                                    AllIds += sumOfInputs + "@";

                                                }


                                            }
                                            document.getElementById("save").value = AllIds;
                                            document.getElementById('sav').submit();
                                            
                                           
                                                                                                    
                                            






                                        }


                                        function w3_open() {
                                            document.getElementById("sidebar").style.display = "block";
                                        }
                                        function w3_close() {
                                            document.getElementById("sidebar").style.display = "none";
                                        }
                                        function doUpdate()//ajax pour envoyer une requête au serveur en background.
                                        {
                                            var req;
                                            var e = document.getElementById("ddlViewBy");
                                            var text = e.options[e.selectedIndex].value;

                                            if (window.XMLHttpRequest)
                                            {
                                                req = new XMLHttpRequest();
                                            } else if (window.ActiveXObject)
                                            {
                                                req = new ActiveXObject("Microsoft.XMLHTTP");
                                            } else
                                            {
                                                aleter("Ajax not supported");
                                            }
                                            req.onreadystatechange = function () {
                                                if (req.readyState == 4 && req.status == 200)
                                                {
                                                    document.getElementById("trDiv").insertAdjacentHTML('beforeend', req.responseText);
                                                }
                                            }
                                            req.open("GET", "./Async?travailId=" + text, true);
                                            req.send(null);
                                        }

                                        var equipeCount = ${count};
                                        var cellId = 2;

                                        //la fonction qui me permet de decomposer le string dans le input returned from the db.
                                        var tds = document.getElementsByTagName('td');
                                        for (var i = 0; i < tds.length; i++)
                                        {
                                            if (!tds[i].hasAttribute("numero"))
                                            {
                                                var input = tds[i].getElementsByTagName('input');
                                                var inputVal = input[0].value;
                                                var res = inputVal.split(",");
                                                input[0].value = res[0];
                                                for (var j = 1; j < res.length; j++)
                                                {
                                                    tds[i].insertAdjacentHTML('beforeend', res[j]);//je pouvais aussi créer un textnode et utiliser nodeText,insertAdjacentHTML takes a text parses it as html and insert it at a specified position

                                                    //var btn = document.createElement("INPUT");
                                                    //btn.value = res[j];
                                                    //btn.setAttribute("name", "tr");
                                                    //btn.classList.add('w3-show');
                                                    //tds[i].appendChild(btn);







                                                }

                                            }

                                        } //fin de la decomposition




                                        function sumUp()
                                        {

                                            var tds = document.getElementsByTagName('td');
                                            for (var i = 0; i < tds.length; i++)
                                            {
                                                if (!tds[i].hasAttribute("numero"))
                                                {
                                                    var inputs = tds[i].getElementsByTagName('input');
                                                    var sumOfInputs = "";

                                                    for (var y = 0; y < inputs.length; y++) // inputs.length-1 pour ne pas inclure dans le string a saved dans la db le id du travail qui est generé à la ligne 407
                                                    {
                                                         if (!((inputs[y].getAttribute("name") == "ids") || (inputs[y].getAttribute("name") == "print")))
                                                        {
                                                            if (sumOfInputs == "")
                                                                sumOfInputs += inputs[y].value;
                                                            else
                                                                sumOfInputs += "," + inputs[y].value;
                                                        }

                                                    }


                                                    var btn = document.createElement("INPUT");
                                                    btn.setAttribute("name", "sumUp");
                                                    if (sumOfInputs == "")
                                                        btn.value = " ";//je peux mettre rien aussi comme btn.value = "rien";
                                                    else
                                                        btn.value = sumOfInputs;
                                                    btn.classList.add('w3-hide');
                                                    tds[i].appendChild(btn);
                                                }

                                            }
                                        }
                                        function hideIcons()
                                        {


                                            var x = document.getElementsByClassName('arrow_downward');
                                            var i;
                                            for (i = 0; i < x.length; i++)
                                            {
                                                x[i].classList.remove("w3-show");
                                                x[i].classList.add("w3-hide");
                                            }
                                        }
                                        function  hideCancel()
                                        {
                                            var x = document.getElementsByClassName('cancel');
                                            var i;
                                            for (i = 0; i < x.length; i++)
                                            {
                                                x[i].classList.remove("w3-show");
                                                x[i].classList.add("w3-hide");
                                            }
                                        }
                                        function allowDrop(ev)
                                        {
                                            ev.preventDefault();

                                        }

                                        function drag(ev)
                                        {

                                            ev.dataTransfer.setData("text", ev.target.id);
                                            var data = ev.dataTransfer.getData("text");
                                            data.classList.remove("w3-animate-bottom");
                                            if ((document.getElementById(data).hasAttribute("abbr") || document.getElementById(data).hasAttribute("arp")))
                                            {

                                                var x = document.getElementsByClassName('arrow_downward');
                                                var i;
                                                for (i = 0; i < x.length; i++)
                                                {
                                                    x[i].classList.remove("w3-hide");
                                                    x[i].classList.add("w3-show");

                                                }

                                            } else
                                            {

                                                var x = document.getElementsByClassName('cancel');
                                                var i;
                                                for (i = 0; i < x.length; i++)
                                                {
                                                    x[i].classList.remove("w3-hide");
                                                    x[i].classList.add("w3-show");

                                                }
                                            }








                                        }

                                        function htmlStructureOf(data)// cause des problème sur chrome
                                        {
                                            var target = document.getElementById(data);
                                            var wrap = document.createElement('div');
                                            wrap.appendChild(target.cloneNode(true));
                                            return wrap.innerHTML;
                                        }

                                        function drop(ev)
                                        {
                                            ev.preventDefault();
                                            var data = ev.dataTransfer.getData("text");
                                            var myAudio = document.createElement('audio');
                                            myAudio.controls = true;
                                            myAudio.src = 'audio/drop.mp3';


                                            if (!(document.getElementById(data).hasAttribute("abbr") || document.getElementById(data).hasAttribute("arp")))
                                            {
                                                ev.target.appendChild(document.getElementById(data));
                                                myAudio.play();










                                            }

                                            if (document.getElementById(data).hasAttribute("abbr"))
                                            {
                                                if (document.getElementById(ev.target.id).value == "" || document.getElementById(ev.target.id).value == " ")
                                                    document.getElementById(ev.target.id).value += document.getElementById(data).getAttribute("abbr");
                                                else
                                                    document.getElementById(ev.target.id).value += "/" + document.getElementById(data).getAttribute("abbr");
                                            } else if (document.getElementById(data).hasAttribute("arp")) {
                                                //get initial of employees
                                                var nomP = document.getElementById(data).innerHTML;
                                                var nom = nomP.split(' ').map(function (s) {
                                                    return s.charAt(0);
                                                }).join('.');


                                                if (document.getElementById(ev.target.id).value == "")
                                                    document.getElementById(ev.target.id).value += nom;
                                                else
                                                    document.getElementById(ev.target.id).value += "/" + nom;
                                            }




                                        }

                                        function  dropBack(ev)
                                        {
                                            ev.preventDefault();
                                            var data = ev.dataTransfer.getData("text");

                                            var myAudio = document.createElement('audio');
                                            myAudio.controls = true;
                                            myAudio.src = 'audio/whip.mp3';

                                            if (!(document.getElementById(data).hasAttribute("abbr") || document.getElementById(data).hasAttribute("arp")))
                                            {
                                                ev.target.appendChild(document.getElementById(data));
                                                myAudio.play();









                                            }
                                        }

                                        function createInputs()
                                        {
                                            var tds = document.getElementsByTagName('td');
                                            for (var i = 0; i < tds.length; i++)
                                            {
                                                if (!tds[i].hasAttribute("numero"))
                                                {
                                                    var paras = tds[i].getElementsByTagName('p');
                                                    for (var j = 0; j < paras.length; j++)
                                                    {
                                                        var btn = document.createElement("INPUT");
                                                        var btnId = document.createElement("INPUT");
                                                        btn.value = htmlStructureOf(paras[j].getAttribute("id"));
                                                        btn.setAttribute("name", "tr");
                                                        btn.classList.add('w3-hide');
                                                        tds[i].appendChild(btn);

                                                        btnId.value = paras[j].getAttribute("id");
                                                        btnId.setAttribute("name", "ids");
                                                        btnId.classList.add('w3-hide');
                                                        tds[i].appendChild(btnId);


                                                    }

                                                }
                                            }
                                        }






                                        function myCreateFunction() {
                                            equipeCount++;
                                            cellId++;


                                            var table = document.getElementById("myTable");
                                            var row = table.insertRow(-1);//insert at last position
                                            row.setAttribute("id", "dropHere");
                                            row.setAttribute("ondragover", "allowDrop(event)");
                                            row.setAttribute("ondrop", "drop(event)");



                                            var cell1 = row.insertCell(0);
                                            cell1.innerHTML = "#" + equipeCount;
                                            cell1.setAttribute("numero", "");
                                            cell1.classList.add("w3-grey");

                                            var cell2 = row.insertCell(1);
                                            cell2.innerHTML = '<td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>';
                                            cell2.firstChild.setAttribute("id", "t" + cellId);

                                            var cell3 = row.insertCell(2);
                                            cell3.innerHTML = '<td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>';
                                            cell3.firstChild.setAttribute("id", "s" + cellId);

                                            var cell4 = row.insertCell(3);
                                            cell4.innerHTML = '<td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>';
                                            cell4.firstChild.setAttribute("id", "u" + cellId);

                                            var cell5 = row.insertCell(4);
                                            cell5.innerHTML = '<td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>';
                                            cell5.firstChild.setAttribute("id", "x" + cellId);

                                            var cell6 = row.insertCell(5);
                                            cell6.innerHTML = '<td class="w3-margin-bottom" ><input class="w3-input w3-border gtg-font w3-hover-theme" name="first" type="text" style="height: 27px;"><i class="material-icons w3-text-red arrow_downward w3-hide" style="position: relative;top: -38px;left: 33%;font-size:26px">arrow_downward</i><i class="material-icons w3-text-red w3-hide cancel" style="position: relative;top: -27px;left: 33%;font-size:26px;z-index: 10">cancel</i></td>';
                                            cell6.firstChild.setAttribute("id", "z" + cellId);

                                        }

                                        function myDeleteFunction() {
                                            document.getElementById("myTable").deleteRow(-1);
                                            equipeCount--;
                                        }
                                    </script>

                                    <script src="//code.jquery.com/jquery.min.js"></script>
                                    <script src="js/date-time-picker.min.js"></script>
                                    <script type="text/javascript">
                                        var j = $.noConflict(true);
                                    </script>
                                    <script>
                                        j('#dat1').dateTimePicker({

                                            // used to limit the date range
                                            limitMax: null,
                                            limitMin: null,

                                            // year name
                                            yearName: '',

                                            // month names
                                            monthName: ['JAN', 'FEV', 'MAR', 'AVR', 'MAI', 'JUIN', 'JUL', 'AOÛT', 'SEP', 'OCT', 'NOV', 'DEC'],

                                            // day names
                                            dayName: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],

                                            // "date" or "dateTime"
                                            mode: 'date',

                                            // custom date format
                                            format: null



                                        });




                                        j('#repartionForm').submit(function () {

                                        });


                                    </script>



                                    <script>

                                        function submit()
                                        {
                                            createInputs();
                                            sumUp();
                                            document.getElementById('repartionForm').submit();

                                        }




                                        function  getWeekDay()
                                        {
                                            var date1 = document.getElementById('dat1').value;
                                            var trueDate;
                                            if (date1 != "")
                                            {
                                                var jour = date1.substr(0, 2);
                                                var mois = date1.substr(3, 2);
                                                var an = date1.substr(6);

                                                trueDate = an + "-" + mois + "-" + jour;
                                            } else
                                            {
                                                var date = new Date();
                                                var an = date.getFullYear();
                                                var mois = date.getMonth() + 1;
                                                var jour = date.getDate();

                                                if (jour < 10)
                                                    jour = "0" + jour;
                                                if (mois < 10)
                                                    mois = "0" + mois;

                                                trueDate = an + "-" + mois + "-" + jour;

                                            }


                                            var curr = new Date(trueDate); // get current date
                                            var first = (curr.getDate() - curr.getDay()) + 1; // First day is the day of the month - the day of the week

                                            var last = first + 4; // last day is the first day + 6



                                            var firstday = new Date(curr.setDate(first)).getDate();
                                            var firstdaymonth = new Date(curr.setDate(firstday)).getMonth() + 1;
                                            var firstdayYear = new Date(curr.setDate(firstday)).getFullYear();








                                            //passthisdate is the date made when you get the first day of the week which means when you monday date then
                                            //get tuesday,wed,thu since lastday correspond to friday no need to compute fri's value;



                                            var passthisdate = firstdayYear + "-" + firstdaymonth + "-" + firstday;

                                            var lundi = new Date(passthisdate);
                                            var mardi = new Date(passthisdate);
                                            var mercredi = new Date(passthisdate);
                                            var jeudi = new Date(passthisdate);
                                            var vendredi = new Date(passthisdate);
                                            var nextMonday = new Date(passthisdate);




                                            lundi.setDate(lundi.getDate());
                                            mardi.setDate(mardi.getDate() + 1);
                                            mercredi.setDate(mercredi.getDate() + 2);
                                            jeudi.setDate(jeudi.getDate() + 3);

                                            vendredi.setDate(vendredi.getDate() + 4);

                                            var lundiDate = lundi.getDate();
                                            var lundiMonth = lundi.getMonth() + 1;



                                            if (lundiDate < 10)
                                                lundiDate = "0" + lundiDate;
                                            if (lundiMonth < 10)
                                                lundiMonth = "0" + lundiMonth;




                                            document.getElementById('firstday').innerHTML = "lundi " + lundi.getDate() + "/" + (lundi.getMonth() + 1) + "/" + lundi.getFullYear();
                                            document.getElementById('lastday').innerHTML = "vendredi " + vendredi.getDate() + "/" + (vendredi.getMonth() + 1) + "/" + vendredi.getFullYear();


                                            document.getElementById("lun").innerHTML = "Lundi  " + lundi.getDate() + "/" + (lundi.getMonth() + 1);
                                            document.getElementById("mar").innerHTML = "Mardi  " + mardi.getDate() + "/" + (mardi.getMonth() + 1);
                                            document.getElementById("mer").innerHTML = "Mercredi  " + mercredi.getDate() + "/" + (mercredi.getMonth() + 1);
                                            document.getElementById("jeu").innerHTML = "Jeudi  " + jeudi.getDate() + "/" + (jeudi.getMonth() + 1);
                                            document.getElementById("ven").innerHTML = "Vendredi  " + vendredi.getDate() + "/" + (vendredi.getMonth() + 1);
                                            var trueDate = lundiDate + "/" + lundiMonth + "/" + lundi.getFullYear();
                                            document.getElementById('repartionDate').value = trueDate;

                                            var url = location.href = './RepartitionAccesssController?user=${sessionScope.nom}&zero=${sessionScope.empid}&repartionDate=' + trueDate;
                                            return url;






                                        }





                                        function getNextWeek()
                                        {

                                        <%
                                            String repartionDate = request.getParameter("repartionDate");
                                            String j = repartionDate.substring(0, 2);
                                            String m = repartionDate.substring(3, 5);
                                            String a = repartionDate.substring(6);
                                            String nextMondayMonth = null;
                                            String nextMondayDay = null;

                                            int jour = Integer.parseInt(j);
                                            int mois = Integer.parseInt(m);
                                            int an = Integer.parseInt(a);

                                            LocalDate locd = LocalDate.now(ZoneId.of("America/Montreal"));
                                            LocalDate l = locd.of(an, mois, jour);
                                            LocalDate nextmonday = l.plusWeeks(1);
                                            if (nextmonday.getDayOfMonth() < 10) {
                                                nextMondayDay = "0" + nextmonday.getDayOfMonth();
                                            } else {
                                                nextMondayDay = Integer.toString(nextmonday.getDayOfMonth());
                                            }
                                            if (nextmonday.getMonthValue() < 10) {
                                                nextMondayMonth = "0" + nextmonday.getMonthValue();
                                            } else {
                                                nextMondayMonth = Integer.toString(nextmonday.getMonthValue());
                                            }


                                        %>

                                            // var jour = date1.substr(0, 2);
                                            // var mois = date1.substr(3, 2);
                                            // var an = date1.substr(6);


                                            // if (mois < 10 && (!mois.startsWith(0)))
                                            //   mois = "0" + mois;
                                            // if (jour < 10 && (!jour.startsWith(0)))
                                            // jour = "0" + jour;
                                            //var trueDate = an + "-" + mois + "-" + jour;
                                            //var curr = new Date(trueDate); // get current date
                                            //var first = (curr.getDate() - curr.getDay()) + 2; // First day is the day of the month - the day of the week




                                            //var firstday = new Date(curr.setDate(first)).getDate();
                                            //var firstdaymonth = new Date(curr.setDate(firstday)).getMonth() + 1;
                                            // var firstdayYear = new Date(curr.setDate(firstday)).getFullYear();

                                            //var passthisdate = firstdayYear + "-" + firstdaymonth + "-" + firstday;


                                            //var lundi = new Date(passthisdate);
                                            //var nextWeekMonday = new Date(passthisdate);
                                            //var nextWeekTuesday = new Date(passthisdate);
                                            //var nextWeekWednesday = new Date(passthisdate);
                                            //var nextWeekThursday = new Date(passthisdate);
                                            //var nextWeekFriday = new Date(passthisdate);


                                            //lundi.setDate(lundi.getDate());
                                            //nextWeekMonday.setDate(lundi.getDate() + 7);
                                            // nextWeekTuesday.setDate(nextWeekMonday.getDate() + 1);
                                            // nextWeekWednesday.setDate(nextWeekMonday.getDate() + 2);
                                            // nextWeekThursday.setDate(nextWeekMonday.getDate() + 3);
                                            // nextWeekFriday.setDate(nextWeekMonday.getDate() + 4);

                                            //  var nextMonday = nextWeekMonday.getDate();
                                            //  var nextMondayMonth = nextWeekMonday.getMonth() + 1;
                                            // if (nextMonday < 10)
                                            //    nextMonday = "0" + nextMonday;
                                            //  if (nextMondayMonth < 10)
                                            //   nextMondayMonth = "0" + nextMondayMonth;






                                            document.getElementById('firstday').innerHTML = "lundi " + "<%=nextmonday.getDayOfMonth()%>" + "/" + "<%=nextmonday.getDayOfMonth()%>" + "/" + "<%=nextmonday.getDayOfMonth()%>";
                                            document.getElementById('lastday').innerHTML = "vendredi " + "<%=nextmonday.plusDays(4).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(4).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(4).getDayOfMonth()%>";


                                            document.getElementById("lun").innerHTML = "Lundi " + "<%=nextmonday.getDayOfMonth()%>" + "/" + "<%=nextmonday.getDayOfMonth()%>" + "/" + "<%=nextmonday.getDayOfMonth()%>";
                                            document.getElementById("mar").innerHTML = "Mardi  " + "<%=nextmonday.plusDays(1).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(1).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(1).getDayOfMonth()%>";
                                            document.getElementById("mer").innerHTML = "Wednesday  " + "<%=nextmonday.plusDays(2).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(2).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(2).getDayOfMonth()%>";
                                            document.getElementById("jeu").innerHTML = "Jeudi  " + "<%=nextmonday.plusDays(3).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(3).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(3).getDayOfMonth()%>";
                                            document.getElementById("ven").innerHTML = "Vendredi " + "<%=nextmonday.plusDays(4).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(4).getDayOfMonth()%>" + "/" + "<%=nextmonday.plusDays(4).getDayOfMonth()%>";



                                            document.getElementById('repartionDate').value = "<%=nextmonday.getDayOfMonth()%>" + "/" + "<%=nextmonday.getDayOfMonth()%>" + "/" + "<%=nextmonday.getDayOfMonth()%>";

                                            var trueDate = "<%=nextMondayDay%>" + "/" + "<%=nextMondayMonth%>" + "/" + "<%=nextmonday.getYear()%>";

                                            var url = location.href = './RepartitionAccesssController?user=${sessionScope.nom}&zero=${sessionScope.empid}&repartionDate=' + trueDate;
                                            return url;






                                        }

                                        function  getPreviousWeek()
                                        {

                                        <%
                                            String prevwrepartionDate = request.getParameter("repartionDate");
                                            String prevwj = prevwrepartionDate.substring(0, 2);
                                            String prevwm = prevwrepartionDate.substring(3, 5);
                                            String prevwa = prevwrepartionDate.substring(6);
                                            String prevwMondayMonth = null;
                                            String prevwMondayDay = null;

                                            int prevwjour = Integer.parseInt(prevwj);
                                            int prevwmois = Integer.parseInt(prevwm);
                                            int prevwan = Integer.parseInt(prevwa);

                                            LocalDate prevwlocd = LocalDate.now(ZoneId.of("America/Montreal"));
                                            LocalDate prevwl = prevwlocd.of(prevwan, prevwmois, prevwjour);
                                            LocalDate prevwmonday = prevwl.minusWeeks(1);
                                            if (prevwmonday.getDayOfMonth() < 10) {
                                                prevwMondayDay = "0" + prevwmonday.getDayOfMonth();
                                            } else {
                                                prevwMondayDay = Integer.toString(prevwmonday.getDayOfMonth());
                                            }
                                            if (prevwmonday.getMonthValue() < 10) {
                                                prevwMondayMonth = "0" + prevwmonday.getMonthValue();
                                            } else {
                                                prevwMondayMonth = Integer.toString(prevwmonday.getMonthValue());
                                            }


                                        %>


                                            //  var jour = date1.substr(0, 2);
                                            //  var mois = date1.substr(3, 2);
                                            //  var an = date1.substr(6);


                                            // if (mois < 10 && (!mois.startsWith(0)))
                                            //     mois = "0" + mois;
                                            // if (jour < 10 && (!jour.startsWith(0)))
                                            //     jour = "0" + jour;
                                            // var trueDate = an + "-" + mois + "-" + jour;
                                            // var curr = new Date(trueDate); // get current date
                                            // var first = (curr.getDate() - curr.getDay()) + 2; // First day is the day of the month - the day of the week




                                            // var firstday = new Date(curr.setDate(first)).getDate();
                                            // var firstdaymonth = new Date(curr.setDate(firstday)).getMonth() + 1;
                                            // var firstdayYear = new Date(curr.setDate(firstday)).getFullYear();

                                            //var passthisdate = firstdayYear + "-" + firstdaymonth + "-" + firstday;


                                            // var lundi = new Date(passthisdate);
                                            // var previousWeekMonday = new Date(passthisdate);
                                            // var previousWeekTuesday = new Date(passthisdate);
                                            // var previousWeekWednesday = new Date(passthisdate);
                                            // var previousWeekThursday = new Date(passthisdate);
                                            // var previousWeekFriday = new Date(passthisdate);


                                            //lundi.setDate(lundi.getDate());
                                            // previousWeekMonday.setDate(lundi.getDate() - 7);
                                            // previousWeekTuesday.setDate(previousWeekMonday.getDate() - 1);
                                            // previousWeekWednesday.setDate(previousWeekMonday.getDate() - 2);
                                            //previousWeekThursday.setDate(previousWeekMonday.getDate() - 3);
                                            //previousWeekFriday.setDate(previousWeekMonday.getDate() - 4);

                                            //var previousMonday = previousWeekMonday.getDate();
                                            //var previousMondayMonth = previousWeekMonday.getMonth() + 1;
                                            //if (previousMonday < 10)
                                            //  previousMonday = "0" + previousMonday;
                                            //if (previousMondayMonth < 10)
                                            // previousMondayMonth = "0" + previousMondayMonth;





                                            document.getElementById('firstday').innerHTML = "lundi " + "<%=prevwmonday.getDayOfMonth()%>" + "/" + "<%=prevwmonday.getDayOfMonth()%>" + "/" + "<%=prevwmonday.getDayOfMonth()%>";
                                            document.getElementById('lastday').innerHTML = "vendredi " + "<%=prevwmonday.plusDays(4).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(4).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(4).getDayOfMonth()%>";


                                            document.getElementById("lun").innerHTML = "Lundi " + "<%=prevwmonday.getDayOfMonth()%>" + "/" + "<%=prevwmonday.getDayOfMonth()%>" + "/" + "<%=prevwmonday.getDayOfMonth()%>";
                                            document.getElementById("mar").innerHTML = "Mardi " + "<%=prevwmonday.plusDays(1).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(1).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(1).getDayOfMonth()%>";
                                            document.getElementById("mer").innerHTML = "Mercredi  " + "<%=prevwmonday.plusDays(2).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(2).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(2).getDayOfMonth()%>";
                                            document.getElementById("jeu").innerHTML = "Jeudi  " + "<%=prevwmonday.plusDays(3).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(3).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(3).getDayOfMonth()%>";
                                            document.getElementById("ven").innerHTML = "Vendredi " + "<%=prevwmonday.plusDays(4).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(4).getDayOfMonth()%>" + "/" + "<%=prevwmonday.plusDays(4).getDayOfMonth()%>";



                                            document.getElementById('repartionDate').value = "<%=prevwmonday.getDayOfMonth()%>" + "/" + "<%=prevwmonday.getDayOfMonth()%>" + "/" + "<%=prevwmonday.getDayOfMonth()%>";

                                            var trueDate = "<%=prevwMondayDay%>" + "/" + "<%=prevwMondayMonth%>" + "/" + "<%=prevwmonday.getYear()%>";

                                            var url = location.href = './RepartitionAccesssController?user=${sessionScope.nom}&zero=${sessionScope.empid}&repartionDate=' + trueDate;
                                            return url;

                                        }



                                        function setTableWeek()
                                        {

                                        <%
                                            String repartionDateFromUrl = request.getParameter("repartionDate");
                                            String jj = repartionDateFromUrl.substring(0, 2);
                                            String mm = repartionDateFromUrl.substring(3, 5);
                                            String aa = repartionDateFromUrl.substring(6);
                                            String lundiDay = null;
                                            String lundiMonth = null;

                                            int jjour = Integer.parseInt(jj);
                                            int mmois = Integer.parseInt(mm);
                                            int aan = Integer.parseInt(aa);

                                            LocalDate ld = LocalDate.now(ZoneId.of("America/Montreal"));
                                            LocalDate lundi = ld.of(aan, mmois, jjour);

                                            if (lundi.getDayOfMonth() < 10) {
                                                lundiDay = "0" + lundi.getDayOfMonth();
                                            } else {
                                                lundiDay = Integer.toString(lundi.getDayOfMonth());
                                            }
                                            if (lundi.getMonthValue() < 10) {
                                                lundiMonth = "0" + lundi.getMonthValue();
                                            } else {
                                                lundiMonth = Integer.toString(lundi.getMonthValue());
                                            }


                                        %>






                                            document.getElementById('firstday').innerHTML = "lundi " + "<%=lundi.getDayOfMonth()%>" + "/" + "<%=lundi.getMonthValue()%>" + "/" + "<%=lundi.getYear()%>";
                                            document.getElementById('lastday').innerHTML = "vendredi " + "<%=lundi.plusDays(4).getDayOfMonth()%>" + "/" + "<%=lundi.plusDays(4).getMonthValue()%>" + "/" + +"<%=lundi.plusDays(4).getYear()%>";


                                            document.getElementById("lun").innerHTML = "Lundi  " + "<%=lundi.getDayOfMonth()%>" + "/" + "<%=lundi.getMonthValue()%>";
                                            document.getElementById("mar").innerHTML = "Mardi  " + "<%=lundi.plusDays(1).getDayOfMonth()%>" + "/" + "<%=lundi.plusDays(1).getMonthValue()%>";
                                            document.getElementById("mer").innerHTML = "Mercredi  " + "<%=lundi.plusDays(2).getDayOfMonth()%>" + "/" + "<%=lundi.plusDays(2).getMonthValue()%>";
                                            document.getElementById("jeu").innerHTML = "Jeudi  " + "<%=lundi.plusDays(3).getDayOfMonth()%>" + "/" + "<%=lundi.plusDays(3).getMonthValue()%>";
                                            document.getElementById("ven").innerHTML = "Vendredi  " + "<%=lundi.plusDays(5).getDayOfMonth()%>" + "/" + "<%=lundi.plusDays(5).getMonthValue()%>";

                                            document.getElementById('repartionDate').value = "<%=lundiDay%>" + "/" + "<%=lundiMonth%>" + "/" + "<%=lundi.getYear()%>";


                                        }






                                    </script>
                                    <script src="js/DragDropTouch.js"></script>


                                    </body>
                                    </html>
