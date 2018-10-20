<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Ajouter un fournisseur</title>
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

            #submitBtn
            {
                position: relative;
                right: -18px;
            }
            
            #form
            {
                position: relative;
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
                    margin-top: 200px;
                }
                #submitBtn
                {
                    position: relative;
                    left: -20px;
                    width: 90%;
                }

            }


        </style>

    </head>

    <body  style="background: url('img/b1.jpg');">


        <div class="w3-container w3-modal w3-animate-zoom w3-text-black"  style="display: none;" id="addfournisseur">



            <div  id="form" class=' w3-center w3-container w3-card-32  w3-animate-opacity  w3-border  w3-modal-content w3-card-32 ' style=" border:solid 5px black;width: 60%;">

                <h2 class="w3-center w3-text-black">Ajouter un fournisseur</h2>

                <form class="w3-container w3-card-4 " action="./InsertFournisseurServer" method="post">
                    <div class="w3-row-padding w3-margin-bottom">
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>Nom</b></label><i class="fa fa-user-circle-o w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="nom" type="text"  required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>telephone</b></label><i class="material-icons w3-right" style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">phone</i>
                                <input class="w3-input w3-border-bottom "  name="telephone" type="text"  required=""/></p>
                        </div>
                        <div class="w3-third">
                            <p>      
                                <label class="w3-text-blue-gray"><b>E-mail</b></label><i class="fa fa-envelope-square w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                <input class="w3-input w3-border-bottom "  name="email" type="email"  required=""/></p>
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
                                <input class="w3-input w3-border-bottom w3-light-grey"  name="pays" type="text" required=""></p>
                        </div>

                    </div>

                    
                   

                    


                    <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                        <h6 class="w3-center">      
                            <button id="submitBtn" class="btn btn-8 btn-8b  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)">Enregistrer<i style="font-size: 24px" class="fa fa-cloud-download"></i></button></h6>
                    </div>

                </form>

            </div>
        </div>







    </body>

</html>
