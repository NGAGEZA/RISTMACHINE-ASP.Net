<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="WebFormModal.aspx.vb" Inherits="RISTMACHINE.WebFormModal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h1>Bootstrap 4x multiple modals in one page</h1>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg1">Large modal1</button>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal1">1</button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal2">2</button>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="myLargeModalLabel">Large modal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body" id="b1">
                <!-- The form is placed inside the body of modal -->
                <form id="PrintForm2" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">MC No.</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="smcno" id="smcno" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-5 col-sm-offset-3">
                            <button type="submit" class="btn btn-default" id="btnedit">Print</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-lg1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title" id="myLargeModalLabel">Large modal1</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body" id="b2">
                <!-- The form is placed inside the body of modal -->
                <form id="PrintForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">MC No.</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="pmcno" id="pmcno" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-5 col-sm-offset-3">
                            <button type="submit" class="btn btn-default" id="btnprint">Print</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    
    <%-- Edit Modal--%>
        <%--<button class="btn btn-default" data-toggle="modal" data-target="#EditModal">Login</button>--%>
        <div class="modal fade" id="modal1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Print1 your MC No.</h4>
                    </div>

                    <div class="modal-body">
                        <form id="PrintForm1" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">MC No.</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="smcno1" id="smcno1" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <button type="submit" class="btn btn-default" id="btnedit">Print</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
       
        <%-- Print Modal--%>
        <div class="modal fade" id="modal2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Print2 your MC No.</h4>
                    </div>

                    <div class="modal-body">
                        <form id="PrintForm2" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">MC No.</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="smcno2" id="smcno2" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <button type="submit" class="btn btn-default" id="btnedit">Print</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>
