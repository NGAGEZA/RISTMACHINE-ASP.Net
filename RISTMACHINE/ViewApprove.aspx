<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="ViewApprove.aspx.vb" Inherits="RISTMACHINE.ViewApprove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        // Popup window code
        function newPopup(url) {
            const popupWindow = window.open(
                url,'popUpWindow','height=500,width=600,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes');
        }
        function callapprove() {
            document.getElementById("btnSample").click();
        }
        function mgrapprove() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-check fa-3x text-success'></i><br/>Approve OK</h4>",
                title: "<h3 class='text-center'>RIST MACHINE SYSTEM ONLINE</h3>",
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

        function noapprove() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-check fa-3x text-success'></i><br/>No Data Approve.</h4>",
                title: "<h3 class='text-center'>RIST MACHINE SYSTEM ONLINE</h3>",
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
    <div class="container">
        <div class="row wellz">
        
            <div class="col-md-8">
                <h4 class="text-left font800">View and Approve Machine</h4>
            </div>
           
        </div>
    <div class="row">
        <div class="table-responsive">
            <asp:Literal ID = "ltTable" runat = "server" />
        </div>
        <div class="text-center">
            <asp:Label ID="lbmsg" runat="server" CssClass="font800" Text=""></asp:Label>
        </div>
    </div>
        <asp:Button runat="server" ID="btnSample" ClientIDMode="Static" Text="" style="display:none;" OnClick="CallfunctionApprove" />
        <%--Start-Gridview for show on send email--%>
        <div class="row" style="display:none">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <asp:GridView ID="gvmailapprove" Width="100%"  AutoGenerateColumns="False" runat="server" 
                                  BackColor="LightSlateGray"
                                  ForeColor="AliceBlue"
                                  BorderColor="LightYellow">
                        <Columns>
                            <asp:BoundField DataField="MC_NO" HeaderText="MC No."  HeaderStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="REGISTER_DATE" HeaderText="REGISTER_DATE" DataFormatString="{0:dd/M/yyyy}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="MAKER" HeaderText="MAKER"  HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="SUPPLIER" HeaderText="SUPPLIER" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="PROVIDER" HeaderText="PROVIDER" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="TEL" HeaderText="TEL" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="TYPE_MC" HeaderText="TYPE MC" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="DIVISION" HeaderText="DIVISION" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="DEPARTMENT" HeaderText="DEPARTMENT" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="SECTION" HeaderText="SECTION" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="STATUS_NAME" HeaderText="STATUS" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                            
                        </Columns>
                        <HeaderStyle BackColor="DarkSeaGreen" ForeColor="Gainsboro" />
                        <AlternatingRowStyle BackColor="SlateGray" CssClass="gvfont"/>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <%--End-Gridview for show on send email--%>

    </div>
</asp:Content>
