<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="Main.aspx.vb" Inherits="RISTMACHINE.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/particles.js"></script>
    <script src="Scripts/scriptbutton.js"></script>
    <%--send parameter for edit--%>
    <script type="text/javascript">
        $(function () {
            $("#btnpage2").bind("click",
                function() {
                    //debugger;
                    var e = document.getElementById(('<%= lbmcno.ClientID %>'));
                    var ep2Mcno = e.textContent;
                    var url = "EquipmentCheck.aspx?ep2mcno=" + ep2Mcno;
                    window.location.href = url;

                   
                });
        });
    
    </script>
    <script type="text/javascript">

        $(document).on('click',
            '.panel-heading span.clickable',
            function() {
                var $this = $(this);
                if (!$this.hasClass('panel-collapsed')) {
                    $this.parents('.panel').find('.panel-body').slideUp();
                    $this.addClass('panel-collapsed');
                    $this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
                } else {
                    $this.parents('.panel').find('.panel-body').slideDown();
                    $this.removeClass('panel-collapsed');
                    $this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
                }
            });
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
                    <%= tb_maker.UniqueID %>: {
                        message: 'The Maker name is empty',
                        validators: {
                            notEmpty: {
                                message: 'Maker field can\'t be empty'
                            }
                        }
                    },
                    <%= tb_country.UniqueID %>: {
                        message: 'The Country name is empty',
                        validators: {
                            notEmpty: {
                                message: 'Country field can\'t be empty'
                            }
                        }
                    },
                    <%= tb_supplier.UniqueID %>: {
                        message: 'The Supplier name is empty',
                        validators: {
                            notEmpty: {
                                message: 'Supplier field can\'t be empty'
                            }
                        }
                    },
                    <%= tb_provider.UniqueID %>: {
                        message: 'The Provider name is empty',
                        validators: {
                            notEmpty: {
                                message: 'Provider field can\'t be empty'
                            }
                        }
                    },
                    <%= tb_tel.UniqueID %>: {
                        message: 'The Telephone is empty',
                        validators: {
                            notEmpty: {
                                message: 'Telephone field can\'t be empty'
                            }
                        }
                    },
                    <%= tb_type_mc.UniqueID %>: {
                        message: 'The Type Machine is empty',
                        validators: {
                            notEmpty: {
                                message: 'Type Machine field can\'t be empty'
                            }
                        }
                    },
                    <%= tb_organize.UniqueID %>: {
                        message: 'The Organize is empty',
                        validators: {
                            notEmpty: {
                                message: 'Organize field can\'t be empty'
                            }
                        }
                    }
                    <%--<%= tb_name_mc.UniqueID %>: {
                        message: 'The Machine name is empty',
                        validators: {
                            notEmpty: {
                                message: 'Machine name field can\'t be empty'
                            }
                        }
                    },
                    <%= tb_mcno1.UniqueID %>: {
                        message: 'The mcno no 1. is empty',
                        validators: {
                            notEmpty: {
                                message: 'mcno 1 field can\'t be empty'
                            }
                        }
                    }--%>
                    

                }
            });
        }

    </script>
   
    <script>
       
        function setupFileUploadBox() {
            //setup file upload 
            $("#input-upload").fileinput({
                uploadUrl: "ReceieveFile.aspx",
                uploadAsync: true,
                showUpload: true,
                dropZoneEnabled: true,
                maxFileCount: 1,
                //mainClass: "input-group-lg",
                allowedFileExtensions: ["pdf"]
            });
        }

        function setupFileUploadBox2() {
            //setup file upload 
            $("#input-upload2").fileinput({
                uploadUrl: "ReceieveFile.aspx",
                uploadAsync: true,
                showUpload: true,
                dropZoneEnabled: true,
                maxFileCount: 1,
                //mainClass: "input-group-lg",
                allowedFileExtensions: ["jpg"]
            });
        }

    </script>
    
    <script type="text/javascript">
        function InsertComplete() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-check fa-3x text-success'></i><br/>Insert Data Complete</h4>",
                title: "<h3 class='text-center'>RIST MACHINE SYSTEM ONLINE</h3>",
                buttons: {
                    danger: {
                        label: 'OK',
                        className: "btn-success",
                        callback: function () {
                            setTimeout(function () {
                                //txtemail.focus();
                                // window.location.href="home.aspx";
                            }, 10);
                        }
                    }
                }
            });
        }

        function UpdateComplete() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-check fa-3x text-success'></i><br/>Update Data Complete</h4>",
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

        function alertnoflow() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-times fa-3x text-danger'></i><br/>Operator is not set flow please contact safety set flow",
                title: "<h3 class='text-center'>RIST MACHINE SYSTEM ONLINE</h3>",
                buttons: {
                    danger: {
                        label: 'back to home',
                        className: "btn-danger",
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


    </script>
<script type="text/javascript">

    $(document).ready(function(){
        $('[id*=tb_maker]').keyup(function(){
            $(this).val($(this).val().toUpperCase());
        });
    });

    $(document).ready(function(){
        $('[id*=tb_country]').keyup(function(){
            $(this).val($(this).val().toUpperCase());
        });
    });

    $(document).ready(function(){
        $('[id*=tb_supplier]').keyup(function(){
            $(this).val($(this).val().toUpperCase());
        });
    });


    $(function () {
        $('[id*=tb_maker]').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Autocomplete.aspx/GetMaker") %>',
                    data: "{ 'prefix': '" + request + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var items = [];
                        var map = {};
                        $.each(data.d, function (i, item) {
                            var id = item.split('-')[1];
                            var name = item.split('-')[0];
                            map[name] = { id: id, name: name };
                            items.push(name);
                        });
                        response(items);
                        $(".dropdown-menu").css("height", "auto");
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            }
                
        });
    });

    $(function () {
        $('[id*=tb_country]').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Autocomplete.aspx/GetCountry") %>',
                    data: "{ 'prefix': '" + request + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var items = [];
                        var map = {};
                        $.each(data.d, function (i, item) {
                            var id = item.split('-')[1];
                            var name = item.split('-')[0];
                            map[name] = { id: id, name: name };
                            items.push(name);
                        });
                        response(items);
                        $(".dropdown-menu").css("height", "auto");
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            }
                
        });
    });

    $(function () {
        $('[id*=tb_supplier]').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
            , source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Autocomplete.aspx/GetSupplier") %>',
                    data: "{ 'prefix': '" + request + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var items = [];
                        var map = {};
                        $.each(data.d, function (i, item) {
                            var id = item.split('-')[1];
                            var name = item.split('-')[0];
                            map[name] = { id: id, name: name };
                            items.push(name);
                        });
                        response(items);
                        $(".dropdown-menu").css("height", "auto");
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            }
                
        });
    });

    //$("#Chk1").checkbox({checked:true});
