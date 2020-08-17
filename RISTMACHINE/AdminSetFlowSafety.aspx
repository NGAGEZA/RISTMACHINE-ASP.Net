<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="AdminSetFlowSafety.aspx.vb" Inherits="RISTMACHINE.AdminSetFlowSafety" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script src="Scripts/quicksearch.js"></script>

    <link href="Content/rmodal.css" rel="stylesheet" />
    <script src="Scripts/rmodal.js"></script>
    <link href="Content/animate.css" rel="stylesheet" />

    
    <script src="Scripts/modalsetflowsafety.js"></script>
    
    <script type="text/javascript">
        function openModaledit() {
            var modalsetflowsafetyedit = new RModal(document.getElementById('modalsetflowsafety'), {

            });
            modalsetflowsafetyedit.open();

        }
    </script>
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
            if(document.getElementById('<%= txtopnosubcom.ClientID %>').value !== '') {
                document.getElementById('<%= txtopnosubcom.ClientID %>').value = '';
            }
            if(document.getElementById('<%= tbemailsubcom.ClientID %>').value !== '') {
                document.getElementById('<%= tbemailsubcom.ClientID %>').value = '';
            }
            if(document.getElementById('<%= txtopnosfofficer.ClientID %>').value !== '') {
                document.getElementById('<%= txtopnosfofficer.ClientID %>').value = '';
            }
            if(document.getElementById('<%= tbemailsfofficer.ClientID %>').value !== '') {
                document.getElementById('<%= tbemailsfofficer.ClientID %>').value = '';
            }
            if(document.getElementById('<%= txtopnosfmgr.ClientID %>').value !== '') {
                document.getElementById('<%= txtopnosfmgr.ClientID %>').value = '';
            }
            if(document.getElementById('<%= tbemailsfmgr.ClientID %>').value !== '') {
                document.getElementById('<%= tbemailsfmgr.ClientID %>').value = '';
            }
                       
            window.location.href="AdminSetFlowSafety.aspx";
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
                            window.location.href="AdminSetFlowSafety.aspx";
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
                    <%= txtopnosubcom.UniqueID %>: {
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
                    
                    <%= txtopnosfofficer.UniqueID %>: {
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
                    <%= txtopnosfmgr.UniqueID %>: {
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
                                       

                }
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="jumbotron">  
            <p class="text-danger">Admin Management Flow Approve Safety</p>  
            <span class="text-info">You can edit delete flow for approve step </span>  
            <hr/>
            <a class="btn btn-primary" href="#" id="showModalsetflowsafety"><span class="fa fa-share"></span> Create</a>
        </div> 
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <asp:GridView ID="gvflow" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" runat="server" OnDataBound="gvflow_DataBound"  EmptyDataText="There are no data records to display.">
                        <Columns>
                            
                            <asp:BoundField DataField="MCESUBCOM_OP" HeaderText="MC Sub-Com" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="MCESUBCOM_EMAIL" HeaderText="MC Sub-Com Email" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="SAFETYOFF_OP" HeaderText="Safety Officer" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="SAFETYOFF_EMAIL" HeaderText="Safety Officer Email" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="SAFETYMGR_OP" HeaderText="Safety Mgr." HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="SAFETYMGR_EMAIL" HeaderText="Safety Mgr.Email" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="CREATE_DATE" HeaderText="Create" DataFormatString="{0:dd/M/yyyy}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:HyperLinkField ControlStyle-CssClass="fa fa-pencil-square-o" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="~/AdminSetFlowSafety.aspx?ID={0}" ItemStyle-CssClass="text-center"
                            HeaderText="Action" HeaderStyle-CssClass="text-center"/>
                        </Columns>
                        <HeaderStyle CssClass="text-center text-nowrap font800"></HeaderStyle>
                        
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <%--rmodal setflow safety--%>
    <div id="modalsetflowsafety" class="modal">
        <div class="modal-dialog animated">
            <div class="modal-content">
                <form class="form-horizontal" method="get">
                    <div class="modal-header">
                        <strong> 
                            <asp:Label ID="lbmodalhead" runat="server" CssClass="font800" Text="Create"></asp:Label> Flow for approve Safety
                        </strong>
                    </div>

                    <div class="modal-body">
                       
                        <div class="row">
                            <div class="col-md-4">
                                <div class='form-group'>
                                    <label class="font800">Machine & Equipment Sub-Com.</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input id="txtopnosubcom" type="text" name="opnosubcom" class="form-control" placeholder="Opno Sub-Com." runat="server"/>
                                        
                                    </div>

                                </div> 
                                <div class='form-group'>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input id="tbemailsubcom" type="text" name="emailseubcom" class="form-control" placeholder="Email Sub-Com" runat="server" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class='form-group'>
                                    <label class="font800">Safety Officer</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input id="txtopnosfofficer" type="text" name="opnosfofficer" class="form-control" placeholder="Opno Safety Officer" runat="server" />
                                    </div>
                                </div>
                                <div class='form-group'>
                                   <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input id="tbemailsfofficer" type="text" name="emailsfofficer" class="form-control" placeholder="Email Safety Officer" runat="server" disabled/>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class='form-group'>
                                    <label class="font800">Safety Mgr.</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                        <input id="txtopnosfmgr" type="text" name="opnosfmgr" class="form-control" placeholder="Opno Safety Mgr" runat="server" />
                                    </div>
                                </div>
                                <div class='form-group'>
                                   <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                        <input id="tbemailsfmgr" type="text" name="emailsfmgr" class="form-control" placeholder="Email Safety Mgr" runat="server" disabled/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 text-center">
                                <asp:Label ID="lbmsgmodalsubcom" runat="server" Text=""></asp:Label>
                                
                            </div>
                            <div class="col-md-4 text-center">
                                <asp:Label ID="lbmsgmodalsfofficer" runat="server" Text=""></asp:Label>
                                
                            </div>
                            <div class="col-md-4 text-center">
                                <asp:Label ID="lbmsgmodalsfmgr" runat="server" Text=""></asp:Label>
                                
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-default" type="button" id="btnsetflowsafetyclose" onclick="clearMyField();"> Cancel</button>
                        <asp:LinkButton ID="lnksave" runat="server" CssClass="btn btn-primary" Text="SAVE" OnClick="Callfunction"></asp:LinkButton>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
