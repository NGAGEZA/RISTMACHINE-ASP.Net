<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="AdminSetFlow.aspx.vb" Inherits="RISTMACHINE.AdminSetFlow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/quicksearch.js"></script>

    <link href="Content/rmodal.css" rel="stylesheet" />
    <script src="Scripts/rmodal.js"></script>
    <link href="Content/animate.css" rel="stylesheet" />

    
    <script src="Scripts/modalsetflow.js"></script>
    
    <script type="text/javascript">
        function openModaledit() {
            var modalsetflowedit = new RModal(document.getElementById('modalsetflow'), {

            });
            modalsetflowedit.open();

        }
    </script>
<script>
    function setFocussectmgr(){
        document.getElementById('<%= tbemailsectmgr.ClientID %>').focus();
    }
</script>

    <style type="text/css">
        /*.modal .modal-dialog {
            width: 800px;
        }*/
    </style>
    <script type="text/javascript">
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=gvflow] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
    </script>
    <script type="text/javaScript">
        function clearMyField() {
            if(document.getElementById('<%= txtopnorequest.ClientID %>').value !== '') {
                document.getElementById('<%= txtopnorequest.ClientID %>').value = '';
            }
            if(document.getElementById('<%= txtopnosectmgr.ClientID %>').value !== '') {
                document.getElementById('<%= txtopnosectmgr.ClientID %>').value = '';
            }
            if(document.getElementById('<%= tbemailsectmgr.ClientID %>').value !== '') {
                document.getElementById('<%= tbemailsectmgr.ClientID %>').value = '';
            }
            if(document.getElementById('<%= txtopnodeptmgr.ClientID %>').value !== '') {
                document.getElementById('<%= txtopnodeptmgr.ClientID %>').value = '';
            }
            if(document.getElementById('<%= tbemaildeptmgr.ClientID %>').value !== '') {
                document.getElementById('<%= tbemaildeptmgr.ClientID %>').value = '';
            }
            if(document.getElementById('<%= txtopnodivmgr.ClientID %>').value !== '') {
                document.getElementById('<%= txtopnodivmgr.ClientID %>').value = '';
            }
            if(document.getElementById('<%= tbemaildivmgr.ClientID %>').value !== '') {
                document.getElementById('<%= tbemaildivmgr.ClientID %>').value = '';
            }

           
            window.location.href="AdminSetFlow.aspx";
        }

    </script>
<script type="text/javascript">
    function InsertComplete() {
        bootbox.dialog({
            message: "Insert Data Complete",
            title: 'RIST MACHINE SYSTEM ONLINE',
            buttons: {
                danger: {
                    label: 'ok',
                    className: "btn-success",
                    callback: function () {
                        setTimeout(function () {
                            //txtemail.focus();
                            //window.location.href="home.aspx";
                        }, 10);
                    }
                }
            }
        });
    }

    function UpdateComplete() {
        bootbox.dialog({
            message: "Update Data Complete",
            title: 'RIST MACHINE SYSTEM ONLINE',
            buttons: {
                danger: {
                    label: 'ok',
                    className: "btn-success",
                    callback: function () {
                        setTimeout(function () {
                            //txtemail.focus();
                            window.location.href="AdminSetFlow.aspx";
                        }, 10);
                    }
                }
            }
        });
    }
