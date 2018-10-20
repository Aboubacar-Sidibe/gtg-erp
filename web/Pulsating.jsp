<%-- 
    Document   : Pulsating
    Created on : Nov 10, 2017, 9:06:23 AM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .pulsatingCircle{
                width:25px;
                height:25px;
                display:block;
                position:relative;
                margin:10% auto;
                transform:scale(5,5);
                -webkit-transform:scale(5,5);
            }

            .firstCircle,
            .secondCircle,
            .thirdCircle{
                top:50%;
                left:50%;
                display:block;
                border-radius:50%;
                position:absolute;
                vertical-align:middle;
            }

            .firstCircle{
                width:10px;
                height:10px;
                margin:-5px 0 0 -5px;
                background-color:#a0002b;
            }

            .secondCircle{
                width:16px;
                height:16px;
                margin:-9px 0 0 -9px;
                border:1px solid #a0002b;
                animation:2000ms pulseIn ease-in-out infinite;
                -webkit-animation:2000ms pulseIn ease-in-out infinite;						
            }

            @keyframes pulseIn{
                0%{
                    opacity:0;
                    transform:scale(0.2,0.2);
                }
                50%{
                    opacity:1;
                    transform:scale(1,1);
                }
                100%{
                    opacity:0;
                    transform:scale(0.2,0.2);
                }
            }

            @-webkit-keyframes pulseIn{
                0%{
                    opacity:0;
                    -webkit-transform:scale(0.2,0.2);
                }
                50%{
                    opacity:1;
                    -webkit-transform:scale(1,1);
                }
                100%{
                    opacity:0;
                    -webkit-transform:scale(0.2,0.2);
                }
            }

            .thirdCircle{
                width:24px;
                height:24px;
                border:1px solid #a0002b;
                margin:-13px 0 0 -13px;
                animation:2000ms pulseIn 500ms ease-in-out infinite;
                -webkit-animation:2000ms pulseIn 500ms ease-in-out infinite		
            }

        </style>
    </head>
    <body>

        <div class="pulsatingCircle">

            <span class="firstCircle"><span style="position:relative;top:-7px;left:3.5px;font-size:7px;color:#fff">+</span></span>


            <span class="secondCircle"></span>

            <span class="thirdCircle"></span>

        </div>
    </body>
</html>
