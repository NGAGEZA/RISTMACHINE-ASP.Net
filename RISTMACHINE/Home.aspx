<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="Home.aspx.vb" Inherits="RISTMACHINE.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/particles.js"></script>
    <link href="Content/rmodal.css" rel="stylesheet" />
    <script src="Scripts/rmodal.js"></script>
    <link href="Content/animate.css" rel="stylesheet" />

    <script src="Scripts/modaledit.js"></script>
    <script src="Scripts/modalreport.js"></script>
    <script src="Scripts/modalviewstatus.js"></script>
    
    
    <%--  --%>
    <style type="text/css">
        .modal .modal-dialog {
            width: 400px;
        }

        .wrimagecard {
            margin-top: 0;
            margin-bottom: 1.5rem;
            text-align: left;
            position: relative;
            background: #fff;
            box-shadow: 12px 15px 20px 0 #2e3d49;
            box-shadow: 12px 15px 20px 0 rgba(46,61,73,0.15);
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .wrimagecard .fa{
            position: relative;
            font-size: 70px;
        }
        .wrimagecard-topimage_header{
            padding: 20px;
        }
        a.wrimagecard:hover, .wrimagecard-topimage:hover {
            box-shadow: 2px 4px 8px 0 #2e3d49;
            box-shadow: 2px 4px 8px 0 rgba(46,61,73,0.2);
        }

        .wrimagecard-topimage a {
            width: 100%;
            height: 100%;
            display: block;
        }
        .wrimagecard-topimage_title {
            padding: 20px 24px;
            height: 80px;
            padding-bottom: 0.75rem;
            position: relative;
        }
        .wrimagecard-topimage a {
            border-bottom: none;
            text-decoration: none;
            color: #525c65;
            transition: color 0.3s ease;
        }
    </style>
   
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
  
    <%--send parameter for edit--%>
    <script type="text/javascript">
        $(function () {
            $("#btnedit").bind("click",
                function() {
                    //debugger;
                    var e = document.getElementById(('<%= editmcno.ClientID %>'));
                    var emcno = e.options[e.selectedIndex].text;
                    var url = "Main.aspx?emcno=" + encodeURIComponent(emcno);
                    window.location.href = url;

                   
                });
        });
    
    </script>
    <%--send parameter for print--%>
    <script type="text/javascript">
        $(function () {
            $("#btnprint").bind("click",
                function() {
                    debugger;
                    var p = document.getElementById(('<%= reportmcno.ClientID %>'));
                    var pNo = document.getElementById(('<%= report_pageno.ClientID %>'));
                    var pmcno = p.options[p.selectedIndex].text;
                    var pageno = pNo.options[pNo.selectedIndex].text;
                    var url = "GetReport.aspx?pmcno=" + encodeURIComponent(pmcno) + "&pageno=" + pageno;
                    window.location.href = url;
                   
                });
        });
    
    </script>
    
    <%--send parameter for check status--%>
    <script type="text/javascript">
        $(function () {
            $("#btnstatus").bind("click",
                function() {
                    
                    var v = document.getElementById(('<%= statusmcno.ClientID %>'));
                    var checkmcno = v.options[v.selectedIndex].text;
                    var url = "CheckStatus.aspx?checkmcno=" + encodeURIComponent(checkmcno);
                    window.location.href = url;
                   
                });
        });
    
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div id="particles"></div>
    <div class="container">  
    <div class="row">
        <div class="col-md-12">
            <h2><strong>RIST MACHINE SYSTEM ONLINE</strong></h2>
           
        </div>
    </div>
        <hr/>
    <div class="row">
       
   

        <div class="col-sm-3 col-xs-6 col-md-3">
            <div class="wrimagecard wrimagecard-topimage">
                <a href="Main.aspx">
                    <div class="wrimagecard-topimage_header" style="background-color:#795a47; background-color:rgba(121, 90, 71, 0.1)">
                        <div style="text-align: center;" ><i class="fa fa-server" style="color: #795a47"></i></div>
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4><b>Entry</b> Register Data</h4>
                    </div>
                </a>
            </div>
        
        </div>
        <div class="col-sm-3 col-xs-6 col-md-3">
            <div class="wrimagecard wrimagecard-topimage">
                <a href="#" id="showModaledit">
                    <div class="wrimagecard-topimage_header" style="background-color:#16a085; background-color:rgba(22, 160, 133, 0.1)">
                        <div style="text-align: center;" ><i class="fa fa-pencil-square-o" style="color: #16a085"></i></div>
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4><b>Edit</b> Update Data</h4>
                    </div>
                </a>
            </div>
          
        </div>
        <div class="col-sm-3 col-xs-6 col-md-3">
            <div class="wrimagecard wrimagecard-topimage">
                <a href="#" id="showModalreport">
                    <div class="wrimagecard-topimage_header" style="background-color:#d50f25; background-color:rgba(213, 15, 37, 0.1)">
                        <div style="text-align: center;" ><i class="fa fa-file-pdf-o" style="color: #d50f25"></i></div>
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4><b>Report</b> Export Data</h4>
                    </div>
                </a>
            </div>
          
        </div>
        <div class="col-sm-3 col-xs-6 col-md-3">
            <div class="wrimagecard wrimagecard-topimage">
                <a href="#" id="foradmin" runat="server" OnServerClick="CheckUserPermission">
                    <div class="wrimagecard-topimage_header" style="background-color:#f9650a; background-color:rgba(249, 101, 10, 0.1)">
                        <div style="text-align: center;" ><i class="fa fa-user-secret" style="color: #f9650a"></i></div>
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4><b>Admin</b> Control Master</h4>
                    </div>
                </a>
            </div>
           
        </div>
        <div class="col-sm-3 col-xs-6 col-md-3">
            <div class="wrimagecard wrimagecard-topimage">
                <a href="#" id="showModalViewstatus">
                    <div class="wrimagecard-topimage_header" style="background-color:#78e5f0; background-color:rgba(120, 229, 240, 0.1)">
                        <div style="text-align: center;" ><i class="fa fa-tachometer" style="color: #78e5f0"></i></div>
                    </div>
                    <div class="wrimagecard-topimage_title">
                        <h4><b>Status</b> View Status</h4>
                    </div>
                </a>
            </div>
           
        </div>
    </div>
       

    
        <%--rmodal edit--%>
        <div id="modaledit" class="modal">
            <div class="modal-dialog animated">
                <div class="modal-content">
                    <form class="form-horizontal" method="get">
                        <div class="modal-header">
                            <strong>Search MCNO For Edit</strong>
                        </div>

                        <div class="modal-body">
                          <div class='form-group'>
                                <label class="font800 control-label col-xs-4">Machine No.</label>
                                <div class="input-group col-xs-7">
                                    <span class="input-group-addon"><i class="fa fa-list-ol fa-lg" aria-hidden="true"></i></span>
                                   <select id="editmcno" runat="server" name="editmcno" class="form-control"><option></option></select>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-default" type="button" id="btneditclose">Cancel</button>
                            <button class="btn btn-primary" type="button" id="btnedit">Get</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <%--rmodal report--%>
        <div id="modalreport" class="modal">
            <div class="modal-dialog animated">
                <div class="modal-content">
                    <form class="form-horizontal" method="get">
                        <div class="modal-header">
                            <strong>Search MCNO For Print</strong>
                        </div>

                        <div class="modal-body">
                            <div class='form-group'>
                                <label class="font800 control-label col-xs-4">Machine No.</label>
                                <div class="input-group col-xs-7">
                                    <span class="input-group-addon"><i class="fa fa-list-ol fa-lg" aria-hidden="true"></i></span>
                                   <select id="reportmcno" runat="server" name="reportmcno" class="form-control"><option></option></select>
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <label class="font800 control-label col-xs-4">Page No.</label>
                                <div class="input-group col-xs-7">
                                    <span class="input-group-addon"><i class="fa fa-list-ol fa-lg" aria-hidden="true"></i></span>
                                    <select id="report_pageno" runat="server" name="report_pageno" class="form-control"><option value="" selected disabled hidden>Choose here</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-default" type="button" id="btnrptclose">Cancel</button>
                            <button class="btn btn-primary" type="button" id="btnprint">Get</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%--rmodal status--%>
        <div id="modalviewstatus" class="modal">
            <div class="modal-dialog animated">
                <div class="modal-content">
                    <form class="form-horizontal" method="get">
                        <div class="modal-header">
                            <strong>Search MCNO For View Progress</strong>
                        </div>

                        <div class="modal-body">
                            <div class='form-group'>
                                <label class="font800 control-label col-xs-4">Machine No.</label>
                                <div class="input-group col-xs-7">
                                    <span class="input-group-addon"><i class="fa fa-list-ol fa-lg" aria-hidden="true"></i></span>
                                    <select id="statusmcno" runat="server" name="statusmcno" class="form-control"><option></option></select>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-default" type="button" id="btnstatusclose">Cancel</button>
                            <button class="btn btn-primary" type="button" id="btnstatus">Get</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
      
    </div>
</asp:Content>

