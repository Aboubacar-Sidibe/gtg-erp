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
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/w3.css">
        <script src="https://www.w3schools.com/lib/w3.js"></script>
        <link rel="stylesheet" href="css/pulsatingButton.css"/>



        <title>Instruments</title>
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
                position: relative;
                margin-top: 250px;
                margin-left: 0px;
            }

            #Entform
            {
                position: relative;
                margin-top: 50px;
            }

            @media only screen and (max-width:601px){

                #identifier,#identifier2
                {
                    width: 30%;
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
                #ModForm
                {
                    position: relative;
                    margin-top: 700px;
                }
                #Entform
                {
                    position: relative;
                    margin-top: 300px;
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
        <script type="text/javascript">
            var jQ = $.noConflict(true);
        </script>


        <script>
            jQ(document).ready(function () {

                jQ("#typee option").filter(function () {
                    return jQ(this).val() == jQ("#abbre").val();
                }).attr('selected', true);
                jQ("#typee").live("change", function () {

                    jQ("#abbre").val(jQ(this).find("option:selected").attr("abbr"));
                    jQ("#coule").val(jQ(this).find("option:selected").attr("coul"));
                    jQ("#coule").css('background-color', jQ(this).find("option:selected").attr("coul"));
                });
            });
        </script>
    </head>
    <body>

        <div class="w3-row-padding w3-container w3-margin-bottom w3-animate-right">
            <div class="w3-container">

                <header class="w3-row">
                    <div class="w3-row w3-right">
                        <c:if test="${fonction=='Arpenteur'}">
                            <button title="Ajouter un nouvel instrument"  class="pulsatingCircle w3-btnP w3-margin-top" style="position: fixed;float:right;right: 10px;" onclick="document.getElementById('addinstrument').style.display = 'block'">

                                <span class="firstCircle"><span style="position: relative;top:-12px"><i class="fa fa-gavel" style="font-size: 5px;color: #fff"></i><i class="fa fa-plus" style="font-size: 3px;position: relative;right: 0px;color: #fff"></i></span></span>


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
                        <h2 class="w3-center w3-container w3-text-white w3-btn w3-card-32" style="background: rgb(163,0,43);">Liste d'instruments</h2>
                    </div>





                </header>


                <c:if test="${fonction=='Arpenteur'||'Surveyor'}">
                    <%@include file="AddInstrument.jsp"%>
                </c:if>


                <%--pagination--%>
                <div id="filtre-container" class="w3-hide-medium w3-hide-large">
                    <button class="w3-btn w3-white w3-right w3-card-4 " onclick="document.getElementById('filtre').style.display = 'block'">Filtre</button>
                    <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray" id="filtre" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Tell me a key word and I show you the result" style="display: none">
                </div>

                <div class="w3-margin-bottom w3-padding w3-hide-medium w3-hide-large" id="pagination" style="overflow-x: auto;">
                    <c:forEach var = "i" begin = "1" end = "${no}">
                        <a class="w3-border w3-padding w3-hover-opacity w3-card-4 w3-round-xxlarge w3-dark-gray" href="./ServerAllInstrument?page=${i}">${i} </a>

                    </c:forEach>
                </div>

                <div style="overflow-x: auto;">

                    <div class="w3-white w3-margin-bottom">
                        <table class="w3-table w3-table-all w3-card-32" id="id01" style="width: 95%;margin-left: 30px">


                            <tr class="w3-text-white" style="background: rgb(163,0,43)">
                                <th class="w3-border-right"  onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">Nom<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right"  onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">Type<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>

                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(2)')" style="cursor:pointer">Marque<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(3)')" style="cursor:pointer">Model<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(4)')" style="cursor:pointer">Couleur<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(5)')" style="cursor:pointer;">Fournisseur<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th> 
                                <th class="w3-border-right" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(5)')" style="cursor:pointer;">Compatibilité<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    
                                <th colspan="6" class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(6)')" style="cursor:pointer">Actions<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    


                            </tr>
                            <c:forEach  var="instrument" items="${instruments}">
                                <tr class="w3-text-black  w3-hover-pink item">
                                    <td class="w3-border-right"><c:out value="${instrument.nom}"/></td>
                                    <td class="w3-border-right"><c:out value="${instrument.type}"/></td>
                                    <td class="w3-border-right"><c:out value="${instrument.marque}"/></td>
                                    <td class="w3-border-right"><c:out value="${instrument.model}"/></td>
                                    <td class="w3-border-right" style="background-color: ${instrument.couleur} "></td>
                                    <td class="w3-border-right"><c:out value="${instrument.fournisseurName}"/></td>
                                    <td class="w3-border-right"><c:out value="${instrument.compatibilite}"/></td>
                                    <td title="modification" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="${instrument.numeroDeSerie}"/>').style.display = 'block'"><i  class="fa fa-pencil" style="font-size:14px"></i></td>
                                        <c:if test="${fonction=='Arpenteur'}">
                                        <td title="Coût d'acquisition" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="cout${instrument.numeroDeSerie}"/>').style.display = 'block'"><i class="fa fa-usd" style="font-size:14px"></i></td>
                                        </c:if>
                                    <td title="Gestion d' entretien " class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="entretien${instrument.numeroDeSerie}"/>').style.display = 'block'"><i class="fa fa-cogs w3-hover-text-white" style="font-size:14px"></i></a></td>
                                    <td title="Histoeique d' entretien" class="w3-hover-blue-gray w3-gray w3-text-white"><a class="w3-text-white" href="./ServerEntretienHistory?numerodeserie=<c:out value="${instrument.numeroDeSerie}"/>"><i class="fa fa-pencil-square-o w3-hover-text-white" style="font-size:14px"></i></a></td>





                                    <td title="Supprimé" class="w3-hover-blue-gray w3-gray w3-text-white"><a class="w3-text-white" href="./ServerDeleteInstrument?InstId=<c:out value="${instrument.numeroDeSerie}"/>"><i class="fa fa fa-trash-o w3-hover-text-white" style="font-size:14px"></i></a></td>




                                <div class="w3-container w3-modal w3-animate-zoom w3-text-black" style="display: none;" id="${instrument.numeroDeSerie}">


                                    <div id="ModForm" class="w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32" style="width:70%;" >
                                        <header class="w3-container w3-text-white gtg-background">
                                            <span onclick="document.getElementById('<c:out value="${instrument.numeroDeSerie}"/>').style.display = 'none'" 
                                                  class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px">&times;</span>

                                            <h3>Modification d'instrument</h3>
                                        </header>

                                        <form  class="w3-container w3-card-4 " action="./ServerUpdateInstrument" method="post">

                                            <div class="w3-row-padding w3-margin-bottom">
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Numéro de serie</b></label><i class="fa fa-certificate w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom "  name="numerodeserie" type="text" value="${instrument.numeroDeSerie}"  required=""/></p>
                                                </div>
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Nom</b></label><i class="fa fa-user-circle-o w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom "  name="nom" type="text" value="${instrument.nom}" required=""/></p>
                                                </div>
                                                <div class="w3-third">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Marque </b></label><i class="fa fa-credit-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom "  name="marque" type="text" value="${instrument.marque}" required="" /></p>

                                                    </p>
                                                </div>

                                            </div>
                                            <div class="w3-row-padding">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Model</b></label><i class="fa fa-credit-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="model" type="text" value="${instrument.model}" required=""></p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Version</b></label><i class="fa fa-credit-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="version" type="text"  value='${instrument.version}' required=""></p>
                                                </div>


                                            </div>
                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Numéro</b></label><i class="fa fa-certificate w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="numero" type="text"  value='${instrument.numero}' required=""></p>
                                                </div>


                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Type</b></label>

                                                        <select class="w3-select w3-light-grey" name="type" required="" id="type">
                                                            <option value="" selected="">Choisissez s'il vous plaît...</option>
                                                            <option  value="GPS" abbr="GPS" coul="#00FFFF" >GPS </option>
                                                            <option  value="Station totale robotisée" abbr="ROB" coul="#FFFF00" >Station totale robotisée </option>
                                                            <option value="Station totale conventionnelle" abbr="CONV" coul="#778899">Station totale conventionnelle </option>
                                                            <option value="Niveau" abbr="NIV" coul="#ff0000">Niveau</option>
                                                            <option value="Prisme" abbr="PRM" coul="#B22222">Prisme</option>
                                                            <option value="Jalon" abbr="JAL" coul="#000000">Jalon</option>
                                                            <option value="Batterie" abbr="BATT" coul="#FF1493">Batterie</option>
                                                            <option value="Trépied" abbr="TRP" coul="#8B008B">Trépied</option>



                                                        </select>
                                                    </p>
                                                </div>

                                            </div>

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Compatibilité</b></label><i class="fa fa-american-sign-language-interpreting w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class=" w3-input w3-border-bottom w3-light-grey" type="text" value="${instrument.compatibilite}" name="compatibilite"></p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Disponibilité</b></label>
                                                        <select class="w3-select w3-light-grey" name="disponibilite"  required="">
                                                            <option value="${instrument.disponibilite}" selected="" >${instrument.disponibilite}</option>
                                                            <option  value="Oui">Oui</option>
                                                            <option  value="Non">Non</option>




                                                        </select>                        
                                                </div>

                                            </div>

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Date d'acquisition</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="dacqui" id="ModmyDatePicker${instrument.numeroDeSerie}" value="${instrument.dateDacquisitionStr}"  required=""></p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Fin garantie</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="fingarantie" value="${instrument.finGarantieStr}"  required="" id="ModmyDate${instrument.numeroDeSerie}"></p>
                                                    <div id="dd"></div>
                                                </div>


                                            </div>
                                            <div class="w3-row-padding w3-white">
                                                <c:if test="${fonction=='Arpenteur'}">
                                                    <div class="w3-half">
                                                        <p>      
                                                            <label class="w3-text-blue-gray"><b>Coût</b></label><i class="fa fa-money w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                            <input class="w3-input w3-border-bottom w3-light-grey"  name="cout" type="text" value="${instrument.coutDacquisition}"   required=""></p>
                                                    </div>
                                                </c:if>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Abbreviation</b></label><i class="fa fa-window-minimize w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"  ></i>
                                                        <input class="w3-input w3-border-bottom w3-light-grey"  name="abbreviation" type="text" required="" id="abbre" value="${instrument.abbreviation}" readonly=""></p>
                                                </div>

                                            </div>
                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Actif</b></label>
                                                        <select class="w3-select w3-light-grey" name="actif" required="">
                                                            <option value="${instrument.actif}" selected="" >${instrument.actif}</option>
                                                            <option  value="Oui">Oui</option>
                                                            <option  value="Non">Non</option>




                                                        </select>                            
                                                </div>
                                                <div class="w3-half">
                                                    <p> <label class="w3-text-blue-gray"><b>Fournisseur</b></label><i class="fa fa-truck w3-right " style="font-size:16px;position: relative;top:50px;color: rgb(163,0,43)"></i>
                                                        <select class="w3-select w3-light-grey" name="fournisseur" required="">
                                                            <option value="${instrument.fournisseurId}" selected="">${instrument.fournisseurName}</option>

                                                            <c:forEach var="fournisseur" items="${fournisseurs}">


                                                                <option  value="${fournisseur.id}">${fournisseur.nom}</option>
                                                            </c:forEach>




                                                        </select></p>
                                                </div>

                                            </div>


                                            <div class="w3-row-padding w3-white">
                                                <div class="">
                                                    <h6>      
                                                        <label class="w3-text-blue-gray"><b>Couleur</b></label><br>
                                                        <input  name="couleur" value="${instrument.couleur}"  style="background:${instrument.couleur} " required="" id="coule"></h6>
                                                </div>
                                            </div>




                                            <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                                                <h6 class="w3-center">      
                                                    <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Enregistrer <i class="fa fa-braille" style="font-size:18px;position: relative;right: -8px"></i></button></h6>
                                            </div>

                                        </form>


                                    </div>
                                </div>





                                <c:if test="${fonction=='Arpenteur'}">
                                    <div class="w3-container w3-modal w3-animate-zoom w3-text-black" style="display: none;" id="cout${instrument.numeroDeSerie}">


                                        <div class="w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32" style="width:30%;">
                                            <span onclick="document.getElementById('<c:out value="cout${instrument.numeroDeSerie}"/>').style.display = 'none'" 
                                                  class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px" >&times;</span>
                                            <header class="w3-container w3-text-white gtg-background ">
                                                <h3>Coût d'acquisition</h3>
                                            </header>

                                            <div class="w3-center gtg-background w3-text-white w3-button w3-margin-top">${instrument.coutDacquisition} <i class="fa fa-dollar"></i></div>


                                        </div>
                                    </div>
                                </c:if>









                                <div class="w3-container w3-modal w3-animate-zoom w3-text-black" id="entretien${instrument.numeroDeSerie}" style="display: none;">



                                    <div  id="Entform" class=' w3-center w3-container  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32 ' style=" border:solid 5px black;width: 60%;">
                                        <header>

                                            <h2 class="w3-text-white w3-center gtg-background">Entretien</h2>
                                            <span onclick="document.getElementById('<c:out value="entretien${instrument.numeroDeSerie}"/>').style.display = 'none'" 
                                                  class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px" >&times;</span>
                                        </header>

                                        <form class="w3-container w3-card-4 " action="./InsertEntretienServer" method="post">

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Numéro de serie</b></label><i class="fa fa-certificate w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="numerodeserie" value="${instrument.numeroDeSerie}" type="text"required="" readonly=""></p>
                                                </div>
                                                <div class="w3-half">
                                                    <label class="w3-text-blue-gray"><b>Fournisseur</b></label><i class="fa fa-truck w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <select class="w3-select w3-light-grey" name="founisseurId" required="">
                                                        <option value="${instrument.fournisseurId}" selected="">${instrument.fournisseurName}</option>






                                                    </select>
                                                </div>

                                            </div>

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Date</b></label><i class="fa fa-calendar w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="dentretien"  id="EntmyDatePicker${instrument.numeroDeSerie}" ></p>
                                                </div>
                                                <div class="w3-half">
                                                    <p>      
                                                        <label class="w3-text-blue-gray"><b>Détail</b></label><i class="fa fa-calendar w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                        <input class="w3-input w3-border-bottom w3-light-gray"  name="detail"  type="text" required="" ></p>
                                                </div>

                                            </div>

                                            <div class="w3-row-padding w3-white">
                                                <div class="w3-half">
                                                    <label class="w3-text-blue-gray"><b> Coût d'entretien</b></label><i class="fa fa-money w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom w3-light-gray "  name="cout"  type="text" ></p>
                                                </div>


                                            </div>








                                            <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                                                <h6 class="w3-center">      
                                                    <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)" name="action" value="modify">Enregistrer<i class="fa fa-cloud-download" style="font-size:18px;position: relative;right: -8px"></i></button></h6>
                                            </div>

                                        </form>

                                    </div>
                                </div>
                                </tr>



                            </c:forEach>

                            <%--pagination--%>
                            <button class="w3-btn w3-white w3-right w3-card-4 w3-hide-small" onclick="document.getElementById('filtre2').style.display = 'block'">Filtre</button>
                            <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray w3-hide-small" id="filtre2" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Dis-moi le mot clé que tu cherches" style="width: 28%;display: none">


                            <div class="w3-margin-bottom w3-hide-small w3-padding">
                                <c:forEach var = "i" begin = "1" end = "${no}">
                                    <a class="w3-border w3-padding w3-hover-opacity w3-card-4 w3-round-xxlarge w3-dark-gray" href="./ServerAllInstrument?page=${i}">${i} </a>

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
            today = year + '-' + month + '-' + day;
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
            var modal2 = document.getElementById('addinstrument');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal2) {
                    modal2.style.display = "none";
                }
            }
        </script>



    </body>
</html>