</script>


    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentplaceHolder1" runat="server">


            <script type="text/javascript">
               
                function EnableControl1() {
                    var txtBox = document.getElementById('<%= tb_category1_mc_other.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_category1_mc_other.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_category1_mc_other.ClientID %>').style.border = "";
                       
                    }
                }

                function EnableControl2() {
                    var txtBox = document.getElementById('<%= tb_category2_mc_other.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_category2_mc_other.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_category2_mc_other.ClientID %>').style.border = "";           
                    }
                }

                function EnableControl3() {
                    var txtBox = document.getElementById('<%= tb_legal_notice.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_legal_notice.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_legal_notice.ClientID %>').style.border = "";   
                       
                    }
                }
                function EnableControl4() {
                    var txtBox = document.getElementById('<%= tb_get_legal_approval.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_get_legal_approval.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_get_legal_approval.ClientID %>').style.border = "";
                       
                    }
                }
                function EnableControl5() {
                    var txtBox = document.getElementById('<%= tb_legal_investigation.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_legal_investigation.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_legal_investigation.ClientID %>').style.border = "";
                       
                    }
                }
                function EnableControl6() {
                    var txtBox = document.getElementById('<%= tb_substanceother_detail.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_substanceother.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_substanceother_detail.ClientID %>').style.border = "";
                       
                    }
                }
                function EnableControl7() {
                    var txtBox = document.getElementById('<%= tb_objotherdetail.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_objother.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_objotherdetail.ClientID %>').style.border = "";
                       
                    }
                }
                function EnableControl8() {
                    var txtBox = document.getElementById('<%= tb_equi_other_detail.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_equi_other.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_equi_other_detail.ClientID %>').style.border = "";
                       
                    }
                }

                function EnableControl9() {
                    var txtBox = document.getElementById('<%= tb_rawotherdetail.ClientID %>');
                    var checkbox = document.getElementById('<%= chk_rawother.ClientID %>');

                    if (checkbox.checked) {
                        txtBox.removeAttribute('disabled');
                        txtBox.focus();
                    } else {
                        txtBox.value = "";
                        txtBox.disabled = true;
                        document.getElementById('<%= tb_rawotherdetail.ClientID %>').style.border = "";

                    }
                }

                function EnableNamelaw36() {
                    var txtbox = document.getElementById('<%= tb_rawname.ClientID %>');
                    var chk36 = document.getElementById('<%= chk36.ClientID %>');
                    if (chk36.checked) {
                        txtbox.removeAttribute('disabled');
                        txtbox.focus();
                    } else {
                        txtbox.value = "";
                        txtbox.disabled = true;
                        txtbox.style.border = "";
                    }
                }

                function EnableNamelaw37() {
                    var txtbox = document.getElementById('<%= tb_rawname.ClientID %>');
                    var chk37 = document.getElementById('<%= chk37.ClientID %>');
                    if (chk37.checked) {
                        txtbox.removeAttribute('disabled');
                        txtbox.focus();
                    } else {
                        txtbox.value = "";
                        txtbox.disabled = true;
                        txtbox.style.border = "";
                    }
                }

                function EnableNamelaw38() {
                    var txtbox = document.getElementById('<%= tb_rawname.ClientID %>');
                    var chk38 = document.getElementById('<%= chk38.ClientID %>');
                    if (chk38.checked) {
                        txtbox.removeAttribute('disabled');
                        txtbox.focus();
                    } else {
                        txtbox.value = "";
                        txtbox.disabled = true;
                        txtbox.style.border = "";
                    }
                }

                function EnableNamelaw39() {
                    var txtbox = document.getElementById('<%= tb_rawname.ClientID %>');
                    var chk39 = document.getElementById('<%= chk39.ClientID %>');
                    if (chk39.checked) {
                        txtbox.removeAttribute('disabled');
                        txtbox.focus();
                    } else {
                        txtbox.value = "";
                        txtbox.disabled = true;
                        txtbox.style.border = "";
                    }
                }

                function EnableNamelaw40() {
                    var txtbox = document.getElementById('<%= tb_rawname.ClientID %>');
                    var chk40 = document.getElementById('<%= chk40.ClientID %>');
                    if (chk40.checked) {
                        txtbox.removeAttribute('disabled');
                        txtbox.focus();
                    } else {
                        txtbox.value = "";
                        txtbox.disabled = true;
                        txtbox.style.border = "";
                    }
                }

                function EnableNamelaw41() {
                    var txtbox = document.getElementById('<%= tb_rawname.ClientID %>');
                    var chk41 = document.getElementById('<%= chk41.ClientID %>');
                    if (chk41.checked) {
                        txtbox.removeAttribute('disabled');
                        txtbox.focus();
                    } else {
                        txtbox.value = "";
                        txtbox.disabled = true;
                        txtbox.style.border = "";
                    }
                }

                function EnableNamelaw42() {
                    var txtbox = document.getElementById('<%= tb_rawname.ClientID %>');
                    var chk42 = document.getElementById('<%= chk42.ClientID %>');
                    if (chk42.checked) {
                        txtbox.removeAttribute('disabled');
                        txtbox.focus();
                    } else {
                        txtbox.value = "";
                        txtbox.disabled = true;
                        txtbox.style.border = "";
                    }
                }

                // No alphabets for Emp No textbox
                function noAlphabets(event) {
                    var charCode = (event.which) ? event.which : event.keyCode;
                    if ((charCode >= 97) && (charCode <= 122) || (charCode >= 65) && (charCode <= 90))
                        return false;

                    return true;
                }

                function onlyNumbers(event) {
                    var charCode = (event.which) ? event.which : event.keyCode;
                    if (charCode > 31 && (charCode < 48 || charCode > 57))
                        return false;

                    return true;
                }

                function BlankCheck(ele) {
                    if (document.getElementById(ele.id).value === '') {
                        alert('Name can\'t be blank');
                    }
                }


      

            </script>

