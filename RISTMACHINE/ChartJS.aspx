<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="ChartJS.aspx.vb" Inherits="RISTMACHINE.ChartJS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/Chart.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <canvas width="720" height="480" id="chartcanvas"></canvas>

    <!-- javascript -->
   <%-- <script src="js/jquery.min.js"></script>
    <script src="js/Chart.min.js"></script>--%>

    <script type="text/javascript">
        //get the canvas
        var ctx = $("#chartcanvas");

        //instantiate the Chart class
        var chart = new Chart(ctx, {
            type : "line",
            data : {},
            options: {
                responsive : true
            }
        });
    </script>
</asp:Content>
