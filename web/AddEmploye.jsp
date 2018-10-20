<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Connexion</title>
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

            #submitBtn
            {
                position: relative;
                right: -18px;
            }
            #form
            {
                position: relative;
                margin-top: 350px;
                margin-left: 0;
            }

            @media only screen and (max-width:601px){

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #form
                {
                    position: relative;
                    margin-top: 890px;
                }
                #submitBtn
                {
                    position: relative;
                    left: -33px;


                }

            }



        </style>

    </head>

    <body  style="background: url('img/b1.jpg');">


        <div class="w3-container w3-modal w3-animate-zoom w3-text-black" id="addemploye" style="display: none;">



            <div  id="form" class=' w3-center w3-container w3-card-32  w3-animate-opacity w3-display-middle w3-border w3-modal-content w3-card-32 ' style=" border:solid 5px black;width: 60%;">

                <h2 class="w3-center w3-text-black">Ajouter employé</h2>

                <form class="w3-container w3-card-4 " action="./EmployeServer" method="post">
                    <span onclick="document.getElementById('addemploye').style.display = 'none'" 
                          class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 0px;z-index: 100" >&times;</span>

                    <div class="w3-row-padding w3-margin-bottom">
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Numero d'identification</b></label><i class="fa fa-user-circle-o w3-right" style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="empid" type="text"  required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Nom</b></label><i class="fa fa-id-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="nom" type="text"  required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Prénom </b></label><i class="fa fa-id-card w3-right" style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="prenom" type="text" required="" /></p>

                            </p>
                        </div>

                    </div>
                    <div class="w3-row-padding w3-light-grey">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Date de naissance</b></label><i class="fa fa-calendar w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="date_de_naissance" id="EmpDatePicker" required="" ></p>
                        </div>
                        <div class="w3-half">
                            <br>
                            <label class="w3-text-blue-gray"><b>Genre</b></label><br>
                            <input class="w3-radio" type="radio" name="sex" value="Male" checked>
                            <label>Homme</label>

                            <input class="w3-radio" type="radio" name="sex" value="Female">
                            <label>Femme</label>

                            <input class="w3-radio" type="radio" name="sex" value="transgender">
                            <label>Transgenre</label>
                        </div>

                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Fonction</b></label>
                            <p>
                                <select class="w3-select w3-light-grey" name="fonction" required="">
                                    <option  value="Arpenteur">Arpenteur</option>
                                    <option  value="Technicien de terrain">Technicien de terrain</option>
                                    <option  value="Chef d'équipe">Chef d'équipe</option>
                                    <option value="Collaborateur">Collaborateur</option>
                                    <option value="Analyste foncier">Analyste foncier</option>
                                    <option value="Dessein">Dessein</option>
                                    <option value="Stagiaire">Stagiaire</option>



                                </select>
                            </p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Diplôme</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">school</i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="diplome" type="text" required=""></p>
                        </div>

                    </div>

                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Têléphone résidence</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">phone</i>
                                <input class="w3-input w3-border-bottom w3-light-gray" onkeyup="validate()" id="tel" name="telephone_residence" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Cellulaire</b></label><i class="material-icons w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">stay_current_portrait</i>
                                <input class="w3-input w3-border-bottom w3-light-grey" onkeyup="validat()" id="mob"  name="cellulaire" type="text" required=""></p>
                        </div>

                    </div>

                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Numéro de rue</b></label><i class="fa fa-street-view w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="numero_de_rue" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Code postale </b></label><i class="fa fa-podcast w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="code_postale" type="text" required=""></p>
                        </div>

                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Ville</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="ville" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Pays</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                <input class="w3-input w3-border-bottom w3-light-grey" id="coun" onkeyup="validatcountry()"  name="pays" type="text" required=""></p>
                        </div>

                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Province</b></label><i class="material-icons w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="etat" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>E-mail</b></label><i class="fa fa-envelope-square w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="email" type="email" required=""></p>
                        </div>

                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Montant salaire</b></label><i class="fa fa-money w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="montant_salaire" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Date d'embauche</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="date_de_payement" id="EmpDate" required="" ></p>
                        </div>

                    </div>


                    <p>
                        <input class="w3-input w3-border-bottom w3-light-grey"  name="status" readonly="" type="hidden" value="Actif" ></p>


                    </p>


                    <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                        <h6 class="w3-center">      
                            <button id="submitBtn" class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Enregistrer<i style="position: relative;font-size: 24px" class="fa fa-cloud-download"></i></button></h6>
                    </div>

                </form>

            </div>
        </div>

        <script>
            function validate()
            {
                var inp = document.getElementById("tel").value;
                var pattern = /[a-z]/i;
                if (pattern.test(inp))
                {
                    document.getElementById("tel").value = inp.slice(0, -1);
                }

            }
            function validat()
            {
                var inp = document.getElementById("mob").value;
                var pattern = /[a-z]/i;
                if (pattern.test(inp))
                {
                    document.getElementById("mob").value = inp.slice(0, -1);
                }

            }
            
            function validatcountry()
            {
                var inp = document.getElementById("coun").value;
                var pattern = /[0-9]/;
                if (pattern.test(inp))
                {
                    document.getElementById("coun").value = inp.slice(0, -1);
                }

            }

        </script>






    </body>

</html>
