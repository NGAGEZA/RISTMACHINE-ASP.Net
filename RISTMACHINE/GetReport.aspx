<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="GetReport.aspx.vb" Inherits="RISTMACHINE.GetReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function datanotfound() {
           
            bootbox.dialog({
                message: "data not found.",
                title: 'RIST MACHINE SYSTEM ONLINE',
                buttons: {
                    danger: {
                        label: 'ok',
                        className: "btn-danger",
                        callback: function () {
                            setTimeout(function () {
                                //txtemail.focus();
                                window.location.href="Home.aspx";
                            }, 10);
                        }
                    }
                }
            });
        }
    </script>
    <script src="crystalreportviewers13/js/crviewer/crv.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<div class="container ">
        <div class="text-center">
            <CR:CrystalReportViewer ID="crv1" runat="server" AutoDataBind="true" Height="800" Width="600" BestFitPage="False" ToolPanelView="None" />
        </div>
        
    </div>
    <br/>
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success" OnClick="Export">Export</asp:LinkButton>--%>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
</asp:Content>
