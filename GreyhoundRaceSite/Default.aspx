<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GreyhoundRaceSite._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Greyhound Racing</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3> Available Races</h3>
    <script>
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
                        s = s + '<a href="RaceInformation.aspx?name='+ result.d[i] + '">' + result.d[i] + '</a>';
                    }
                    $('#Content').html(s);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert("An error has occured: " + xhr.responseText);
                }
            });
        });
    </script>
        <div id="Content">
        </div>
    <asp:XmlDataSource runat="server" ID="xmlSource" DataFile="~/race.xml"></asp:XmlDataSource>
</asp:Content>
