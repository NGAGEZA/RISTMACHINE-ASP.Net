<%@ Page Title="ChartJS - Doughnut" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="ChartJSDoughnut.aspx.vb" Inherits="RISTMACHINE.ChartJSDoughnut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/default.css" rel="stylesheet" />
    <div class="chart-container">
        <div class="doughnut-chart-container">
            <canvas id="doughnut-chartcanvas-1"></canvas>
        </div>

        <div class="doughnut-chart-container">
            <canvas id="doughnut-chartcanvas-2"></canvas>
        </div>
    </div>
    <!-- javascript -->
    <script src="Scripts/doughnut.js"></script>
    <script src="Scripts/Chart.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
</asp:Content>
