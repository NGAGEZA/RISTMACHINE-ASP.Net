<%@ Page Title="ChartJS - Pie" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="ChartJSPie.aspx.vb" Inherits="RISTMACHINE.ChartJSPie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/default.css" rel="stylesheet" />
    <div class="chart-container">
        <div class="pie-chart-container">
            <canvas id="pie-chartcanvas-1"></canvas>
        </div>

        <div class="pie-chart-container">
            <canvas id="pie-chartcanvas-2"></canvas>
        </div>
    </div>
    <!-- javascript -->
    <script src="Scripts/pie.js"></script>
    <script src="Scripts/Chart.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
</asp:Content>
