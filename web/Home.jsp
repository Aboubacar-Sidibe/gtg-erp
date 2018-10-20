<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/animations.css" type="text/css">
        <title>Acceuil</title>
        <style>







            #sidebar {
                position: fixed;
                width: 18%;
                height: 100%;
                overflow-y: scroll;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                background: rgb(163,0,43);

            }

            #sidebar ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            #sidebar ul li { margin: 0; }

            #sidebar ul li a {
                padding: 15px 20px;
                padding-left: 0;
                font-size: 16px;
                font-weight: 100;
                color: black;
                text-decoration: none;
                display: block;
                border-bottom: 1px solid #C9223D;
                -webkit-transition: background 0.3s ease-in-out;
                -moz-transition: background 0.3s ease-in-out;
                -ms-transition: background 0.3s ease-in-out;
                -o-transition: background 0.3s ease-in-out;
                transition: background 0.3s ease-in-out;
            }


            .main-content {
                max-width: 100%;
                height: 100%;
                padding: 5px;
                padding-left: 0;
                margin-left: 18%;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                position: relative;
                overflow: scroll;
            }

            .main-content .content {
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                padding-left: 10px;
                width: 100%;
            }







            #sidebar li
            {
                background:rgb(163,0,43);
                /* Old browsers */
                background: -ms-linear-gradient(left, white 30% ,rgb(163,0,43) 70% );
                background: -webkit-linear-gradient(left, white 30% ,rgb(163,0,43) 70% );
                background: -o-linear-gradient(left,white 30% ,rgb(163,0,43) 70% );
                background: -moz-linear-gradient(left, white 30% ,rgb(163,0,43) 70% );
                background: linear-gradient(left, white ,rgb(163,0,43) 70% );
                background-size: 200% 100%;
                background-position:left bottom;
                margin-left:5px;
                transition:all 3s ease;
            }

            #sidebar li:hover{
                background-position: right bottom;
            }




            #toshow,#toshow2,#toshow3,#toshow4
            {
                display: none;
            }

            a.accordion.active {
                background: rgb(163,0,43);
            }


            a.accordion:after {
                content: '\02795'; /* Unicode character for "plus" sign (+) */
                font-size: 13px;
                color: #777;
                float: right;
                margin-left: 5px;
            }

            a.accordion.active:after {
                content: "\2796"; /* Unicode character for "minus" sign (-) */
            }

            #big-icon-1,#big-icon-2,#big-icon-3,#big-icon-4,#big-icon-5,#big-icon-6,#big-icon-7,#big-icon-8
            {
                font-size: 14px;
            }
            @media (max-width:601px) {
                #img{
                    height: 80px;
                    width: 70px;
                }
                #big-icon-1,#big-icon-2,#big-icon-3,#big-icon-4,#big-icon-5,#big-icon-6,#big-icon-7,#big-icon-8
                {
                    font-size: 26px;


                }
                .s-small-text
                {
                    font-size: 13px;
                }
                .s-hide{
                    display: none;
                }
                .main-content
                {
                    margin-left: 11%;
                }

            }

            .w3-theme {color:#fff !important; background-color:#a0002b  !important}
            .gtg-background
            {
                background: rgb(163,0,43);
            }
            .w3-theme-dark {color:#fff !important; background-color:#520016 !important}
            .w3-border-theme {border-color:rgb(163,0,43) !important}



        </style>
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <script>
            $(document).ready(function () {
                $("#arpenteur").click(function () {
                    $("#toshow").toggle(1000);
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#dessinateur").click(function () {
                    $("#toshow2").toggle(1000);
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#secretaire").click(function () {
                    $("#toshow3").toggle(1000);
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#admin").click(function () {
                    $("#toshow4").toggle(1000);
                });
            });
        </script>
    </head>

    <body>
        <c:set var="fonction" value="${sessionScope.fonction}" scope="session"/>
        <c:set var="verName" value="${requestScope.nom}" scope="request"/>


        <div id="sidebar">
            <div class="w3-row">
                <header>
                    <h1 class="w3-center"><img  src="img/gtg.jpg"  height="120" width="150" id="img"/></h1>
                </header>
            </div>

            <ul>
                <li class="w3-text-black  paddingLeft" id="arpenteur"><a class="accordion big-icon" href="#"><i class="fa fa-user-circle-o w3-left " style="position:relative;color: rgb(163,0,43)" id="big-icon-1"></i><span class="s-small-text"><span class="s-hide">Système</span> Arpenteur</span></a></li>
                <div id="toshow">
                    <li class="w3-text-black w3-center"><a href="./ServerAllTravaux?page=1">Travaux</a></li>

                    <li class="w3-text-gray w3-center"><button  onclick="getUrl()" class="w3-btn w3-block "> Répartition</button></li>




                </div>

            </ul>
            <ul>
                <li class="w3-text-black  " id="dessinateur"><a class="accordion" href="#"><i class="fa fa-paint-brush w3-left" style="position: relative;color: rgb(163,0,43)" id="big-icon-2"></i><span class="s-small-text"><span class="s-hide">Système</span> Dessinateur</span></a></li>
                <div id="toshow2">
                    <li class="w3-text-black w3-center" ><a href="./ServerAllDessinateur?page=1">Travaux</a></li>
                </div>


            </ul>


            
                                <ul>

                                    <li class="w3-text-black " id="admin"><a class="accordion" href="#"><i class="fa fa-user-secret w3-left" style="position: relative;;color: rgb(163,0,43)" id="big-icon-5"></i><span class="s-small-text">Admi<span class="s-hide">stratio</span>n</span></a></li>
                                    <div id="toshow4">
                                        <li class="w3-text-black w3-center"><a href="./ServerAllEmploye?page=1">Gestion employés</a></li>
                                        <li class="w3-text-black w3-center"><a href="./Server?action=alluser">Gestion utilisateurs</a></li>
                                        <li class="w3-text-black w3-center"><a href="./DeleteRepAccess"><i class="fa fa-unlock w3-left" style="position: relative;color: rgb(163,0,43)"></i>Déverouiller répartition</a></li>

                                    </div>

                                </ul>
                                <ul>
                                    <li class="w3-text-black  accordion"><a href="./ServerAllFournisseur?page=1"><i class="fa fa-truck w3-left" style="position: relative;;color: rgb(163,0,43)" id="big-icon-6"></i><span class="s-small-text">Fournisseurs</span></a></li>

                                </ul>
                                <ul>
                                    <li class="w3-text-black  accordion"><a href="./ServerAllInstrument?page=1"><i class="fa fa-gavel w3-left" style="position: relative;;color: rgb(163,0,43)" id="big-icon-7"></i><span class="s-small-text">Instruments</span></a></li>

                                </ul>



                                <ul>
                                    <li class="w3-text-black  accordion"><a href="./LoginServer?action=logout"><i class="fa fa-sign-out w3-left" style="position: relative;color: rgb(163,0,43)" id="big-icon-8"></i><span class="s-small-text">Fermer session</span></a></li>

                                </ul>
                                </div>
                                <div class="main-content">
                                    <c:if test="${not empty verName}">
                                        <div style="z-index: 20" id="deletesuccess" class="w3-half w3-display-topmiddle w3-theme-dark  w3-panel w3-leftbar w3-rightbar w3-xlarge  w3-text-white  w3-center w3-border-red w3-card-4 w3-margin-left w3-margin-right   w3-padding"><i><img class="w3-round-xxlarge w3-left" src="img/${requestScope.img}" alt=" " height="40" width="40"/> ${requestScope.nom} le (${requestScope.accesstime})</i></div>

                                    </c:if>


                                    <div class="content">

                                        <%@include file="ShowAllTravaux.jsp"%>


                                    </div>
                                </div>



                                <script>
                                    function getUrl()
                                    {
                                        <%
                                        LocalDate ld= LocalDate.now(ZoneId.of("America/Montreal"));
                                        LocalDate lundi = null;
                                            LocalDate mardi = null;
                                            LocalDate mercredi = null;
                                            LocalDate jeudi = null;
                                            LocalDate vendredi = null;
                                            LocalDate saturday = null;
                                            LocalDate sunday = null;

                                            DayOfWeek dayOfTheWeek = ld.getDayOfWeek();

                                            if (dayOfTheWeek.toString().equals("MONDAY")) {
                                                lundi = ld;
                                                mardi = ld.plusDays(1);
                                                mercredi = ld.plusDays(2);
                                                jeudi = ld.plusDays(3);
                                                vendredi = ld.plusDays(4);
                                            } else if (dayOfTheWeek.toString().equals("TUESDAY")) {
                                                lundi = ld.minusDays(1);
                                                mardi = ld;
                                                mercredi = ld.plusDays(1);
                                                jeudi = ld.plusDays(2);
                                                vendredi = ld.plusDays(3);
                                            } else if (dayOfTheWeek.toString().equals("WEDNESDAY")) {
                                                lundi = ld.minusDays(2);
                                                mardi = ld.minusDays(1);
                                                mercredi = ld;
                                                jeudi = ld.plusDays(1);
                                                vendredi = ld.plusDays(2);
                                            } else if (dayOfTheWeek.toString().equals("THURSDAY")) {
                                                lundi = ld.minusDays(3);
                                                mardi = ld.minusDays(2);
                                                mercredi = ld.minusDays(1);
                                                jeudi = ld;
                                                vendredi = ld.plusDays(1);
                                            } else if (dayOfTheWeek.toString().equals("FRIDAY")) {
                                                lundi = ld.minusDays(4);
                                                mardi = ld.minusDays(3);
                                                mercredi = ld.minusDays(2);
                                                jeudi = ld.minusDays(1);
                                                vendredi = ld;
                                            }
                                            else if (dayOfTheWeek.toString().equals("SATURDAY")) {
                                                lundi = ld.minusDays(5);
                                                mardi = ld.minusDays(4);
                                                mercredi = ld.minusDays(3);
                                                jeudi = ld.minusDays(2);
                                                vendredi = ld.minusDays(1);
                                                saturday =ld;
                                            }
                                            else if (dayOfTheWeek.toString().equals("SUNDAY")) {
                                                lundi = ld.minusDays(6);
                                                mardi = ld.minusDays(5);
                                                mercredi = ld.minusDays(4);
                                                jeudi = ld.minusDays(3);
                                                vendredi = ld.minusDays(2);
                                                saturday =ld.minusDays(1);
                                                sunday =ld;
                                                
                                            }

                                        
  
                                        %>
                                         var d ="<%=lundi.getDayOfMonth()%>";
                                         var m="<%=lundi.getMonthValue()%>";
                                         if(d<10)
                                             d="0"+d;
                                         if(m<10)
                                             m="0"+m;
                                         
                                        
                                        
                                       var trueDate =d + "/" +m + "/" + "<%=lundi.getYear()%>";

                                        var url = location.href = './RepartitionAccesssController?user=${sessionScope.nom}&zero=${sessionScope.empid}&repartionDate=' + trueDate;
                                        return url;
                                    }




                                    var acc = document.getElementsByClassName("accordion");
                                    var sign = document.getElementById("plus");
                                    var i;

                                    for (i = 0; i < acc.length; i++) {
                                        acc[i].onclick = function () {
                                            /* Toggle between adding and removing the "active" class,
                                             to highlight the button that controls the panel */
                                            this.classList.toggle("active");
                                            sign.innerHTML = "-";

                                        }




                                    }
                                </script>

                                <script src="//code.jquery.com/jquery.min.js"></script>
                                <script src="js/date-time-picker.min.js"></script>
                                <script type="text/javascript">
                                    var j = $.noConflict(true);
                                </script>
                                <script>
                                    j(document).ready(function () {
                                        j('#deletesuccess').delay(2500).slideUp(4000);
                                    });
                                </script>
                                <script>
                                    j('#TrMyDatePicker').dateTimePicker({

                                        // used to limit the date range
                                        limitMax: null,
                                        limitMin: null,

                                        // year name
                                        yearName: '',

                                        // month names
                                        monthName: ['JAN', 'FEV', 'MAR', 'AVR', 'MAI', 'JUIN', 'JUL', 'AOÛT', 'SEP', 'OCT', 'NOV', 'DEC'],

                                        // day names
                                        dayName: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],

                                        // "date" or "dateTime"
                                        mode: 'date',

                                        // custom date format
                                        format: null

                                    });
                                    j('#TrMyDate').dateTimePicker({

                                        // used to limit the date range
                                        limitMax: null,
                                        limitMin: null,

                                        // year name
                                        yearName: '',

                                        // month names
                                        monthName: ['JAN', 'FEV', 'MAR', 'AVR', 'MAI', 'JUIN', 'JUL', 'AOÛT', 'SEP', 'OCT', 'NOV', 'DEC'],

                                        // day names
                                        dayName: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],

                                        // "date" or "dateTime"
                                        mode: 'date',

                                        // custom date format
                                        format: null

                                    });
                                </script>
                                <c:forEach  var="travail" items="${travaux}">
                                    <script>
                                        j('#TrModMyDatePicker${travail.travailId}').dateTimePicker({

                                            // used to limit the date range
                                            limitMax: null,
                                            limitMin: null,

                                            // year name
                                            yearName: '',

                                            // month names
                                            monthName: ['JAN', 'FEV', 'MAR', 'AVR', 'MAI', 'JUIN', 'JUL', 'AOÛT', 'SEP', 'OCT', 'NOV', 'DEC'],

                                            // day names
                                            dayName: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],

                                            // "date" or "dateTime"
                                            mode: 'date',

                                            // custom date format
                                            format: null

                                        });
                                        j('#TrModMyDate${travail.travailId}').dateTimePicker({

                                            // used to limit the date range
                                            limitMax: null,
                                            limitMin: null,

                                            // year name
                                            yearName: '',

                                            // month names
                                            monthName: ['JAN', 'FEV', 'MAR', 'AVR', 'MAI', 'JUIN', 'JUL', 'AOÛT', 'SEP', 'OCT', 'NOV', 'DEC'],

                                            // day names
                                            dayName: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],

                                            // "date" or "dateTime"
                                            mode: 'date',

                                            // custom date format
                                            format: null

                                        });

                                        j('#EmpVacmyDate').dateTimePicker({

                                            // used to limit the date range
                                            limitMax: null,
                                            limitMin: null,

                                            // year name
                                            yearName: '',

                                            // month names
                                            monthName: ['JAN', 'FEV', 'MAR', 'AVR', 'MAI', 'JUIN', 'JUL', 'AOÛT', 'SEP', 'OCT', 'NOV', 'DEC'],

                                            // day names
                                            dayName: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],

                                            // "date" or "dateTime"
                                            mode: 'date',

                                            // custom date format
                                            format: null

                                        });
                                    </script>
                                </c:forEach>



                                </body>
                                </html>
