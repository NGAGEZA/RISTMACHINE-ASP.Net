<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="WebForm3.aspx.vb" Inherits="RISTMACHINE.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function call_me()
        {

            var Temp= confirm("Hit from ClientSide");
            debugger 
            if(Temp)
            {
                alert("True");
                __doPostBack('btnHdn','onserverclick');
            }
            else
            {
                alert("false");
            }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
         <input type="hidden" runat="server" id="btnHdn" OnServerClick="Call_Server" />
         <input type="button" runat="server" onclick="call_me();" id="btnClick" value="PRESS" />
        </div>

    <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        
</asp:Content>
