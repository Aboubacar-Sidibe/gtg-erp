<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Ajouter dessinateur</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="date_time_calendar/jquery.datetimepicker.css"/>

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
            #form
            {
                margin-top: 150px;
            }

            @media only screen and (max-width:601px){

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #form,#form2
                {
                    position: relative;
                    top: 740px;
                }

            }


        </style>

    </head>

    <body  style="background: url('img/b1.jpg');">


        <div class="w3-container w3-modal  w3-animate-zoom w3-text-black" id="adddessinateur" style="display: none">



            <div  id="form" class=' w3-center w3-container w3-card-32  w3-animate-opacity w3-display-middle w3-modal-content w3-border w3-card-32 ' style=" border:solid 5px black;width: 60%;">

                <h2 class="w3-center w3-text-black">Ajouter dessinateur</h2>

                <form class="w3-container w3-card-4 " action="./InsertDessinateurServer" method="get">
                    <span onclick="document.getElementById('adddessinateur').style.display = 'none'" 
                          class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 0px;z-index: 100" >&times;</span>
                    <div class="w3-row-padding w3-margin-bottom">
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Bureau</b></label><i class="fa fa-desktop w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="bureau" type="text"  value="Alma"  readonly="" required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Dossier</b></label><i class="fa fa-folder-open w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="dossier" type="text"  required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Lieu</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">location_on</i>
                                <input class="w3-input w3-border-bottom "  name="lieu" type="text"  required=""/></p>
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
                                    <option value="Carnet" selected="">Carnet</option>
                                    <option value="Dessin">Dessin</option>
                                    <option value="Preparation de terrain">Preparation de terrain</option>
                                    <option value="Calculation">Calcul</option>


                                </select>

                            </p>
                        </div>

                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Responsable</b></label><i class="fa fa-user-secret w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="responsable" type="text" value="${sessionScope.utilisateur.nom}" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Client</b></label><i class="fa fa-commenting w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="client" type="text" required=""></p>
                        </div>

                    </div>



                    <div class="w3-row-padding w3-white">
                        <div class="w3-col" style="width: 50%">
                            <p>      
                                <label class="w3-text-blue-gray"><b> Durée estimée</b></label><i class="fa fa-hourglass-half w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="duree" type="text" required=""></p>
                        </div>
                        <div class="w3-col" style="width: 50%">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Deadline</b></label><i class="fa fa-hourglass-half w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="deadline"  id="datetimepicker" ></p>

                        </div>
                        

                    </div>
                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Status</b></label>
                                <select class="w3-select w3-light-grey" name="status" required="">
                                    <option value="À faire" selected="">À faire</option>
                                    <option value="En attente">En attente</option>
                                    <option value="En cours">En cours</option>
                                    <option value="Stand by">Stand by</option>

                                    <option value="Terminé">Terminé</option>



                                </select>
                        </div>
                        <div>
                            <p class="w3-half">      
                                <label class="w3-text-blue-gray"><b>Priorité</b></label>

                                <input class="w3-input w3-border-bottom w3-light-grey" type="text" id="p1" onmouseover="heure()" name="Priorite" value="1(0 à 4h)">
                            </p>
                        </div>



                    </div>


                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Saisie par</b></label><i class="fa fa-user-circle-o w3-right " style="font-size:16px;position: relative;top:52px;color: rgb(163,0,43)"></i>
                                <select class="w3-select w3-light-grey" name="saisie_par" required="">
                                    <option value="${sessionScope.utilisateur.nom}">${sessionScope.utilisateur.nom}</option>
                                    <c:forEach var="name" items="${names}">
                                        <option value="${name}">${name}</option>
                                    </c:forEach>
                                </select>



                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Date de saisie</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="date_saisie" id="datetimepicker2" required=""></p>
                        </div>


                    </div>
                     



                    <div class="w3-row-padding w3-white">
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Notes</b></label><i class="fa fa-commenting w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray"  name="notes" type="text" required=""></p>
                        </div>
                        <div class="w3-half">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Date de status</b></label><i class="fa fa-calendar w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom w3-light-gray "  name="date_de_status" id="datetimepicker3"  required=""></p>
                        </div>

                    </div>


                    <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                        <h6 class="w3-center">      
                            <button class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Enregistrer<i style="position: relative;right: -18px;font-size: 24px" class="fa fa-cloud-download"></i></button></h6>
                    </div>

                </form>

            </div>
        </div>




        <script>
            function heure()
            {

                var date_time = document.getElementById('datetimepicker').value;

                var date_time = date_time.split(" ");
                var date1 = date_time[0];
                var d1Hour = date_time[1];

                var d1day = date1.substr(0, 2);
                var d1month = date1.substr(3, 2);
                var d1year = date1.substr(6);


                //var d1Hour = document.getElementById('ho').value;

                var todayD = new Date();
                var todayHours = todayD.getHours();
                var year = todayD.getFullYear();
                var month = todayD.getMonth();
                var day = todayD.getDate();


                if ((d1year == year) && (d1month == month) && (d1day == day) && (d1Hour >= todayHours) && (d1Hour - todayHours <= 4))
                {
                    document.getElementById('p1').value = 1 + "(0 à 4h)";
                } else if ((d1year == year) && (d1month == month) && (d1day == day) && (d1Hour > todayHours) && ((d1Hour - todayHours > 4) && (d1Hour - todayHours < 24)))
                {
                    document.getElementById('p1').value = 2 + "(4 à 24h)";
                } else if ((d1year == year) && (d1month == month) && (d1day > day) && ((d1day - day) >= 1 && (d1day - day) <= 3))
                {
                    document.getElementById('p1').value = 3 + "(24 à 72h)";
                } else if (((d1year == year) && (d1month > month) && (1 <= d1month - month <= 3)) || (d1day - day > 3))
                {
                    document.getElementById('p1').value = 4 + "(72h à 1sem)";
                } else if ((d1year == year) && (d1month > month) && (3 <= d1month - month <= 6))
                {
                    document.getElementById('p1').value = 5 + "(1 à 2.5sem)";
                } else if (((d1year == year) && (d1month > month) && (d1month - month > 6)) || (d1year > year))
                {
                    document.getElementById('p1').value = 6 + "(2.5 à 4sem)";
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

            $('#datetimepicker').datetimepicker({
                //theme: 'dark',
                dayOfWeekStart: 1,
                lang: 'en',
                format: 'd/m/Y H:i',
                timepicker: true,
                disabledDates: ['1986/01/08', '1986/01/09', '1986/01/10'],
                startDate: '1986/01/05'
            });
            $('#datetimepicker').datetimepicker({value: '2015/04/15 05:03', step: 10});


            $('#datetimepicker2').datetimepicker({
                //theme: 'dark',
                dayOfWeekStart: 1,
                lang: 'en',
                format: 'd/m/Y H:i',
                timepicker: true,
                disabledDates: ['1986/01/08', '1986/01/09', '1986/01/10'],
                startDate: '1986/01/05'
            });
            $('#datetimepicker2').datetimepicker({value: '2015/04/15 05:03', step: 10});
            
            
            $('#datetimepicker3').datetimepicker({
                //theme: 'dark',
                dayOfWeekStart: 1,
                lang: 'en',
                format: 'd/m/Y H:i',
                timepicker: true,
                disabledDates: ['1986/01/08', '1986/01/09', '1986/01/10'],
                startDate: '1986/01/05'
            });
            $('#datetimepicker3').datetimepicker({value: '2015/04/15 05:03', step: 10});



           
            
            





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
