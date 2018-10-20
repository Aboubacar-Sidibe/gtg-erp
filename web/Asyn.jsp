<%-- 
    Document   : Asyn
    Created on : Oct 28, 2017, 2:57:08 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/w3.css"/>
    </head>
    <body>


        <div id="wisdom" class="w3-card-2 w3-gray">
        </div>

        <input style="background: red" type="text" id="inputField" onkeyup="doUpdate()"/>


        <script>
            var wisdomTag = document.getElementById("wisdom");
            var inputTag = document.getElementById("inputField");
            function doUpdate()
            {
                var req;
                if (window.XMLHttpRequest)
                {
                    req = new XMLHttpRequest();
                } else if (window.ActiveXObject)
                {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                } else
                {
                    aleter("Ajax not supported");
                }
                req.onreadystatechange = function () {
                    if (req.readyState == 4 && req.status == 200)
                    {
                        wisdomTag.innerHTML = req.responseText;

                    }
                }
                text = inputTag.value;
                req.open("GET", "./Async?text=" + text, true);
                req.send();
            }

        </script>
    </body>
</html>
