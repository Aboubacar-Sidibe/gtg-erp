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

            @media only screen and (max-width:601px){

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #form2
                {
                    position: relative;
                    top: 600px;
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
                            <button title="Add new employee"  class="pulsatingCircle w3-btnP w3-margin-top" style="position: fixed;float:right;right: 10px;" onclick="document.getElementById('addemploye').style.display = 'block'">

                                <span class="firstCircle"><span style="position: relative;top:-12px"><i class="fa fa-user-plus" style="font-size: 3px;position: relative;right: 0px;color: #fff"></i></span></span>


                                <span class="secondCircle"></span>

                                <span class="thirdCircle"></span>

                            </button>
                        </c:if>

                        <a class=" w3-container w3-right w3-rest">
                            <img style="position: relative;right: 15px" class="w3-round-xxlarge  w3-card-32" src="img/${sessionScope.empImg}" alt="User" height="50" width="50" title="${sessionScope.utilisateur.nom}" onclick="document.getElementById('imageCard').style.display = 'block'"/>
                        </a>

                        <%@include file="SetImage.jsp"%>

                    </div>
                    <div class="w3-row w3-center">
                        <h2 class="w3-center w3-container w3-text-white w3-btn w3-card-32" style="background: rgb(163,0,43);">Liste employés</h2>
                    </div>





                </header>


                <c:if test="${fonction=='Arpenteur'}">
                    <%@include file="AddEmploye.jsp"%>
                </c:if>


                <%--pagination--%>
                <div id="filtre-container" class="w3-hide-medium w3-hide-large">
                    <button class="w3-btn w3-white w3-right w3-card-4" onclick="document.getElementById('filtre').style.display = 'block'">Filtre</button>
                    <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray" id="filtre" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Entrez un mot clé" style="display: none">
                </div>

                <div class="w3-margin-bottom w3-padding w3-hide-medium w3-hide-large" id="pagination" style="overflow-x: auto;">
                    <c:forEach var = "i" begin = "1" end = "${no}">
                        <a class="w3-border w3-padding w3-hover-opacity w3-card-4 w3-round-xxlarge w3-dark-gray" href="./ServerAllEmploye?page=${i}">${i} </a>

                    </c:forEach>
                </div>


                <div style="overflow-x: auto;">
                    <div class="w3-white w3-margin-bottom">
                        <table class="w3-table w3-table-all w3-card-32" id="id01" style="width: 95%;margin-left: 30px">


                            <tr class="w3-text-white" style="background: rgb(163,0,43)">
                                <th class="w3-border-right"  onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">Nom<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right"  onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">Prénom<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>

                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(2)')" style="cursor:pointer">Fonction<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(3)')" style="cursor:pointer">Télephone<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(4)')" style="cursor:pointer">Ville<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(5)')" style="cursor:pointer;">Email<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                                <th colspan="6" class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(6)')" style="cursor:pointer">Actions<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    


                            </tr>
                            <c:forEach  var="employe" items="${employes}">
                                <tr class="w3-text-black  w3-hover-pink item">
                                    <td class="w3-border-right"><c:out value="${employe.nom}"/></td>
                                    <td class="w3-border-right"><c:out value="${employe.prenom}"/></td>
                                    <td class="w3-border-right"><c:out value="${employe.fonction}"/></td>
                                    <td class="w3-border-right"><c:out value="${employe.telephoneResidence}"/></td>
                                    <td class="w3-border-right"><c:out value="${employe.ville}"/></td>
                                    <td class="w3-border-right"><c:out value="${employe.email}"/></td>
                                    <td title="modification" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="${employe.empId}"/>').style.display = 'block'"><i  class="fa fa-pencil" style="font-size:14px"></i></td>
                                        <c:if test="${fonction=='Arpenteur'}">
                                        <td title="gestion de salaire" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="salary${employe.empId}"/>').style.display = 'block'"><i class="fa fa-usd" style="font-size:14px"></i></td>
                                        <td title="Historique des salaire" class="w3-hover-blue-gray w3-gray "><a class="w3-text-white" href="./ServerViewSalaryHistory?empId=<c:out value="${employe.empId}"/>"><i class="fa fa-eye w3-hover-text-white" style="font-size:14px"></i></a></td>

                                    </c:if>



                                    <td title="gestion de vancances" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="vacance${employe.empId}"/>').style.display = 'block'"><i class="fa fa-bed" style="font-size:14px"></i></td>
                                    <td title="historique de vacances" class="w3-hover-blue-gray w3-gray w3-text-white"><a class="w3-text-white" href="./ServerViewVacanceHistory?empId=<c:out value="${employe.empId}"/>"><i class="fa fa-calendar w3-hover-text-white" style="font-size:14px"></i></a></td>
                                    <td title="supprimé" class="w3-hover-blue-gray w3-gray w3-text-white"><a class="w3-text-white" href="./ServerDeleteEmploye?empId=<c:out value="${employe.empId}"/>"><i class="fa fa fa-trash-o w3-hover-text-white" style="font-size:14px"></i></a></td>




                                <div class="w3-container w3-modal w3-animate-zoom w3-text-black" style="display: none;" id="salary${employe.empId}">


                                    <div class="w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32" style="width:70%;">
                                        <header class="w3-container w3-text-white gtg-background">
                                            <span onclick="document.getElementById('<c:out value="salary${employe.empId}"/>').style.display = 'none'" 
                                                  class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px">&times;</span>

                                            <h3>Modification Salaire</h3>
                                        </header>
                                        <form class="w3-container w3-card-4 " action="./ServerUpdateSalary" method="post" >
                                            <input class="w3-input w3-border-bottom "  name="empid" type="hidden" value="${employe.empId}"  readonly="" required=""/>

                                            <div class="w3-container w3-row-padding">
                                                <header><h3 class="w3-center"> Salaire</h3></header>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Date de modification</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray sal"  name="date_de_payement"   required="" placeholder="yyyy-mm-dd" readonly=""></p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>
                                                        <label class="w3-text-blue-gray "><b>Montant</b></label><i class="fa fa-money w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="montant_salaire" value="${employe.montantSalaire}"  type="text" required=""></p>

                                                    </p>
                                                </div>


                                            </div>

                                            <div class="w3-row">
                                                <h5 class="w3-center">
                                                    <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="width: 30%;background: rgb(163,0,43)">Modifier<i class="fa fa-braille" style="font-size:18px;position: relative;right: -8px"></i></button>
                                                </h5>
                                            </div>
                                        </form>


                                    </div>
                                </div>






                                <div class="w3-container w3-modal w3-animate-zoom w3-text-black" style="display: none;" id="vacance${employe.empId}">


                                    <div class="w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32" style="width:70%;">
                                        <span onclick="document.getElementById('<c:out value="vacance${employe.empId}"/>').style.display = 'none'" 
                                              class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px" >&times;</span>
                                        <header class="w3-container w3-text-white gtg-background">
                                            <h3>Gestion vacances</h3>
                                        </header>
                                        <form class="w3-container w3-card-4 " action="./ServerInsertVancance" method="post" >
                                            <input class="w3-input w3-border-bottom "  name="empid" type="hidden" value="${employe.empId}"  readonly="" required=""/>

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Début des vacances</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="debut_de_vacance" id="EmpVacmyDatePicker${employe.empId}" required="" /> </p>
                                                </div>
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Fin des vacances</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="fin_de_vacance" id="EmpVacmyDate${employe.empId}"   required=""/></p>
                                                </div>

                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Nombre</b></label><i class="fa fa-hand-scissors-o w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="nombre"  type="number"   required="" /></p>
                                                </div>

                                            </div>

                                            <div class="w3-row">
                                                <h5 class="w3-center">
                                                    <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Enregistrer<i class="fa fa-cloud-download" style="font-size:18px;position: relative;right: -8px"></i></button>
                                                </h5>
                                            </div>
                                        </form>


                                    </div>
                                </div>









                                <div class="w3-container w3-modal w3-animate-zoom w3-text-black" id="${employe.empId}" style="display: none;">



                                    <div  id="form2" class=' w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32 ' style=" border:solid 5px black;width: 60%;margin-top: 350px">
                                        <header>

                                            <h2 class="w3-text-white w3-center gtg-background">Modification</h2>
                                            <span onclick="document.getElementById('<c:out value="${employe.empId}"/>').style.display = 'none'" 
                                                  class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px" >&times;</span>
                                        </header>

                                        <form class="w3-container w3-card-4 " action="./EmployeUpdateServer" method="post">
                                            <div class="w3-row-padding w3-margin-bottom">
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b> Numéro d'identification</b></label><i class="fa fa-user-circle-o w3-right" style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom "  name="empid" type="text" value="${employe.empId}"  readonly="" required=""/></p>
                                                </div>
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Nom</b></label><i class="fa fa-id-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom "  name="nom" type="text"  value="${employe.nom}" required=""/></p>
                                                </div>
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Prenom </b></label><i class="fa fa-id-card w3-right" style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom "  name="prenom" type="text" value="${employe.prenom}"  required="" /></p>

                                                    </p>
                                                </div>

                                            </div>
                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Date de naissance</b></label><i class="fa fa-calendar w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="date_de_naissance" value="${employe.dateDeNaissanceStr}"  id="EmpModmyDatePicker${employe.empId}" required=""></p>
                                                </div>
                                                <div class="w3-half w3-light-grey">
                                                    <p>
                                                        <label class="w3-text-blue-gray"><b>Genre</b></label><br>
                                                        <input class="w3-radio" type="radio" name="sex" value="Homme" checked>
                                                        <label>Homme</label>

                                                        <input class="w3-radio" type="radio" name="sex" value="Femme">
                                                        <label>Femme</label>

                                                        <input class="w3-radio" type="radio" name="sex" value="Transgenre">
                                                        <label>Transgenre</label>
                                                    </p>
                                                </div>

                                            </div>
                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <label class="w3-text-blue-gray"><b>Fonction</b></label>

                                                    <p>
                                                        <select class="w3-select w3-light-grey" name="fonction" required="">
                                                            <option  value="${employe.fonction}" selected="">${employe.fonction}</option>
                                                            <option  value="Arpenteur">Arpenteur</option>
                                                            <option  value="Chef d'équipe">Chef d'équipe</option>
                                                            <option value="Collaborateur">Collaborateur</option>
                                                            <option value="Analyste foncier dessinateur">Analyste foncier dessinateur</option>
                                                            <option value="Dessinateur">Dessinateur</option>
                                                            <option value="Stagiaire">Stagiaire</option>



                                                        </select>
                                                    </p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Diplôme</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">school</i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="diplome" type="text" value="${employe.diplome}" required="" /> </p>
                                                </div>

                                            </div>

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Télephone </b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">phone</i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="telephone_residence" type="text" value="${employe.telephoneResidence}" required=""> </p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Cellulaire</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">stay_current_portrait</i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="cellulaire" type="text" value="${employe.cellulaire}" required=""/> </p>
                                                </div>

                                            </div>

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Numéro de rue</b></label><i class="fa fa-street-view w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="numero_de_rue" type="text"  value="${employe.numeroDeRue}" required=""/> </p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b> Code Postale </b></label><i class="fa fa-podcast w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="code_postale" type="text" value="${employe.codePostale}" required=""/></p>
                                                </div>

                                            </div>
                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Ville</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="ville" type="text"  value="${employe.ville}" required=""/> </p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Pays</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="pays" type="text"  value="${employe.pays}" required=""/></p>
                                                </div>

                                            </div>
                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Province</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="etat" type="text" value="${employe.etat}" required=""/> </p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Email</b></label><i class="fa fa-envelope-square w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="email" type="email" value="${employe.email}" required=""/> </p>
                                                </div>

                                            </div>



                                            <div class="w3-row-padding w3-white">

                                                <div class="w3-rest">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Status</b></label>
                                                        <select class="w3-select w3-light-grey" name="status" required="">
                                                            <option  value="${employe.status}" selected="">${employe.status}</option>
                                                            <option  value="Actif">Actif</option>
                                                            <option value="Inactif">Inactif</option>




                                                        </select>

                                                </div>

                                            </div>

                                            <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                                                <h6 class="w3-center">      
                                                    <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)" name="action" value="modify">Modifier<i class="fa fa-braille" style="font-size:18px;position: relative;right: -8px"></i></button></h6>
                                            </div>

                                        </form>

                                    </div>
                                </div>
                                </tr>



                            </c:forEach>

                            <%--pagination--%>
                            <button class="w3-btn w3-white w3-right w3-card-4 w3-hide-small" onclick="document.getElementById('filtre2').style.display = 'block'">Filtre</button>
                            <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray w3-hide-small" id="filtre2" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Entrer un mot clé" style="width: 28%;display: none">


                            <div class="w3-margin-bottom w3-hide-small w3-padding">
                                <c:forEach var = "i" begin = "1" end = "${no}">
                                    <a class="w3-border w3-padding w3-hover-opacity w3-card-4 w3-round-xxlarge w3-dark-gray" href="./ServerAllEmploye?page=${i}">${i} </a>

                                </c:forEach>
                            </div>









                        </table>
                    </div>
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
            var modal = document.getElementById('<c:out value="${employe.empId}"/>');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

        </script>

        <script>
            // Get the modal
            var modal2 = document.getElementById('addemploye');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal2) {
                    modal2.style.display = "none";
                }
            }
        </script>



    </body>
</html>
