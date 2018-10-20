<%-- 
    Document   : SetImage
    Created on : Sep 10, 2017, 9:22:25 AM
    Author     : sidibe&samee
--%>

<div class="w3-container w3-modal w3-animate-opacity" id="imageCard" style="display: none;z-index: 100;">


    <div class="w3-card-4 w3-dark-grey w3-modal-content w3-right" style="width:30%;top: 55px;" >
        <span onclick="document.getElementById('imageCard').style.display = 'none'" 
                              class="w3-button  w3-display-topright w3-dark-gray w3-text-white" >&times;</span>

        <div class="w3-container w3-center">
            <h3>${sessionScope.utilisateur.nom}</h3>
            <img src="img/${sessionScope.empImg}" height="50" width="50" alt="Avatar" class="w3-round-xxlarge" >
            <h5>${sessionScope.fonction}</h5>
            <h5></h5>

            <div class="w3-section">
                <a class="w3-button w3-green w3-round-xxlarge" title="ajouter une photo" onclick="document.getElementById('imageForm').style.display = 'block'">Ajouter photo  <i class="material-icons" style="font-size:20px">add_a_photo</i></a>
                <a class="w3-button w3-red w3-round-xxlarge" href="./LoginServer?action=logout" title="fermer la session">Fermer session  <i class="fa fa-sign-out" style="font-size:18px"></i></a>
            </div>


            <div id="imageForm" style="display: none" class="w3-dark-gray w3-padding-32">

                <form action = "./UploadImg?action=${sessionScope.empid}" method = "post"
                      enctype = "multipart/form-data">

                    <div class="w3-row w3-left">
                        <span onclick="document.getElementById('imageForm').style.display = 'none'" 
                              class="w3-button  w3-display-topright w3-dark-gray w3-text-white" >&times;</span>
                        <input  type = "file" name = "file" size = "50" />

                    </div>
                    <div class="w3-row w3-left">
                        <input  type = "submit" value ="Charger"/>
                    </div>

                </form>
            </div>
        </div>

    </div>
</div>

