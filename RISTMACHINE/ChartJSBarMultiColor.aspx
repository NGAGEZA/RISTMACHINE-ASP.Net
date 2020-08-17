<%@ Page Title="ChartJS - Multicolor Bar graph" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="ChartJSBarMultiColor.aspx.vb" Inherits="RISTMACHINE.ChartJSBarMultiColor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/default.css" rel="stylesheet" />

    <div class="chart-container">
        <canvas id="bar-chartcanvas"></canvas>
    </div>
    <!-- javascript -->
    <script src="Scripts/bar-multicolor.js"></script>
    <script src="Scripts/Chart.min.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
</asp:Content>
