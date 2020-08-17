<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="CheckStatus.aspx.vb" Inherits="RISTMACHINE.CheckStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery.progressbar.js"></script>
    <link href="Content/jquery.progressbar.css" rel="stylesheet" />
   
    
    
<script type="text/javascript">
       
      
    jQuery(document).ready(function ($) {
        // ~: failed
        // @: current
        var gettextbox = document.getElementById('<%=TextBox1.ClientID%>').value;
        //show alert value textbox 
        //alert(gettextbox);
        switch (gettextbox) {
            //1
        case "@Requested":
            $('#steps').progressbar({
                steps: [gettextbox, 'Sect.Mgr Approved', 'Dept.Mgr Approved', 'Div.Mgr Approved','Sub-Com Approved','Safety Officer Approved','Safety Mgr Approved']
            });
                break;
            //2
        case "@Sect.Mgr Approved":
            $('#steps').progressbar({
                steps: ['Requested', gettextbox, 'Dept.Mgr Approved', 'Div.Mgr Approved','Sub-Com Approved','Safety Officer Approved','Safety Mgr Approved']
            });
                break;
            //3
        case "@Dept.Mgr Approved":
            $('#steps').progressbar({
                steps: ['Requested', 'Sect.Mgr Approved', gettextbox, 'Div.Mgr Approved','Sub-Com Approved','Safety Officer Approved','Safety Mgr Approved']
            });
                break;
            //4
        case "@Div.Mgr Approved":
            $('#steps').progressbar({
                steps: ['Requested', 'Sect.Mgr Approved', 'Dept.Mgr Approved', gettextbox,'Sub-Com Approved','Safety Officer Approved','Safety Mgr Approved']
            });
                break;
            //5
        case "@Sub-Com Approved":
            $('#steps').progressbar({
                steps: ['Requested', 'Sect.Mgr Approved', 'Dept.Mgr Approved', 'Div.Mgr Approved',gettextbox,'Safety Officer Approved','Safety Mgr Approved']
            });
                break;
            //6
        case "@Safety Officer Approved":
            $('#steps').progressbar({
                steps: ['Requested', 'Sect.Mgr Approved', 'Dept.Mgr Approved', 'Div.Mgr Approved','Sub-Com Approved',gettextbox,'Safety Mgr Approved']
            });
                break;
            //7
        case "@Safety Mgr Approved":
            $('#steps').progressbar({
                steps: ['Requested', 'Sect.Mgr Approved', 'Dept.Mgr Approved', 'Div.Mgr Approved','Sub-Com Approved','Safety Officer Approved',gettextbox]
            });
            break;
                 
             
        }
            
    });
    </script>
    </asp:Content>
        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row wellz">
    
            <div class="col-md-8">
                <h4 class="text-left font800">View Progress Machine No. </h4>
            </div>
            <div class="col-md-4">
                <h4 class="text-right font800 text-danger"><asp:Label ID="lbmcno" runat="server" CssClass="label label-success" Text=""></asp:Label></h4>
                <%--<p class="text-right font800"><asp:Label ID="lbstatus" runat="server" CssClass="text-danger" Text=""></asp:Label></p>--%>
            </div>
    
        </div>

       
       <div>
           <div id="steps"></div>
           <div style="display: none">
               <asp:TextBox ID="TextBox1" runat="server" Text=""></asp:TextBox>
           </div>
          
           
        </div>
          
        

    </div>
</asp:Content>