<div class="container">
<div class="row wellz">
    
    <div class="col-md-8">
        <h4 class="text-left font800">Machine & Equipment Register <i class="fa fa-registered"></i></h4>
    </div>
    <div class="col-md-4">
        <h4 class="text-right font800 text-danger"><asp:Label ID="lbmcno" runat="server" CssClass="label label-success" Text=""></asp:Label></h4>
        <p class="text-right font800"><asp:Label ID="lbstatus" runat="server" CssClass="text-danger" Text=""></asp:Label></p>
        <p class="text-right "><button class="btn btn-primary" type="button" id="btnpage2">Next page 2</button></p>
        
    </div>
    
</div>


<hr/>
  <div class='row fd_animate'>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">วัตถุประสงค์</h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
        </div>
        <div class="panel-body">
            <div class='col-md-3'>
                <div class="form-group">
                    <div class="checkbox checbox-switch switch-info ">
                        <label>
                            <input type="checkbox" class="obj_check" name="chk_regis_mc_new" id="chk1" runat="server" />                         
                            <span></span>
                            ขึ้นทะเบียนเครื่องจักรใหม่ 
                        </label>
                    </div>
                </div>
            </div>
                        
            <div class='col-md-3'>
                <div class="form-group">
                    <div class="checkbox checbox-switch switch-info ">
                        <label>
                            <input type="checkbox" class="obj_check" name="chk_cancel_mc" id="chk2" runat="server"/>
                            <span></span>
                            ยกเลิกการใช้เครื่องจักร 
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        
 <div class='row fd_animate'>
     <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">ประเภท</h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span> 
        </div>
        <div class="panel-body">
            <div class='col-md-3'>
                <div class="form-group">
                    <div class="checkbox checbox-switch switch-info">
                        <label>
                            <input type="checkbox" class="category1_check" name="chk_category1_mc_new" id="chk3" runat="server" />
                            
                            <span></span>
                            เครื่องจักรใหม่
                        </label>
                    </div>
                </div>
            </div>
                        
            <div class='col-md-3'>
                <div class="form-group">
                    <div class="checkbox checbox-switch switch-info">
                        <label>
                            <input type="checkbox" class="category1_check" name="chk_category1_mc_transfer" id="chk4" runat="server" />
                           
                            <span></span>
                            เครื่องจักร Transfer
                        </label>
                    </div>
                </div>
            </div>

            <div class='col-md-2'>
                <div class="form-group">
                    <div class="checkbox checbox-switch switch-info">
                        <label>
                            <input type="checkbox" class="category1_check" name="namechk_category1_mc_other" id="chk_category1_mc_other" onclick="EnableControl1();" runat="server" />
                           
                            <span></span>
                            เครื่องจักรอื่นๆ ระบุ
                        </label>
                    </div>
                </div>
            </div>
                    
            <div class="col-md-4">
                <div class="form-group">
                    <div class="textboxlinecheckbox">
                        <input id="tb_category1_mc_other" type="text" name="namecategory1_mc_other" class="form-control input-sm" placeholder="Detail" disabled runat="server"/>
                    </div>
                </div>
            </div>       
        </div>
    </div>