</script>
   
    <script type="text/javascript">
        
        $(document).ready(function () {
            $('[id*=lnksave]').on("click", function () {
                var validator = $('[id*=defaultForm]').data('bootstrapValidator');
                validator.validate();
                return validator.isValid();
            });
            ValidateForm();
        });

        function ValidateForm() {
            $('[id*=defaultForm]').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    <%= txtopnorequest.UniqueID %>: {
                        message: 'The opno is empty',
                        validators: {
                            notEmpty: {
                                message: 'The Operator No. is required and can\'t be empty'
                            },
                            numeric: {
                                message: 'The Operator No. must be a number'
                            },
                            stringLength: {
                                min: 6,
                                max: 6,
                                message: 'The Operator No. must be more than 6 and less than 6 characters long'
                            }
                        }
                    },
                    
                    <%= txtopnosectmgr.UniqueID %>: {
                        message: 'The Sect.Mgr name is empty',
                        validators: {
                           numeric: {
                                message: 'Sect.Mgr Operator No. must be a number'
                            },
                            stringLength: {
                                min: 6,
                                max: 6,
                                message: 'Sect.Mgr Operator No. must be more than 6 and less than 6 characters long'
                            }
                        }
                    },
                    <%= tbemailsectmgr.UniqueID %>: {
                        message: 'The Sect.Mgr name is empty',
                        validators: {
                            emailAddress: {
                                message: 'The input is not a valid email address'
                            }
                        }
                    },
                    <%= txtopnodeptmgr.UniqueID %>: {
                        message: 'The Dept.Mgr name is empty',
                        validators: {
                           numeric: {
                                message: 'Dept.Mgr Operator No. must be a number'
                            },
                            stringLength: {
                                min: 6,
                                max: 6,
                                message: 'Dept.Mgr Operator No. must be more than 6 and less than 6 characters long'
                            }
                        }
                    },
                    <%= tbemaildeptmgr.UniqueID %>: {
                        message: 'The Dept.Mgr name is empty',
                        validators: {
                            emailAddress: {
                                message: 'The input is not a valid email address'
                            }
                        }
                    },
                    <%= txtopnodivmgr.UniqueID %>: {
                        message: 'The Div.Mgr name is empty',
                        validators: {
                            stringLength: {
                                min: 6,
                                max: 6,
                                message: 'Div.Mgr Operator No. must be more than 6 and less than 6 characters long'
                            }
                        }
                    },
                    <%= tbemaildivmgr.UniqueID %>: {
                        message: 'The Div.Mgr name is empty',
                        validators: {
                           emailAddress: {
                                message: 'The input is not a valid email address'
                            }
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
            <p class="text-danger">Admin Management Flow Approve</p>  
            <span class="text-info">You can edit delete flow for approve step </span>  
            <hr/>
            <a class="btn btn-primary" href="#" id="showModalsetflow"><span class="fa fa-share"></span> Create</a>
        </div> 
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <asp:GridView ID="gvflow" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" runat="server" OnDataBound="gvflow_DataBound"  EmptyDataText="There are no data records to display.">
                        <Columns>
                            <asp:HyperLinkField DataTextField="REQUEST_OP" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/AdminSetFlow.aspx?ID={0}" ItemStyle-CssClass="text-center"
                            HeaderText="REQUEST NO." HeaderStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="SECT_MGR_OP" HeaderText="Sect.Mgr." HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="SECT_MGR_EMAIL" HeaderText="Email Sect.Mgr." HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="DEPT_MGR_OP" HeaderText="Dept.Mgr." HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="DEPT_MGR_EMAIL" HeaderText="Email Dept.Mgr." HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="DIV_MGR_OP" HeaderText="Div.Mgr." HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="DIV_MGR_EMAIL" HeaderText="Email Div.Mgr." HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="RATING" HeaderText="Order" HeaderStyle-CssClass="text-center" />
                            <asp:BoundField DataField="CREATE_DATE" HeaderText="Create" DataFormatString="{0:dd/M/yyyy}" HeaderStyle-CssClass="text-center" />

                        </Columns>
                        <HeaderStyle CssClass="text-center text-nowrap font800"></HeaderStyle>
                        
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <%--rmodal setflow--%>
    <div id="modalsetflow" class="modal">
        <div class="modal-dialog animated">
            <div class="modal-content">
                <form class="form-horizontal" method="get">
                    <div class="modal-header">
                        <strong> 
                            <asp:Label ID="lbmodalhead" runat="server" CssClass="font800" Text="Create"></asp:Label> Flow for approve
                        </strong>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-offset-4 col-md-4">
                                <div class='form-group'>
                                    <label class="font800">Request.</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input id="txtopnorequest" type="text" name="operatorno" class="form-control" placeholder="Enter your Operator No." maxlength="6" runat="server" /> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-offset-4 col-md-4 text-center">
                                <i class="fa fa-angle-down fa-2x" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class='form-group'>
                                    <label class="font800">Sect.Mgr.</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input id="txtopnosectmgr" type="text" name="opnosectmgr" class="form-control" placeholder="Opno Sect.Mgr" runat="server"/>
                                        
                                    </div>

                                </div> 
                                <div class='form-group'>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input id="tbemailsectmgr" type="text" name="emailsectmgr" class="form-control" placeholder="Email Sect.Mgr" runat="server" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class='form-group'>
                                    <label class="font800">Dept.Mgr.</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input id="txtopnodeptmgr" type="text" name="opnodeptmgr" class="form-control" placeholder="Opno Dept.Mgr" runat="server" />
                                    </div>
                                </div>
                                <div class='form-group'>
                                   <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input id="tbemaildeptmgr" type="text" name="emaildeptmgr" class="form-control" placeholder="Email Dept.Mgr" runat="server" disabled/>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class='form-group'>
                                    <label class="font800">Div.Mgr.</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input id="txtopnodivmgr" type="text" name="opnodivmgr" class="form-control" placeholder="Opno Div.Mgr" runat="server" />
                                    </div>
                                </div>
                                <div class='form-group'>
                                   <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input id="tbemaildivmgr" type="text" name="emaildivmgr" class="form-control" placeholder="Email Div.Mgr" runat="server" disabled/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 text-center">
                                <asp:Label ID="lbmsgmodalsect" runat="server" Text=""></asp:Label>
                                
                            </div>
                            <div class="col-md-4 text-center">
                                <asp:Label ID="lbmsgmodaldept" runat="server" Text=""></asp:Label>
                                
                            </div>
                            <div class="col-md-4 text-center">
                                <asp:Label ID="lbmsgmodaldiv" runat="server" Text=""></asp:Label>
                                
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-default" type="button" id="btnsetflowclose" onclick="clearMyField();"> Cancel</button>
                        <asp:LinkButton ID="lnksave" runat="server" CssClass="btn btn-primary" OnClick="Callfunction"  Text="SAVE"></asp:LinkButton>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
