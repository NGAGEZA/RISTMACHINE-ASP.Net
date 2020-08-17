<%@ Page Title="ChartJS - Line" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="ChartJSLine.aspx.vb" Inherits="RISTMACHINE.ChartJSLine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/default.css" rel="stylesheet" />

    <div class="chart-container">
        <canvas id="line-chartcanvas"></canvas>
    </div>
    <!-- javascript -->
    <script src="Scripts/line.js"></script>
    <script src="Scripts/Chart.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
</asp:Content>