</div>
        
    <div class='row fd_animate'>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">ประเภท</h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>        
        </div>
        <div class="panel-body">
            <div class='col-md-3'>
                <div class="form-group">
                    <div class="checkbox checbox-switch switch-info">
                        <label>
                            <input type="checkbox" class="category2_check" name="chk_category2_mc_new_model" id="chk5" runat="server" />
                            
                            <span></span>
                            เครื่องจักร Model ใหม่
                        </label>
                    </div>
                </div>
            </div>
                        
            <div class='col-md-3'>
                <div class="form-group">
                    <div class="checkbox checbox-switch switch-info">
                        <label>
                            <input type="checkbox" class="category2_check" name="chk_category2_mc_original_model" id="chk6" runat="server" />
                            
                            <span></span>
                            เครื่องจักร Model เดิม
                        </label>
                    </div>
                </div>
            </div>

            <div class='col-md-2'>
                <div class="form-group">
                    <div class="checkbox checbox-switch switch-info">
                        <label>
                            <input type="checkbox" class="category2_check" name="namechk_category2_mc_other" id="chk_category2_mc_other" onclick="EnableControl2();" runat="server" />
                            
                            <span></span>
                            เครื่องจักรอื่นๆ ระบุ
                        </label>
                    </div>
                </div>
            </div>
                
            <div class="col-md-4">
                <div class="form-group">
                    <div class="textboxlinecheckbox">
                        <input id="tb_category2_mc_other" type="text" name="namecategory2_mc_other" class="form-control input-sm" placeholder="Detail" disabled runat="server"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--'///////////////////////////////////////////////////--%>
    <div class="row fd_animate">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Details Maker</h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
        </div>
        <div class="panel-body ">
            <div class="row">
                        
                <div class='col-md-4'>    
                    <div class='form-group'>
                        <label>ผู้ผลิต(Maker)</label>
                        <input id="tb_maker" type="text" name="tb_maker" class="form-control input-sm" placeholder="Maker" runat="server"/>
                    </div>
                </div>

                <div class='col-md-4'>    
                    <div class='form-group'>
                        <label>ประเทศ</label>
                        <input id="tb_country" type="text" name="tb_country" class="form-control input-sm" placeholder="Country" runat="server"/>
                    </div>
                </div>

                <div class='col-md-4'>    
                    <div class='form-group'>
                        <label>ผู้จัดจำหน่าย(Supplier)</label>
                        <input id="tb_supplier" type="text" name="tb_supplier" class="form-control input-sm" placeholder="Supplier" runat="server"/>
                    </div>
                </div>

            </div>
                    
            <div class="row">
                <div class='col-md-3'>    
                    <div class='form-group'>
                        <label>ผู้จัดทำ</label>
                        <input id="tb_provider" type="text" name="tb_provider" class="form-control input-sm" placeholder="Provider" runat="server"/>
                    </div>
                </div>

                <div class='col-md-3'>    
                    <div class='form-group'>
                        <label>เบอร์โทร</label>
                        <%--<input id="datepicker" type="text" class="form-control input-sm" />--%>
                        <input id="tb_tel" type="text" name="tb_tel" class="form-control input-sm" placeholder="Tel." onkeypress="return onlyNumbers(event)" runat="server"/>
                    </div>
                </div>

                <div class='col-md-3'>    
                    <div class='form-group'>
                        <label>ประเภทเครื่องจักร</label>
                        <input id="tb_type_mc" type="text" name="tb_type_mc" class="form-control input-sm" placeholder="Type Machine" runat="server"/>
                    </div>
                </div>

                <div class='col-md-3'>    
                    <div class='form-group'>
                        <label>ขนาดเครื่องจักร (แรงม้า/Watt)</label>
                        <input id="tb_size_hp_mc" type="text" name="tb_size_hp_mc" class="form-control input-sm" placeholder="Watt" runat="server"/>
                    </div>
                </div>

            </div>
                    
            <div class="row">
                <div class='col-md-6'>    
                    <div class='form-group'>
                        <label>หน่วยงาน/ฝ่าย/แผนก</label>
                        <input id="tb_organize" type="text" name="tb_organize" class="form-control input-sm" placeholder="Div/Dept/Sec"  runat="server" />
                    </div>
                </div>

                <div class='col-md-6'>    
                    <%--<div class='form-group'>
                        <label>ชื่อเครื่องจักร</label>
                        <input id="tb_name_mc" type="text" name="tb_name_mc" class="form-control input-sm" placeholder="Machine Name" runat="server"/>
                    </div>--%>
                </div>
                        
            </div>
                    
            <%--<div class="row">
                <div class='col-md-12'>    
                    <div class='form-group'>
                        <label>หมายเลขเครื่องจักร No.</label>
                    </div>
                    <div class='col-md-offset-1 col-md-2'>    
                        <div class='form-group text-center'>
                            <label>1</label>
                            <input id="tb_mcno1" type="text" name="tb_mcno1" class="form-control input-sm" placeholder="1" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-2'>    
                        <div class='form-group text-center'>
                            <label>2</label>
                            <input id="tb_mcno2" type="text" name="tb_mcno2" class="form-control input-sm" placeholder="2" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-2'>    
                        <div class='form-group text-center'>
                            <label>3</label>
                            <input id="tb_mcno3" type="text" name="tb_mcno3" class="form-control input-sm" placeholder="3" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-2'>    
                        <div class='form-group text-center'>
                            <label>4</label>
                            <input id="tb_mcno4" type="text" name="tb_mcno4" class="form-control input-sm" placeholder="4" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-2'>    
                        <div class='form-group text-center'>
                            <label>5</label>
                            <input id="tb_mcno5" type="text" name="tb_mcno5" class="form-control input-sm" placeholder="5" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-offset-1 col-md-2'>    
                        <div class='form-group text-center'>
                            <label>6</label>
                            <input id="tb_mcno6" type="text" name="tb_mcno6" class="form-control input-sm" placeholder="6" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-2'>    
                        <div class='form-group text-center'>
                            <label>7</label>
                            <input id="tb_mcno7" type="text" name="tb_mcno7" class="form-control input-sm" placeholder="7" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-2'>    
                        <div class='form-group text-center'>
                            <label>8</label>
                            <input id="tb_mcno8" type="text" name="tb_mcno8" class="form-control input-sm" placeholder="8" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-2'>    
                        <div class='form-group text-center'>
                            <label>9</label>
                            <input id="tb_mcno9" type="text" name="tb_mcno9" class="form-control input-sm" placeholder="9" runat="server"/>
                        </div>
                    </div>
                    <div class='col-md-2'>    
                        <div class='form-group text-center'>
                            <label>10</label>
                            <input id="tb_mcno10" type="text" name="tb_mcno10" class="form-control input-sm" placeholder="10" runat="server"/>
                        </div>
                    </div>
                </div>
                
            </div>--%>
                   
    
        </div>
    </div>
