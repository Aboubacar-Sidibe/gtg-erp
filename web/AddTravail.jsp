<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Ajouter un travail</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
                margin-top: 200px;
            }
            @media only screen and (max-width:601px){

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #form,#form2
                {
                    margin-top: 400px;
                }
                #addtravail
                {
                    width: 100%;
                }

            }


        </style>

    </head>

    <body  style="background: url('img/b1.jpg');">


        <div class="w3-container w3-modal  w3-animate-zoom w3-text-black" id="addtravail" style="display: none;">



            <div  id="form" class=' w3-center w3-container w3-card-32  w3-animate-opacity w3-display-middle w3-modal-content w3-border w3-card-32 ' style=" border:solid 5px black;width: 60%;">

                <h2 class="w3-center w3-text-black">Ajouter un travail</h2>

                <form class="w3-container w3-card-4 " action="./InsertTravailServer" method="post">
                    <span onclick="closetravail()" 
                          class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 16px;z-index: 100" >&times;</span>
                    <div class="w3-row-padding w3-margin-bottom">
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Dossier</b></label><i class="fa fa-folder-open w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="dossier" type="text"  required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Client</b></label><i class="fa fa-handshake-o w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="client" type="text"  required=""/></p>
                        </div>
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

                                </select>

                            </p>
                        </div>

                    </div>

                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Lieu</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="lieu" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Durée estimée(heures)</b></label><i class="fa fa-hourglass-half w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="dure_estime" type="text" required=""></p>
                        </div>

                    </div>

                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Deadline</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="deadline" id="TrMyDatePicker" required="" ></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Rendez-vous</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="rendez_vous" id="TrMyDate" required="" ></p>
                        </div>

                    </div>

                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Chef</b></label><i class="fa fa-user-secret w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="chef" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Donneur</b></label><i class="fa fa-check-square-o w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="donneur" type="text" required=""></p>
                        </div>

                    </div>

                    <div class="w3-row-padding w3-white">
                       
                            <p>      
                                <label class="w3-text-blue-gray"><b>Notes</b></label><i class="fa fa-commenting w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="notes" type="text" required=""></p>


                    </div>



                    <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                        <h6 class="w3-center">      
                            <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Enregistrer<i style="position: relative;right: -18px;font-size: 24px" class="fa fa-cloud-download"></i></button></h6>
                    </div>

                </form>

            </div>
        </div>







    </body>

</html>
