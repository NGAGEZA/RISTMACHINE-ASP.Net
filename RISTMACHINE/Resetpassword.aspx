<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="Resetpassword.aspx.vb" Inherits="RISTMACHINE.Resetpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/particles.js"></script>


    <script>
        function setFocusLoginPage(){
            document.getElementById("txtyouremail").focus();
        }
    </script>
    <script type="text/javascript">
        window.onload = function () 
        {
            setFocusLoginPage();
        }
    </script>
    
    <script type="text/javascript">
        
        $(document).ready(function () {
            $('[id*=btnresetpass]').on("click", function () {
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
                    youremail: {
                        validators: {
                            notEmpty: {
                                message: 'The email address is required and can\'t be empty'
                            },
                            emailAddress: {
                                message: 'The input is not a valid email address'
                            }
                        }
                    }
                }
            });
        }


    </script>
    <script type="text/javascript">
        function RecoverypasswordComplete() {
            bootbox.dialog({
                message: "Password has been sent to your email address.",
                title: 'RIST MACHINE SYSTEM ONLINE',
                buttons: {
                    danger: {
                        label: 'ok',
                        className: "btn-success",
                        callback: function () {
                            setTimeout(function () {
                                //txtemail.focus();
                                window.location.href="Login.aspx";
                            }, 10);
                        }
                    }
                }
            });
        }

        function RecoverypasswordNotComplete() {
            bootbox.dialog({
                message: "This email address does not match our records.",
                title: 'RIST MACHINE SYSTEM ONLINE',
                buttons: {
                    danger: {
                        label: 'ok',
                        className: "btn-danger",
                        callback: function () {
                            setTimeout(function () {
                                //txtemail.focus();
                                window.location.href="Resetpassword.aspx";
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
         
        <div id="loginbox" class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="panel-heading">
                        <div class="panel-title text-center">
                            <h1 class="fonttitle">Reset Password</h1>
                            <hr />
                        </div>
                    </div> 
                    <div class="form-group">
                        <label class="font800">Your Email</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                            <input id="txtyouremail" type="text" name="youremail"  class="form-control" placeholder="Enter your Email" />
                        </div>
                        <small class="text-muted">To reset your password, submit your email address</small>
                    </div>

                    <div class="form-group ">
                        <asp:LinkButton ID="btnresetpass" runat="server" CssClass="btn btn-primary btn-lg btn-block login-button font800" OnClick="SendEmail">Reset password</asp:LinkButton>
                    </div>
                    <div class="login-register">
                        <a href="Login.aspx" class="font800">Login</a>
                    </div>
                </div>
            </div> 
            

        </div>
    </div>
    <div id="particles"></div>
</asp:Content>
