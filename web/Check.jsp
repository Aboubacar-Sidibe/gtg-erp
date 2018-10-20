<%-- 
    Document   : Check
    Created on : Sep 13, 2017, 7:42:51 AM
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
        <h1 id="h1">Hello World!</h1>

        <div id="myElement">
            <span><b>This is in bold</b></span>
        </div>



        <script>
            function htmlStructure(data)
            {
                var target = document.getElementById(data);
                var wrap = document.createElement('div');
                wrap.appendChild(target.cloneNode(true));
                return wrap.innerHTML;
            }

        </script>
    </body>
</html>
