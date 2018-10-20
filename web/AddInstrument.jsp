<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter un instrument</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/w3.css">
        <link rel="stylesheet" type="text/css" href="css/button//default.css"/>
        <link rel="stylesheet" type="text/css" href="css/button//component.css" />


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
                margin-top: 250px;
            }
            #submitBtn
            {
                position: relative;
                right: -18px;
            }
            @media only screen and (max-width:601px){

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #form,#form2
                {
                    position: relative;
                    top: 850px;
                }
                #submitBtn
                {
                    position: relative;
                    left: -40px;
                }


            }



        </style>




        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
        <script type="text/javascript">
            var jQuery = $.noConflict(true);
        </script>


        <script>
            jQuery(document).ready(function () {

                jQuery("#type option").filter(function () {
                    return jQuery(this).val() == jQuery("#abbr").val();
                }).attr('selected', true);
                jQuery("#type").live("change", function () {

                    jQuery("#abbr").val(jQuery(this).find("option:selected").attr("abbr"));
                    jQuery("#coul").val(jQuery(this).find("option:selected").attr("coul"));
                    jQuery("#coul").css('background-color', jQuery(this).find("option:selected").attr("coul"));
                });
            });
        </script>
    </head>

    <body  style="background: url('img/b1.jpg');">


        <div class="w3-container w3-modal w3-animate-zoom w3-text-black" id="addinstrument">



            <div  id="form" class=' w3-center w3-container w3-card-32  w3-animate-opacity  w3-modal-content w3-display-middle w3-border  w3-card-32 ' style=" border:solid 5px black;width: 60%;">

                <h2 class="w3-center w3-text-black">Ajouter un instrument</h2>

                <form class="w3-container w3-card-4 " action="./insertInstrumentServer" method="post">
                    <span onclick="document.getElementById('addinstrument').style.display = 'none'" 
                          class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 0px;z-index: 100" >&times;</span>
                    <div class="w3-row-padding w3-margin-bottom">
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Numero de serie</b></label><i class="fa fa-user-circle-o w3-right" style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="numerodeserie" type="text"  required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Nom</b></label><i class="fa fa-id-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="nom" type="text"  required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Marque </b></label><i class="fa fa-id-card w3-right" style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="marque" type="text" required="" /></p>

                            </p>
                        </div>

                    </div>
                    <div class="w3-row-padding">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Model</b></label><i class="fa fa fa-credit-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="model" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Version</b></label><i class="fa fa-credit-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="version" type="text" required=""></p>
                        </div>


                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Numéro</b></label><i class="fa fa-certificate w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="numero" type="text" required=""></p>
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
                                <input class=" w3-input w3-border-bottom w3-light-grey" type="text" name="compatibilite"></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Disponibilité</b></label>
                                <select class="w3-select w3-light-grey" name="disponibilite" required="">
                                    <option  value="Oui">Oui</option>
                                    <option  value="Non">Non</option>




                                </select>                        
                        </div>

                    </div>

                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Date d'acquisition</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="dacqui"  required="" id="myDatePicker"></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Fin garantie</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="fingarantie"   required="" id="myDate"></p>
                        </div>


                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Coût</b></label><i class="fa fa-money w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="cout" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Abbreviation</b></label><i class="fa fa-window-minimize w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"  ></i>
                                <input class="w3-input w3-border-bottom w3-light-grey "  name="abbreviation" type="text" required="" id="abbr"  readonly=""></p>
                        </div>

                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Actif</b></label>
                                <select class="w3-select w3-light-grey" name="actif" required="">
                                    <option  value="oui">Oui</option>
                                    <option  value="Non">Non</option>




                                </select>                            
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Fournisseur</b></label><i class="fa fa-truck w3-right " style="font-size:16px;position: relative;top:50px;color: rgb(163,0,43)"></i>
                                <select class="w3-select w3-light-grey" name="fournisseur" required="">
                                    <option value="" selected="">Choisissez s'il vous plaît...</option>
                                    <c:forEach var="fournisseur" items="${fournisseurs}">
                                        <option  value="${fournisseur.id}">${fournisseur.nom}</option>
                                    </c:forEach>




                                </select>
                        </div>

                    </div>


                    <div class="w3-row-padding w3-white">
                        <div class="">
                            <h6>      
                                <label class="w3-text-blue-gray"><b>Couleur</b></label><br>
                                <input  class="w3-input w3-border-bottom"   name="couleur" type="text" required="" id="coul"  readonly=""></h6>
                        </div>
                    </div>




                    <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                        <h6 class="w3-center">      
                            <button id="submitBtn" class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Enregistrer<i style="font-size: 24px" class="fa fa-cloud-download"></i></button></h6>
                    </div>

                </form>

            </div>
        </div>

        <script src="js/jscolor.js"></script>





        <script>
     function myFunction() {
         var x = document.getElementById("Demo");
         if (x.className.indexOf("w3-show") == -1) {
             x.className += " w3-show";
         } else {
             x.className = x.className.replace(" w3-show", "");
         }
     }
        </script>




    </body>

</html>
