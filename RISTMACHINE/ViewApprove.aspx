<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="ViewApprove.aspx.vb" Inherits="RISTMACHINE.ViewApprove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row wellz">
        
            <div class="col-md-8">
                <h4 class="text-left font800">View and Approve Machine</h4>
            </div>
           
        </div>
        
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <asp:GridView ID="gviewapprove" Width="100%"  AutoGenerateColumns="False" runat="server" 
                                  Font-
                                  BackColor="LightSlateGray"
                                  ForeColor="AliceBlue"
                                  BorderColor="LightYellow">
                        <Columns>
                            <asp:BoundField DataField="MC_NO" HeaderText="MC No." ItemStyle-CssClass="text-center"  />
                            <asp:BoundField DataField="MAKER" HeaderText="MAKER" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" ItemStyle-CssClass="text-center" />
                            <asp:BoundField DataField="SUPPLIER" HeaderText="SUPPLIER" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="PROVIDER" HeaderText="PROVIDER" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="TEL" HeaderText="TEL" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="DIVISION" HeaderText="DIVISION" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="DEPARTMENT" HeaderText="DEPARTMENT" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="SECTION" HeaderText="SECTION" ItemStyle-CssClass="text-center"/>
                            <asp:BoundField DataField="REGISTER_DATE" DataFormatString="{0:dd/M/yyyy}" HeaderText="REGISTER_DATE" ItemStyle-CssClass="text-center"/>
                        </Columns>
                        <HeaderStyle BackColor="DarkSeaGreen" ForeColor="Gainsboro" />
                        <AlternatingRowStyle BackColor="SlateGray" CssClass="gvfont" />
                    </asp:GridView>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
