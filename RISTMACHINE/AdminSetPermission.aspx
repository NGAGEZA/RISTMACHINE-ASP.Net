<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="AdminSetPermission.aspx.vb" Inherits="RISTMACHINE.AdminSetPermission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/quicksearch.js"></script>

    <link href="Content/rmodal.css" rel="stylesheet" />
    <script src="Scripts/rmodal.js"></script>
    <link href="Content/animate.css" rel="stylesheet" />

    
    
    <script src="Scripts/modalsetpermission.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=gvlistuser] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
    </script>
    
    
    <script type="text/javascript">
        function openModalsetpermission() {
            var modalsetpermissionadmin = new RModal(document.getElementById('modalsetpermission'), {

            });
            modalsetpermissionadmin.open();

        }
    </script>
    <script>
        function clearMyField() {
           
                       
            window.location.href="AdminSetPermission.aspx";
        }
    </script>
    <style type="text/css">
        .modal .modal-dialog {
            width: 400px;
        }
    </style>
    <script type="text/javascript">
        function UpdateComplete() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-check fa-3x text-success'></i><br/>Update Data Complete</h4>",
                title: "<h3 class='text-center'>RIST MACHINE SYSTEM ONLINE</h3>",
                buttons: {
                    danger: {
                        label: 'OK',
                        className: "btn-success",
                        callback: function () {
                            setTimeout(function () {
                                //txtemail.focus();
                                window.location.href="AdminSetPermission.aspx";
                            }, 10);
                        }
                    }
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="jumbotron">  
            <p class="text-danger">Admin Management Set Permission</p>  
            <span class="text-info">You can edit set permission user </span>  
            <hr/>
            <%--<a class="btn btn-primary" href="#" id="showModalsetflow"><span class="fa fa-share"></span> Create</a>--%>
        </div> 
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <asp:GridView ID="gvlistuser" Width="100%" CssClass="table  table-bordered table-hover" AutoGenerateColumns="False" runat="server" OnDataBound="gvlistuser_DataBound"   EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:HyperLinkField DataTextField="OperatorNo" DataNavigateUrlFields="OperatorNo" DataNavigateUrlFormatString="~/AdminSetPermission.aspx?ID={0}" ItemStyle-CssClass="text-center"
                            HeaderText="OperatorNo" HeaderStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="Username" HeaderText="Username" HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" HeaderStyle-CssClass="text-center" DataFormatString="{0:dd/M/yyyy}" />
                            <asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" HeaderStyle-CssClass="text-center" DataFormatString="{0:dd/M/yyyy}" />
                            <asp:BoundField DataField="Permission" HeaderText="Permission" HeaderStyle-CssClass="text-center" />
                            

                        </Columns>
                        <HeaderStyle CssClass="text-center text-nowrap font800"></HeaderStyle>
                        
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <%--rmodal modalsetpermission--%>
    <div id="modalsetpermission" class="modal">
        <div class="modal-dialog animated">
            <div class="modal-content">
                <form class="form-horizontal" method="get">
                    <div class="modal-header">
                        <strong>Set Permission</strong>
                    </div>

                    <div class="modal-body">
                       
                        <div class="row">
                            <div class="col-md-12">
                                <div class='form-group'>
                                   
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa-lg" aria-hidden="true"></i></span>
                                      <input id="txtopno" type="text" name="opno" class="form-control" runat="server" disabled/>
                                            
                                    </div>
                           
                                </div> 
                            </div> 
                            <div class="col-md-12">
                                <div class='form-group'>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-hashtag fa-lg" aria-hidden="true"></i></span>
                                        <select id="permission" runat="server" name="permission" class="form-control">
                                            <option value="User">User</option>
                                            <option value="Admin">Admin</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-default" type="button" id="btnclose" onclick="clearMyField();">Cancel</button>
                        <asp:LinkButton ID="lnkupdate" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="Update"></asp:LinkButton>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
