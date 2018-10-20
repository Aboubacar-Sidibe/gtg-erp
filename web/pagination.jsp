<%-- 
    Document   : pagination
    Created on : Aug 18, 2017, 4:07:56 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>jQuery table.hpaging Plugin Demo</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        <link href=css/paging.css rel="stylesheet" type="text/css" />
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="scripts/jquery.table.hpaging.min.js"></script>
        <style>
            body { background-color:#fafafa;}
            .container { margin:150px auto; font-family:'Roboto';}
            table { margin:10px 0;}
        </style>
    </head>
    <body>
        
    </div>
    <div>
        <h1>jQuery table.hpaging Plugin Demo</h1>
        <table>
            <tr>
                <td>
                    <input id="pglmt" placeholder="Page Limit" title="Page Limit" value="10" class="form-control">
                </td>
                <td>
                    <button id="btnApply" class="btn btn-danger">Apply</button>
                </td>
            </tr>
        </table>
        <table id="table1" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>
                        Header 1
                    </th>
                    <th>
                        Header 2
                    </th>
                    <th>
                        Header 3
                    </th>
                    <th>
                        Header 4
                    </th>
                    <th>
                        Header 5
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        row 1 - col 1
                    </td>
                    <td>
                        row 1 - col 2
                    </td>
                    <td>
                        row 1 - col 3
                    </td>
                    <td>
                        row 1 - col 4
                    </td>
                    <td>
                        row 1 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 2 - col 1
                    </td>
                    <td>
                        row 2 - col 2
                    </td>
                    <td>
                        row 2 - col 3
                    </td>
                    <td>
                        row 2 - col 4
                    </td>
                    <td>
                        row 2 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 3 - col 1
                    </td>
                    <td>
                        row 3 - col 2
                    </td>
                    <td>
                        row 3 - col 3
                    </td>
                    <td>
                        row 3 - col 4
                    </td>
                    <td>
                        row 3 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 4 - col 1
                    </td>
                    <td>
                        row 4 - col 2
                    </td>
                    <td>
                        row 4 - col 3
                    </td>
                    <td>
                        row 4 - col 4
                    </td>
                    <td>
                        row 4 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 5 - col 1
                    </td>
                    <td>
                        row 5 - col 2
                    </td>
                    <td>
                        row 5 - col 3
                    </td>
                    <td>
                        row 5 - col 4
                    </td>
                    <td>
                        row 5 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 6 - col 1
                    </td>
                    <td>
                        row 6 - col 2
                    </td>
                    <td>
                        row 6 - col 3
                    </td>
                    <td>
                        row 6 - col 4
                    </td>
                    <td>
                        row 6 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 7 - col 1
                    </td>
                    <td>
                        row 7 - col 2
                    </td>
                    <td>
                        row 7 - col 3
                    </td>
                    <td>
                        row 7 - col 4
                    </td>
                    <td>
                        row 7 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 8 - col 1
                    </td>
                    <td>
                        row 8 - col 2
                    </td>
                    <td>
                        row 8 - col 3
                    </td>
                    <td>
                        row 8 - col 4
                    </td>
                    <td>
                        row 8 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 9 - col 1
                    </td>
                    <td>
                        row 9 - col 2
                    </td>
                    <td>
                        row 9 - col 3
                    </td>
                    <td>
                        row 9 - col 4
                    </td>
                    <td>
                        row 9 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 10 - col 1
                    </td>
                    <td>
                        row 10 - col 2
                    </td>
                    <td>
                        row 10 - col 3
                    </td>
                    <td>
                        row 10 - col 4
                    </td>
                    <td>
                        row 10 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 11 - col 1
                    </td>
                    <td>
                        row 11 - col 2
                    </td>
                    <td>
                        row 11 - col 3
                    </td>
                    <td>
                        row 11 - col 4
                    </td>
                    <td>
                        row 11 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 12 - col 1
                    </td>
                    <td>
                        row 12 - col 2
                    </td>
                    <td>
                        row 12 - col 3
                    </td>
                    <td>
                        row 12 - col 4
                    </td>
                    <td>
                        row 12 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 13 - col 1
                    </td>
                    <td>
                        row 13 - col 2
                    </td>
                    <td>
                        row 13 - col 3
                    </td>
                    <td>
                        row 13 - col 4
                    </td>
                    <td>
                        row 13 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 14 - col 1
                    </td>
                    <td>
                        row 14 - col 2
                    </td>
                    <td>
                        row 14 - col 3
                    </td>
                    <td>
                        row 14 - col 4
                    </td>
                    <td>
                        row 14 - col 5
                    </td>
                </tr>
                <tr>
                    <td>
                        row 15 - col 1
                    </td>
                    <td>
                        row 15 - col 2
                    </td>
                    <td>
                        row 15 - col 3
                    </td>
                    <td>
                        row 15 - col 4
                    </td>
                    <td>
                        row 15 - col 5
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <script type="text/javascript">
        $(function () {
            $("#table1").hpaging({"limit": 5});
        });

        $("#btnApply").click(function () {
            var lmt = $("#pglmt").val();
            $("#table1").hpaging("newLimit", lmt);
        });
    </script>

</body>
</html>

