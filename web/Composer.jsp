<%-- 
    Document   : Composer
    Created on : Oct 28, 2017, 4:15:39 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${requestScope.composer}
        ${requestScope.rep}
        
        <div id="wisdom" class="w3-card-2 w3-gray">
        </div>
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
