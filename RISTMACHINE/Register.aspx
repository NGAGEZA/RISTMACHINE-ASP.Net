<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="Register.aspx.vb" Inherits="RISTMACHINE.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/particles.js"></script>

    
    <script>
        function setFocusLoginPage(){
            document.getElementById("txtopno").focus();
        }
    </script>
    <script type="text/javascript">
        window.onload = function () 
        {
            setFocusLoginPage();
        }
    </script>
    
<%--    <script type="text/javascript">
        function teste() { bootbox.alert("Hello world!", function () { }); }
    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[id*=btnregis]').on("click", function () {
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
                    yourname: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: 'The username is required and can\'t be empty'
                            },
                            stringLength: {
                                min: 2,
                                max: 30,
                                message: 'The username must be more than 2 and less than 30 characters long'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: 'The username can only consist of alphabetical, number, dot and underscore'
                            },
                            different: {
                                field: 'password',
                                message: 'The username and password can\'t be the same as each other'
                            }
                        }
                    },
                    youremail: {
                        validators: {
                            notEmpty: {
                                message: 'The email address is required and can\'t be empty'
                            },
                            emailAddress: {
                                message: 'The input is not a valid email address'
                            }
                        }
                    },
                    yourpassword: {
                        validators: {
                            notEmpty: {
                                message: 'The password is required and can\'t be empty'
                            },
                            identical: {
                                field: 'confirmPassword',
                                message: 'The password and its confirm are not the same'
                            },
                            different: {
                                field: 'username',
                                message: 'The password can\'t be the same as username'
                            }
                        }
                    },
                    confirmPassword: {
                        validators: {
                            notEmpty: {
                                message: 'The confirm password is required and can\'t be empty'
                            },
                            identical: {
                                field: 'yourpassword',
                                message: 'The password and its confirm are not the same'
                            },
                            different: {
                                field: 'username',
                                message: 'The password can\'t be the same as username'
                            }
                        }
                    }

                }
            });
        }
    </script>
    <script type="text/javascript">
        function RegisterComplete() {
            bootbox.dialog({
                message: "Register Complete",
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
        //alert focus textbox
        function alertexistsopno() {
            var txtopno = document.getElementById('txtopno');
            bootbox.dialog({
                message: "opno exists.",
                title: 'RIST MACHINE SYSTEM ONLINE',
                buttons: {
                    danger: {
                        label: 'ok',
                        className: "btn-danger",
                        callback: function () {
                            setTimeout(function () {
                                txtopno.focus();
                            }, 10);
                        }
                    }
                }
            });
        }

        function alertexistsemail() {
            var txtemail = document.getElementById('txtyouremail');
            bootbox.dialog({
                message: "Email exists.",
                title: 'RIST MACHINE SYSTEM ONLINE',
                buttons: {
                    danger: {
                        label: 'ok',
                        className: "btn-danger",
                        callback: function () {
                            setTimeout(function () {
                                txtemail.focus();
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
                    <h1 class="fonttitle">Register</h1>
                    <hr />
                </div>
            </div> 
            <div class="form-group">
                <label class="font800">Your Operator No.</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input id="txtopno" type="text" name="operatorno" class="form-control" placeholder="Enter your Operator No." />
                    
                </div>
            </div>
            <div class="form-group">
                <label class="font800">Your Name</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <input id="txtyourname" type="text" name="yourname" class="form-control" placeholder="Enter your Name" />
                </div>
            </div>

            <div class="form-group">
                <label class="font800">Your Email</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                    <input id="txtyouremail" type="text" name="youremail" class="form-control" placeholder="Enter your Email" />
                    
                </div>
            </div>

            <div class="form-group">
                <label class="font800">Your Password</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <input id="txtyourpassword" type="password" name="yourpassword" class="form-control" placeholder="Enter your Password" />
                </div>
            </div>

            <div class="form-group">
                <label class="font800">Confirm Password</label>
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <input id="txtconfirmpassword" type="password" name="confirmPassword"  class="form-control" placeholder="Enter your Password" />
                </div>
            </div>

            <div class="form-group">
                <asp:LinkButton ID="btnregis" runat="server" CssClass="btn btn-primary btn-lg btn-block login-button font800" OnClick="Insert">Register</asp:LinkButton>
                <%--<asp:LinkButton ID="btnregister" runat="server" CssClass="btn btn-primary btn-lg btn-block login-button">Register</asp:LinkButton>--%>
                <%--<button type="button" class="btn btn-info" id="validateBtn">Manual validate</button>--%>
                <%--<input id="btnregisterx"  runat="server" class="button right"  OnServerClick="Insert" type="button" value="Update" />--%>
                <%--<asp:Button ID="btnregister" runat="server" Text="Register" CssClass="btn btn-primary btn-lg btn-block login-button font800" OnClick="Insert"    />--%>
                <%--<button type="submit" runat="server" id="btnregister" class="btn btn-primary btn-lg btn-block login-button font800" >Register</button>--%>
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
