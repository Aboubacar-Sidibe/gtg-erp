<%-- 
    Document   : newjsp1
    Created on : Sep 5, 2017, 6:16:20 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/glDatePicker.default.css" rel="stylesheet" type="text/css">
        
        

        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <input type="text" id="mydate"  gldp-id="mydate" />
        <div gldp-el="mydate"
             style="width:400px; height:300px; position:absolute; top:70px; left:100px;">
        </div>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="js/glDatePicker.min.js"></script>

        <script type="text/javascript">
            $(window).load(function ()
            {
                $('#mydate').glDatePicker();
            });
        </script>
    </body>
</html>