</div>
        
    <div class='row fd_animate'>
        <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">สารเคมีอันตราย</h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class='col-md-3'>
                          
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info">
                            <label>
                                <%--<asp:CheckBox ID="chk_danger_cheme_1" runat="server" />--%>
                                <input type="checkbox" name="chk_danger_cheme_1" id="chk7" runat="server" />
                                <span></span>
                                วัตถุอันตรายชนิดที่ 1
                            </label>
                        </div>
                    </div>
                </div>
                        
                <div class='col-md-3'>
                            
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info">
                            <label>
                                <input type="checkbox" name="chk_danger_cheme_2" id="chk8" runat="server" />
                                <span></span>
                                วัตถุอันตรายชนิดที่ 2
                            </label>
                        </div>
                    </div>
                </div>
                            
                <div class='col-md-3'>
                            
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info">
                            <label>
                                <input type="checkbox" name="chk_danger_cheme_3" id="chk9" runat="server" />
                                <span></span>
                                วัตถุอันตรายชนิดที่ 3
                            </label>
                        </div>
                    </div>
                </div>
                            
                <div class='col-md-3'>
                            
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info">
                            <label>
                                <input type="checkbox" name="chk_danger_cheme_4" id="chk10" runat="server" />
                                <span></span>
                                วัตถุอันตรายชนิดที่ 4
                            </label>
                        </div>
                    </div>
                </div>
            </div>
                        
            <div class="row">
                <div class='col-md-6'>    
                    <div class='form-group'>
                        <label>ชื่อสาร</label>
                        <input id="tb_cheme_daneger_name" type="text" name="tb_cheme_daneger_name" class="form-control input-sm" placeholder="Cheme name" runat="server"/>
                    </div>
                </div>
                            
                <div class='col-md-6'>    
                    <div class='form-group'>
                        <label>CAS No.</label>
                        <input id="tb_casno" type="text" name="tb_casno" class="form-control input-sm" placeholder="CAS No." runat="server"/>
                    </div>
                </div>
                            
            </div>
                        
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info">
                            <label>
                                <input type="checkbox" name="chk_flammable" id="chk11" runat="server" />
                                <span></span>
                                สารไวไฟ
                            </label>
                        </div>
                    </div>
                </div>
                            
                <div class="col-md-2">
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info">
                            <label>
                                <input type="checkbox" name="chk_corrosive" id="chk12" runat="server" />
                                <span></span>
                                สารกัดกร่อน
                            </label>
                        </div>
                    </div>
                </div>
                            
                <div class="col-md-2">
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info">
                            <label>
                                <input type="checkbox" name="chk_poison" id="chk13" runat="server" />
                                <span></span>
                                สารพิษ
                            </label>
                        </div>
                    </div>
                </div>
                            
                <div class="col-md-2">
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info">
                            <label>
                                <input type="checkbox" name="chk_gas" id="chk14" runat="server" />
                                <span></span>
                                ก๊าซ
                            </label>
                        </div>
                    </div>
                </div>
                            
                <div class="col-md-1">
                    <div class="form-group">
                        <div class="checkbox checbox-switch switch-info text-nowrap">
                            <label>
                                <input type="checkbox" class="substanceother_check" name="chkname_substanceother" id="chk_substanceother" onclick="EnableControl6();" runat="server" />
                                <span></span>
                                อื่นๆ
                            </label>                
                        </div>
                       
                    </div>
                </div>
                
                
                <div class="col-md-3">
                    <div class="form-group">
                        <div class="textboxlinecheckbox">
                            <input id="tb_substanceother_detail" type="text" name="namesubstanceother_detail" class="form-control input-sm" placeholder="Detail" disabled runat="server"/>
                            <%--<asp:TextBox ID="tb_substanceother_detail" runat="server" CssClass="form-control input-sm" Enabled="False"></asp:TextBox>--%>
                        </div>
                    </div>
                </div>
                            
                            
            </div>
        </div>
    </div>
    </div>
    
    <div class="row fd_animate">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">วัตถุที่เกิดหรือปล่อยออกมา</h3>
                <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objpowder" id="chk15" runat="server" />
                                    <span></span>
                                    ผง
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objheat" id="chk16" runat="server" />
                                    <span></span>
                                    ความร้อน
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objnoise" id="chk17" runat="server" />
                                    <span></span>
                                    เสียง(> 85 dBA)
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objvibrate" id="chk18" runat="server" />
                                    <span></span>
                                    การสั่นสะเทือน
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objpoisongas" id="chk19" runat="server" />
                                    <span></span>
                                    แก๊สพิษ
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objwastewater" id="chk20" runat="server" />
                                    <span></span>
                                    น้ำเสีย
                                </label>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objray" id="chk21" runat="server" />
                                    <span></span>
                                    รังสี
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objsmoke" id="chk22" runat="server" />
                                    <span></span>
                                    ควัน
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_objelectricwave" id="chk23" runat="server"/>
                                    <span></span>
                                    คลื่นไฟฟ้า
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-1'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info text-nowrap">
                                <label>
                                    <input type="checkbox" class="objother_check" name="chkname_objother" id="chk_objother" onclick="EnableControl7();" runat="server" />
                                    <span></span>
                                    อื่นๆ
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <div class="textboxlinecheckbox">
                                <input id="tb_objotherdetail" type="text" name="nameobjotherdetail" class="form-control input-sm"  placeholder="Detail" disabled runat="server"/>
                                <%--<asp:TextBox ID="tb_objotherdetail" runat="server" CssClass="form-control input-sm" Enabled="False"></asp:TextBox>--%>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class='col-md-6'>    
                        <div class='form-group'>
                            <label>ชื่อสาร</label>
                            <input id="tb_objcheme_daneger_name" type="text" name="tb_objcheme_daneger_name" class="form-control input-sm" placeholder="Cheme name" runat="server"/>
                        </div>
                    </div>
                            
                    
                            
                </div>
            </div>
            
        </div>
        
    </div>
    
    <div class="row fd_animate">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">อุปกรณ์คุ้มครองความปลอดภัยที่ต้องสวมใส่</h3>
                <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_helment" id="chk24" runat="server" />
                                    <span></span>
                                    หมวกนิรภัย
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_glasses" id="chk25" runat="server" />
                                    <span></span>
                                    แว่นตา
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_chemical_mask" id="chk26" runat="server" />
                                    <span></span>
                                    หน้ากากกันสารเคมี
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_bib_protect" id="chk27" runat="server" />
                                    <span></span>
                                    เอี้ยมกันเคมี
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_chemical_gloves" id="chk28" runat="server" />
                                    <span></span>
                                    ถุงมือกันสารเคมี
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_heatresistant_gloves" id="chk29" runat="server" />
                                    <span></span>
                                    ถุงมือกันความร้อน
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_cutprotect_gloves" id="chk30" runat="server" />
                                    <span></span>
                                    ถุงมือกันบาด
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_eyecover" id="chk31" runat="server" />
                                    <span></span>
                                    ที่ครอบตา
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_faceshield" id="chk32" runat="server" />
                                    <span></span>
                                    กะบังหน้า
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_dustmask" id="chk33" runat="server" />
                                    <span></span>
                                    หน้ากากกันฝุ่น
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_chemicalpack" id="chk34" runat="server" />
                                    <span></span>
                                    ชุดกันเคมี
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_equi_electricgloves" id="chk35" runat="server" />
                                    <span></span>
                                    ถุงมือกันไฟฟ้า
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info text-nowrap">
                                <label>
                                    <input type="checkbox" class="equi_other_check" name="chkname_equi_other" id="chk_equi_other" onclick="EnableControl8();" runat="server" />
                                    <span></span>
                                    อื่นๆ
                                </label>                
                            </div>
                       
                        </div>
                    </div>
                
                
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="textboxlinecheckbox">
                                <input id="tb_equi_other_detail" type="text" name="nameequi_other_detail" class="form-control input-sm" Enabled="False" placeholder="Detail" disabled runat="server"/>
                               
                            </div>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
    </div>
    
    <div class="row fd_animate">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">การตรวจสอบทางกฎหมาย</h3>
                <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class='col-md-3'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_rawmc" id="chk36" runat="server"  onclick="EnableNamelaw36();" />
                                    <span></span>
                                    กฎหมายเครื่องจักร
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-3'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_rawchemical" id="chk37" runat="server"  onclick="EnableNamelaw37();" />
                                    <span></span>
                                    กฎหมายสารเคมี
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-3'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_rawenvironmental" id="chk38" runat="server"  onclick="EnableNamelaw38();"/>
                                    <span></span>
                                    กฎหมายสิ่งแวดล้อม
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-3'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_rawhighpressuregas" id="chk39" runat="server"  onclick="EnableNamelaw39();"/>
                                    <span></span>
                                    กฎหมายก๊าซแรงดันสูง
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class='col-md-3'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_rawpreventstopfire" id="chk40" runat="server" onclick="EnableNamelaw40();"/>
                                    <span></span>
                                    กฎหมายป้องกันและระงับอัคคีภัย
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-3'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_rawfactory" id="chk41" runat="server" onclick="EnableNamelaw41();"/>
                                    <span></span>
                                    กฎหมายโรงงาน
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-3'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" name="chk_rawfuelregulatory" id="chk42" runat="server"  onclick="EnableNamelaw42();"/>
                                    <span></span>
                                    กฎหมายควบคุมเชื้อเพลิง
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
               
                <div class="row">
                    
                    <div class='col-md-1'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info text-nowrap">
                                <label>
                                    <input type="checkbox" class="chk_rawother_check" name="chkname_rawother" id="chk_rawother" onclick="EnableControl9();" runat="server" />
                                    <span></span>
                                    อื่นๆ
                                </label>
                            </div>
                        </div>
                    </div> 
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="textboxlinecheckbox">
                                <input id="tb_rawotherdetail" type="text" name="namerawotherdetail" class="form-control input-sm"  placeholder="Detail" disabled runat="server"/>
                                <%--<asp:TextBox ID="tb_rawotherdetail" runat="server" CssClass="form-control input-sm" Enabled="False"></asp:TextBox>--%>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2 text-right'>
                        <div class="form-group">
                            <div class="text_inline">
                                    ชื่อกฎหมาย
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <div class="textboxlinecheckbox">
                                <input id="tb_rawname" type="text" name="tb_rawname" class="form-control input-sm" runat="server" disabled />
                               
                            </div>
                        </div>
                    </div>
                    
                   
                </div>
                
            </div>
            
        </div>
    </div>
    
    <div class="row fd_animate">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">กฎหมายที่เกี่ยวข้อง</h3>
                <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="text_inline">
                                <label>ต้องแจ้งทางกฎหมาย</label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" class="legal_notice_check" name="chkname_legal_notice" id="chk_legal_notice" onclick="EnableControl3();" runat="server" />
                                    <span></span>
                                    ไม่จำเป็น/จำเป็น
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-8'>
                        <div class="form-group">
                            <div class="textboxlinecheckbox">
                                <input id="tb_legal_notice" type="text" name="namelegal_notice" class="form-control input-sm"  placeholder="Detail" disabled runat="server"/>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="text_inline">
                                <label>ขออนุมัติทางกฎหมาย</label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    <input type="checkbox" class="get_legal_approval_check" name="chkname_get_legal_approval" id="chk_get_legal_approval" onclick="EnableControl4();" runat="server" />
                                    <span></span>
                                    ไม่จำเป็น/จำเป็น
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-8'>
                        <div class="form-group">
                            <div class="textboxlinecheckbox">
                                <input id="tb_get_legal_approval" type="text" name="nameget_legal_approval" class="form-control input-sm"  placeholder="Detail" disabled runat="server"/>
                            </div>
                        </div>
                    </div>
                </div>
               
                <div class="row">
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="text_inline">
                                <label>ตรวจสอบทางกฎหมาย</label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-2'>
                        <div class="form-group">
                            <div class="checkbox checbox-switch switch-info">
                                <label>
                                    
                                    <input type="checkbox" class="legal_investigation_check" name="chkname_legal_investigation" id="chk_legal_investigation" onclick="EnableControl5();" runat="server" />

                                    <span></span>
                                    ไม่จำเป็น/จำเป็น
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-8'>
                        <div class="form-group">
                            <div class="textboxlinecheckbox">
                                <input id="tb_legal_investigation" type="text" name="namelegal_investigation" class="form-control input-sm"  placeholder="Detail" disabled runat="server"/>
                               
                            </div>
                        </div>
                    </div>
                
                </div>
                
            </div>
            
        </div>
    </div>
    
    <%--<div class="row fd_animate">
        
            <div class="panel panel-info ">
                <div class="panel-heading">
                    <h3 class="panel-title">Upload file</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            
                            <div class="form-group">
                                <form id="form1" enctype="multipart/form-data">
                                    <label>Image Machine</label>
                                    <input id="input-upload" name="input-upload" type="file" multiple data-show-preview="true" data-preview-file-type="text">
                                <script>
                                    //setup
                                    setupFileUploadBox();
                                </script>
                                </form>
                            </div>
                            <hr/>
                            
                            <div class="row">
                               
                                <div class="col-md-8">
                                    <div class="form-group">
                                        
                                        <asp:Label ID="lbnamefile1" runat="server" Text="" Visible="False"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:LinkButton ID="lnkdownload1" runat="server" CssClass="btn btn-block btn-success" OnClick="DownloadFile"  Visible="False"><i class="fa fa-cloud-download" aria-hidden="true"></i></asp:LinkButton>
     
                                    </div>
                                </div>
                            </div>
                            
                            
                            
                     

                        </div>
                        <div class="col-md-6">
                            
                            <div class="form-group">
                                <label>Layout file</label>
                                <input id="input-upload2" name="input-upload" type="file" multiple data-show-preview="true" data-preview-file-type="text">
                                <script>
                                    //setup
                                    setupFileUploadBox2();

                                </script>
              
                            </div>
                            <hr/>
                           
                            <div class="row">
                                
                                <div class="col-md-8">
                                    <div class="form-group">
                                       
                                        <asp:Label ID="lbnamefile2" runat="server" Text="" Visible="False"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:LinkButton ID="lnkdownload2" runat="server" CssClass="btn btn-block btn-success" OnClick="DownloadFileLayout"  Visible="False"><i class="fa fa-cloud-download" aria-hidden="true"></i></asp:LinkButton>
     
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                    </div>
                </div>
             
            </div>
    </div>--%>
    
    <div class="row fd_animate">
        
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">Accept Data</h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div class="form-group">
                        <asp:LinkButton ID="lnksave" runat="server" CssClass="btn btn-success btn-lg btn-block login-button font800" data-style="zoom-out" OnClick="Callfunction" Text="Save"></asp:LinkButton>
                    </div>
                </div>  
            </div>
        </div>
             
    </div>
        <div class="row" style="display:none">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <asp:GridView ID="gvDetailsMcno" Width="100%"  AutoGenerateColumns="False" runat="server" 
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
                            <%--<asp:BoundField DataField="STATUS_NAME" HeaderText="STATUS" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>--%>
                            
                        </Columns>
                        <HeaderStyle BackColor="DarkSeaGreen" ForeColor="Gainsboro" />
                        <AlternatingRowStyle BackColor="SlateGray" CssClass="gvfont"/>
                    </asp:GridView>
                </div>
            </div>
        </div>
        
</div>

<a href="#" class="cd-top js-cd-top">Top</a>
    <script src="Scripts/main.js"></script>
</div>

</asp:Content>
