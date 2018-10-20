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


        <title>Utilisateurs</title>
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

            }
            #user
            {
                display: none;
            }


        </style>

    </head>
    <body>
        <div class="w3-row-padding w3-container w3-margin-bottom w3-animate-right" id="use">
            <div class="w3-container">
                <div class="w3-bar w3-white">
                    <button title="Ajouter un nouvel utilisateur"  class="pulsatingCircle w3-btnP w3-margin-top" style="position: fixed;float:right;right: 10px;" onclick="document.getElementById('adduser').style.display = 'block'">

                        <span class="firstCircle"><span style="position: relative;top:-12px"><i class="fa fa-user-plus" style="font-size: 3px;position: relative;right: 0px;color: #fff"></i></span></span>


                        <span class="secondCircle"></span>

                        <span class="thirdCircle"></span>

                    </button>

                    <a class=" w3-bar-item w3-right" >
                        <img class="w3-round-xxlarge   w3-card-32" style="position: relative;right: 15px" src="img/${sessionScope.empImg}" alt="Utilisateur" height="50" width="50" title="${sessionScope.utilisateur.nom}" onclick="document.getElementById('imageCard').style.display = 'block'"/>
                    </a>
                    <%@include file="SetImage.jsp"%>

                </div>

                <header class="w3-row">

                    <div class="w3-row w3-center">
                        <h2 class="w3-center w3-text-white w3-container w3-btn w3-card-32" style="background: rgb(163,0,43)">Liste d'utilisateur</h2>
                    </div>

                </header>

                <%@include file="AddUser.jsp"%>


                <%--pagination--%>
                <div id="filtre-container" class="w3-hide-medium w3-hide-large">
                    <button class="w3-btn w3-white w3-right w3-card-4 w3-hide-medium w3-hide-large" onclick="document.getElementById('filtre').style.display = 'block'">Filtre</button>
                    <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray" id="filtre" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Entre un mot clé" style="display: none">
                </div>



                <div style="overflow-x: auto;">

                    <table class="w3-table w3-table-all w3-card-32" id="id01" style="width: 100%;">

                        <tr class="w3-text-white" style="background: rgb(163,0,43)">
                            <th onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(1)')" style="cursor:pointer">Nom d'utilisateur<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(2)')" style="cursor:pointer">Role<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(3)')" style="cursor:pointer">E-mail<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>
                            <th colspan="2" class="w3-border-right w3-center" onclick="w3.sortHTML('#id01', '.item', 'td:nth-child(4)')" style="cursor:pointer">Actions<i class="fa fa-sort w3-text-white w3-right" style="font-size:16px"></i></th>                    

                        </tr>
                        <c:forEach  var="user" items="${users}">
                            <tr class="w3-text-black item w3-hover-pink">
                                <td><c:out value="${user.nom}"/></td>
                                <td><c:out value="${user.fonction}"/></td>
                                <td><c:out value="${user.mail}"/></td>
                                <td title="modification" class="w3-hover-blue-gray w3-gray w3-text-white" onclick="document.getElementById('<c:out value="${user.id}"/>').style.display = 'block'"><i  class="fa fa-pencil" style="font-size:14px"></i></td>
                                <td title="supprimé" class="w3-hover-blue-gray w3-gray w3-text-white"><a class="w3-text-white" href="./ServerDeleteUser?userId=<c:out value="${user.id}"/>"><i class="fa fa fa-trash-o w3-hover-text-white" style="font-size:14px"></i></a></td>


                            <div id="<c:out value="${user.id}"/>" class="w3-modal w3-animate-zoom">
                                <div class="w3-modal-content w3-card-32 ">
                                    <header>
                                        <span onclick="document.getElementById('<c:out value="${user.id}"/>').style.display = 'none'" 
                                              class="w3-button  w3-display-topright" >&times;</span>
                                        <h2 class="w3-text-white w3-center gtg-background">Modification</h2>
                                    </header>

                                    <form class="w3-container w3-card-4 " action="./Server" method="post">
                                        <div class="w3-row-padding w3-margin-bottom">
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Nom d'utilisateur</b></label><i class="fa fa-id-card w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input class="w3-input w3-border-bottom "  name="nom_utilisateur" type="text" value="<c:out value="${user.nom}"/>" required=""></p>
                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Role</b></label><i class="material-icons w3-right " style="font-size:16px;position: relative;top:40px;color: rgb(163,0,43)">supervisor_account</i>
                                                    <input class="w3-input w3-border-bottom w3-text-gray"   name="fonction" type="text" readonly="" value="<c:out value="${user.fonction}"/>"></p>

                                                </p>
                                            </div>

                                        </div>
                                        <div class="w3-row-padding w3-light-grey">
                                            <h2 class="w3-center w3-container w3-text-blue-grey">Changer le mot de passe</h2>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Nouveau</b></label><i class="fa fa-unlock-alt w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input id='nouv' onkeyup="checkMatch()" class="w3-input w3-border-bottom w3-light-gray"  name="motdepasse" type="text" value="<c:out value="${user.mot_de_passe}"/>" required="" ></p>
                                            </div>
                                            <div class="w3-half">
                                                <p>      
                                                    <label class="w3-text-blue-gray"><b>Confirmer</b></label><i class="fa fa-unlock-alt w3-right " style="font-size:14px;position: relative;top:40px;color: rgb(163,0,43)"></i>
                                                    <input id="conf" onkeyup="checkMatch()" class="w3-input w3-border-bottom w3-light-grey"  name="confirmation" type="text" value="<c:out value="${user.mot_de_passe}"/>" required=""></p>
                                            </div>

                                        </div>
                                        <div class="w3-row-padding w3-margin-bottom w3-light-grey">
                                            <h6 class="w3-center">      
                                                <button id='modif'  class="w3-btn  w3-center w3-card-32 w3-text-white" style="background: rgb(163,0,43)" name="action" value="modify">Modifier<i class="fa fa-braille" style="font-size:18px;position: relative;right: -8px"></i></button></h6><br>
                                        </div>
                                        <input  class="w3-input w3-border-bottom w3-light-grey"  name="id" type="hidden" value="<c:out value="${user.id}"/>" required="" readonly=""></p>

                                    </form>
                                </div>
                            </div>

                            </tr>

                        </c:forEach>
                        <%--pagination--%>
                        <button class="w3-btn w3-white w3-right w3-card-4 w3-hide-small" onclick="document.getElementById('filtre2').style.display = 'block'">Filtre</button>
                        <input class=" w3-right w3-text-black w3-animate-zoom w3-padding w3-card-2 w3-dark-gray w3-hide-small" id="filtre2" oninput="w3.filterHTML('#id01', '.item', this.value)" placeholder="Dis-moi le mot clé que tu cherches" style="width: 28%;display: none;background: gray">









                    </table>
                </div>
            </div>

        </div>

        <script>
            function checkMatch()
            {
                var nouv = document.getElementById('nouv').value;
                var conf = document.getElementById('conf').value;
                if (nouv===conf)
                {
                    document.getElementById('modif').disabled = false;
                }
                else
                {
                     document.getElementById('modif').disabled = true;
                }

            }
        </script>

        <script>

// Get the modal
            var modal = document.getElementById('<c:out value="${user.id}"/>');


// When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }



        </script>

        <script>
// Get the modal
            var modal2 = document.getElementById('adduser');

// When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal2) {
                    modal2.style.display = "none";
                }
            }
        </script>


    </body>
</html>
