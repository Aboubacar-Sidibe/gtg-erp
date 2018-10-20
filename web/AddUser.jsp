<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Utilisateur</title>
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

            @media only screen and (max-width:601px){

                #identifier,#identifier2
                {
                    width: 30%;
                }
                #form,#form2
                {
                    position: relative;
                    top: 200px;
                }

            }
            

        </style>

    </head>

    <body  style="background: url('img/b1.jpg');">

        <div class="w3-container w3-modal w3-animate-zoom w3-text-black" id="adduser" style="display: none;z-index: 5">
            <div class="w3-row">
                <header>
                    <h1 class="w3-center"><img  src="img/gtg.jpg"  height="120" width="150"/></h1>
                </header>
            </div>

            
            <div  id="form" class=' w3-hide-small w3-center w3-container w3-card-32  w3-animate-opacity w3-display-middle w3-border w3-modal-content  ' style=" border:solid 5px black;width: 60%;">

                <h2 class="w3-center w3-text-black">Ajouter un utilisateur</h2>

                <form action="./Server" class="w3-container" method="post">
                    <p>
                        <input class="w3-text-black w3-border-bottom " type="text" placeholder="ID du travailleur" name="id" style="border:0;width:100%"><i class="fa fa-id-card-o   w3-right" style="font-size:20px;position: relative;top:-33px;color: rgb(163,0,43)"></i>
                    </p>
                    <p>
                        <input class="w3-text-black w3-border-bottom " type="text" placeholder="Nom d'utilisateur" name="nom_utilisateur" style="border:0;width:100%"><i class="material-icons  w3-right" style="position: relative;top:-33px;color: rgb(163,0,43)">person</i>
                    </p>

                    <p>     
                        <input class=" w3-text-black w3-border-bottom" type="password"  id="passwordField" name="motdepasse" autocomplete="off" placeholder="Mot de passe" style="border:0;width:100%"><i class="fa fa-unlock-alt  w3-right" style="position: relative;top:-25px;font-size:22px;left: -5px;color: rgb(163,0,43)"></i>
                    </p>
                    <p>     
                        <input class=" w3-text-black w3-border-bottom" type="password"  id="confirmation" name="confirmation" autocomplete="off" placeholder="Confirmer mot de passe" style="border:0;width:100%"><i class="fa fa-unlock-alt  w3-right" style="position: relative;top:-25px;font-size:22px;left: -5px;color: rgb(163,0,43)"></i>
                    </p>
                    <h1>
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round" id="togglePasswordField" title="Montrer le mot de passe"></span>
                        </label>
                    </h1>




                    <button id="identifier" class="btn btn-3 btn-3e   w3-card-4 w3-margin-bottom  " style="background: rgb(163,0,43)" name="action" value="adduser">Enregistrer<i style="position: relative;right: -18px;font-size: 24px" class="fa fa-cloud-download"></i></button>
                </form>
                <script>
                    (function () {

                        try {

                            // switch the password field to text, then back to password to see if it supports
                            // changing the field type (IE9+, and all other browsers do). then switch it back.
                            var passwordField = document.getElementById('passwordField');
                            var confirmation = document.getElementById('confirmation');
                            passwordField.type = 'text';
                            passwordField.type = 'password';

                            // if it does support changing the field type then add the event handler and make
                            // the button visible. if the browser doesn't support it, then this is bypassed
                            // and code execution continues in the catch() section below
                            var togglePasswordField = document.getElementById('togglePasswordField');
                            togglePasswordField.addEventListener('click', togglePasswordFieldClicked, false);
                            togglePasswordField.style.display = 'inline';

                        } catch (err) {

                        }

                    })();

                    function togglePasswordFieldClicked() {

                        var passwordField = document.getElementById('passwordField');
                        var confirmation = document.getElementById('confirmation');
                        var value = passwordField.value;
                        var valuecon = confirmation.value;

                        if (passwordField.type == 'password') {
                            passwordField.type = 'text';
                            confirmation.type = 'text';

                        } else {
                            passwordField.type = 'password';
                            confirmation.type = 'password';

                        }

                        passwordField.value = value;
                        confirmation.value = value;


                    }
                </script>
            </div>

            <div id="form2" class=' w3-hide-large w3-hide-medium w3-center w3-container w3-card-32  w3-animate-opacity w3-display-middle w3-border  w3-modal-content'  style=" border:solid 5px black;width: 100%;">

                 <h2 class="w3-center w3-text-black">Add new User</h2>

                 <form action="./Server" method="post" class="w3-container">
                     <span onclick="document.getElementById('adduser').style.display = 'none'" 
                          class="w3-button  w3-display-topright gtg-background" style="position: absolute;top:10px;right: 0px;z-index: 100" >&times;</span>
                    <p>
                        <input class="w3-text-black w3-border-bottom w3-text-white" type="text" placeholder="Employee Id" name="id" style="border:0;width:100%"><i class="fa fa-id-card-o  w3-text-black w3-right" style="font-size:20px;position: relative;top:-33px"></i>
                    </p>
                    <p>
                        <input class="w3-text-black w3-border-bottom " type="text" placeholder="Employee name" name="nom_utilisateur" style="border:0;width:100%"><i class="material-icons w3-text-black w3-right" style="position: relative;top:-33px">person</i>
                    </p>

                    <p>     
                        <input class=" w3-text-black w3-border-bottom" type="password"  id="passwordField" name="motdepasse" autocomplete="off" placeholder="Password" style="border:0;width:100%"><i class="fa fa-unlock-alt w3-text-black w3-right" style="position: relative;top:-25px;font-size:22px;left: -5px"></i>
                    </p>
                    <p>     
                        <input class=" w3-text-black w3-border-bottom" type="password"  id="confirmation" name="confirmation" autocomplete="off" placeholder="Confirm password" style="border:0;width:100%"><i class="fa fa-unlock-alt w3-text-black w3-right" style="position: relative;top:-25px;font-size:22px;left: -5px"></i>
                    </p>
                    <h1>
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round" id="togglePasswordField" title="Show password"></span>
                        </label>
                    </h1>




                    <button id="identifier" class="btn btn-3 btn-3e   w3-card-4 w3-margin-bottom  " style="background: rgb(163,0,43)" name="action" value="adduser">Save</button>
                </form>
                <script>
                    (function () {

                        try {

                            // switch the password field to text, then back to password to see if it supports
                            // changing the field type (IE9+, and all other browsers do). then switch it back.
                            var passwordField = document.getElementById('passwordField2');
                            passwordField.type = 'text';
                            passwordField.type = 'password';

                            // if it does support changing the field type then add the event handler and make
                            // the button visible. if the browser doesn't support it, then this is bypassed
                            // and code execution continues in the catch() section below
                            var togglePasswordField = document.getElementById('togglePasswordField2');
                            togglePasswordField.addEventListener('click', togglePasswordFieldClicked, false);
                            togglePasswordField.style.display = 'inline';

                        } catch (err) {

                        }

                    })();

                    function togglePasswordFieldClicked() {

                        var passwordField = document.getElementById('passwordField2');
                        var value = passwordField.value;

                        if (passwordField.type == 'password') {
                            passwordField.type = 'text';
                        } else {
                            passwordField.type = 'password';
                        }

                        passwordField.value = value;

                    }
                </script>
            </div>
        </div>



    </body>

</html>
