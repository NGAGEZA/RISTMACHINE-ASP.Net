<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="Login.aspx.vb" Inherits="RISTMACHINE.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
  
    <script type="text/javascript">
        
        $(document).ready(function () {
            $('[id*=btnlogin]').on("click", function () {
                const validator = $('[id*=defaultForm]').data('bootstrapValidator');
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
                    operatorno: {
                        message: 'The username is not valid',
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
                    yourpassword: {
                        message: 'The password is not valid',
                        validators: {
                            notEmpty: {
                                message: 'The password is required'
                            },
                            blank: {}
                        }
                    }

                }
            });
        }


    </script>
    <script type="text/javascript">
        function LoginNotComplete() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-times fa-3x text-danger'></i><br/>User Or Password Missing.</h4>",
                title: "<h3 class='text-center'>RIST MACHINE SYSTEM ONLINE</h3>",
                buttons: {
                    danger: {
                        label: 'Close',
                        className: "btn-danger",
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
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            //debugger;
            $('[id*=txtpassword]').keyup(function (event) {
                if (event.keyCode === 13) {
                    $('[id*=btnlogin]').click();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
    <script src="Scripts/particles.js"></script>
    
    <div class="container" >
        
        <div id="loginbox" class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">
            <div class="panel panel-default">
                <div class="panel-body">
                   
                    <div class="panel-heading">
                        <div class="panel-title text-center">
                            <h1 class="fonttitle">Login</h1>
                            <hr />
                            
                        </div>
                    </div> 
           
                    <div class='form-group'>
                        <label class="font800">Operator No.</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <input id="txtopno" type="text" name="operatorno" class="form-control" tabindex="1" placeholder="Enter your Operator No." maxlength="6" />
                            </div>
                    </div>

                    <div class='form-group'>
                        <label class="font800">Password</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <input id="txtpassword" type="password"  name="yourpassword" class="form-control" tabindex="2" placeholder="Enter your Password"/>
                            </div>
                    </div>

                    <div class="form-group ">
                       
                        <asp:LinkButton ID="btnlogin" runat="server" CssClass="btn btn-primary btn-lg btn-block login-button font800" TabIndex="-1" OnClick="Validate_User">Sign in</asp:LinkButton>
                       
                        </div>

                    <div class="login-register">
                        <a href="Register.aspx" class="font800">Create account</a> or <a href="Resetpassword.aspx" class="font800">reset password</a>
                    </div>
                    
                </div>
            </div>
         </div>
       
        </div>
   
    <div id="particles"></div>

</asp:Content>
