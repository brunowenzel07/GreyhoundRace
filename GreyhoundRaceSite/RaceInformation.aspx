<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RaceInformation.aspx.cs" Inherits="GreyhoundRaceSite.RaceInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "RaceInformation.aspx/GetRaceData",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $("#Content").html(response.d);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            });
</script>
        Information: 
        <h3>
            <div id="Content">

            </div>
        </h3>


        <%--<script>
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "Default.aspx/GetData",
                    async: false,
                    data: "{ }",
                    success: function (result) {
                        debugger;
                        data = result.d;
                        var s = "";
                        for (var i in result.d) {
                            s = s + result.d[i] + "</br>";
                        }
                        $('#InfoRacers').html(s);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert("An error has occured: " + xhr.responseText);
                    }
                });
            });
    </script>--%>

        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "RaceInformation.aspx/GetRacersData",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $("#InfoRacers").html(response.d);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            });
</script>

        <div id="InfoRacers">

        </div>
    </div>
    </form>
</body>
</html>
