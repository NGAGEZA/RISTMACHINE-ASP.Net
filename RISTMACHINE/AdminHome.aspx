<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="AdminHome.aspx.vb" Inherits="RISTMACHINE.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function alertpermission() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-exclamation-triangle fa-3x text-danger'></i><br/>For Admin Only</h4>",
                title: "<h3 class='text-center text-nowrap'>RIST MACHINE SYSTEM ONLINE</h3>",
                buttons: {
                    danger: {
                        label: 'OK',
                        className: "btn-success",
                        callback: function () {
                            setTimeout(function () {
                                //txtemail.focus();
                                window.location.href="home.aspx";
                            }, 10);
                        }
                    }
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="particles"></div>
    <div class="container">  
    <div class="row">
        <div class="col-md-12">
            <h4><strong>RIST MACHINE SYSTEM ONLINE</strong></h4>
        </div>
    </div>
        <hr/>
    <div class="row">
        <div class="col-sm-3 col-xs-6 col-md-2">
            <a href="AdminSetFlow.aspx">
            <div class="tile TOMATO text-center">
                <h4 class="title text-nowrap">Set Flow User</h4>
                <span class="fa fa-sitemap fa-4x" aria-hidden="true"></span>
            </div>
            </a>
        </div>
        <div class="col-sm-3 col-xs-6 col-md-2">
            <a href="AdminSetFlowSafety.aspx">
                <div class="tile SKYBLUE text-center">
                    <h4 class="title text-nowrap">Set Flow Safety</h4>
                    <span class="fa fa-sitemap fa-4x" aria-hidden="true"></span>
                    
                </div>
            </a>
        </div>
        <div class="col-sm-3 col-xs-6 col-md-2">
            <a href="AdminSetPermission.aspx">
                <div class="tile darkslategray text-center">
                    <h4 class="title text-nowrap">Set Permission</h4>
                    <span class="fa fa-user-secret fa-4x" aria-hidden="true"></span>
                    
                </div>
            </a>
        </div>
        <%--<div class="col-sm-3 col-xs-6 col-md-2">
            <a href="#" id="showModalreport">
            <div class="tile red">
                <h3 class="title">Report</h3>
                <p>Export data Machine Report</p>
            </div>
            </a>
        </div>
        <div class="col-sm-3 col-xs-6 col-md-2">
            <a href="#" onclick="LoginNotComplete()">
            <div class="tile SKYBLUE">
                <h3 class="title text-nowrap">For Admin</h3>
                <p>Control Master Data</p>
            </div>
            </a>
        </div>--%>
    </div>
       

    
       
      
    </div>
</asp:Content>
