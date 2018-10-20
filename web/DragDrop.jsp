<%-- 
    Document   : DragDrop
    Created on : Sep 30, 2017, 12:07:45 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/w3.css">
        <title>JSP Page</title>
        <style>
            #dropHere
            {
                width: 350px;
                height: 70px;
                padding: 10px;
                border: 1px solid #aaaaaa;
                position: relative;
                right: 0;

            }
            #here{
                width: 550px;
                height: 170px;
                padding: 10px;
                border: 1px solid #aaaaaa;
                position: relative;
                right: 0;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>


        <div  id="here">


            <div ></div>
        </div>

        <img src="img/gtg.jpg"   width="50" height="69"/>
        <p id="drag1" draggable="true" ondragstart="drag(event)">cv/st</p>

        <div class="w3-row-padding" >
            <table class="w3-table-all">

                <thead>
                    <tr class="w3-light-grey ">
                        <th class="sal w3-black">Lundi</th>
                        <th  class="sal w3-black">Mardi</th>
                        <th  class="sal w3-black">Mercredi</th>
                        <th  class="sal w3-black">Jeudi</th>
                        <th  class="sal w3-black">Vendredi</th>
                        
                    </tr>
                </thead>
                <tr id="dropHere" ondragover="allowDrop(event)" ondrop="drop(event)">
                    <td>Jill</td>
                    <td>Smith</td>
                    <td>50</td>
                    <td>50</td>
                    <td>50</td>
                    
                </tr>
                <tr>
                    <td>Eve</td>
                    <td>Jackson</td>
                    <td>94</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr>
                    <td>Adam</td>
                    <td>Johnson</td>
                    <td>67</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
                <tr>
                    <td>Bo</td>
                    <td>Nilson</td>
                    <td>35</td>
                    <td>50</td>
                    <td>50</td>
                </tr>
            </table>

        </div>




        <script>
            function allowDrop(ev)
            {
                event.preventDefault();
            }

            function drag(ev)
            {
                ev.dataTransfer.setData("text", ev.target.id);
            }

            function drop(ev)
            {
                ev.preventDefault();
                var data = ev.dataTransfer.getData("text");
                ev.target.appendChild(document.getElementById(data));
            }

        </script>
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
                x[i].innerHTML ="Lundi    "+ day+"/"+month;
            }

        </script>
    </body>
</html>
