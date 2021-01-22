<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="Securitychecktool.aspx.vb" Inherits="RISTMACHINE.Securitychecktool" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
   
   

    <script type="text/javascript">
        $(document).on('click',
            '.panel-heading span.clickable',
            function() {
                const $this = $(this);
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

        //Autocomplete1

    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('.datepix').datepicker({
                format: "mm/dd/yyyy",
                autoclose: true,
                todayHighlight: true,
                calendarWeeks: true,
                orientation: "bottom right",
                todayBtn: "linked"
            });
        });


    </script>
    
    <script src="Scripts/select-enable-input.js"></script>
    <script src="Scripts/select-disabled.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row wellz">
    
            <div class="col-md-8">
                <h4 class="text-left font800">หัวข้อการตรวจสอบความปลอดภัยของเครื่องจักรและอุปกรณ์</h4>
                <p class="text-left font800"><a href="#" class="btn btn-primary" onClick="history.go(-1); return false;">Go back page 2</a> </p>
            </div>
            <div class="col-md-4">
                <h4 class="text-right font800 text-danger"><asp:Label ID="lbmcno" runat="server" CssClass="label label-success" ></asp:Label></h4>
                <p class="text-right font800"><asp:Label ID="lbstatus" runat="server" CssClass="text-danger" ></asp:Label></p>
            </div>
        </div>  
        
        <div class="row fd_animate">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">1.Raw Material, Sub-Material, และวัตถุอื่นๆที่เกี่ยวข้องกับความปลอดภัย</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจเช็ค</th>
                                        <th class="text-center">การตัดสินก่อนนำเข้า</th>
                                        <th class="text-center">หมายเหตุ</th>
                                        <th class="text-center">การตัดสินก่อนเริ่มใช้งาน</th>
                                        <th class="text-center">หมายเหตุ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th colspan="5">① มาตรการความปลอดภัยเกี่ยบกับ Raw Material, Sub Material และวัตถุอื่นๆที่ใช้งาน</th>
                                </tr>
                                    <tr>
                                        <td>①-1) มีระบบการผนึกแน่นไม่ให้อากาศเข้า, เครื่อง Exhaust หรือไม่</td>
                                        <td>
                                            <select id="select_imp1_1" runat="server" name="select_imp1_1" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp1_1" type="text" name="tb_imp1_1" class="form-control input-sm"  runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_1" runat="server" name="select_str1_1" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_1" type="text" name="tb_str1_1" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>①-2）เครื่อง Exhaust นั้นถูกต้องเหมาะสมตามกฎหมายหรือไม่</td>
                                        <td>
                                            <select id="select_imp1_2" runat="server" name="select_imp1_2" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_2" type="text" name="tb_imp1_2" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_2" runat="server" name="select_str1_2" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_2" type="text" name="tb_str1_2" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>A）มีความสามารถในการระบายอากาศ, จำกัดความเร็วลมเพื่อไม่ให้เกินค่าความหนาแน่นที่กำหนดไว้หรือไม่</td>
                                        <td>
                                            <select id="select_imp1_A" runat="server" name="select_imp1_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_A" type="text" name="tb_imp1_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_A" runat="server" name="select_str1_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_A" type="text" name="tb_str1_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>①-3）มีมาตรการป้องกันเช่นป้องกันการรั่วไหลหรือแก๊สรั่ว หรือไม่</td>
                                        <td>
                                            <select id="select_imp1_3" runat="server" name="select_imp1_3" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_3" type="text" name="tb_imp1_3" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_3" runat="server" name="select_str1_3" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_3" type="text" name="tb_str1_3" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                   <tr>
                                        <td>①-4）มีมาตรการป้องกันกลิ่นจากท่อนํ้าเสียทั้งหมด และมาตรการป้องกันการไหลย้อนหรือไม่</td>
                                        <td>
                                            <select id="select_imp1_4" runat="server" name="select_imp1_4" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_4" type="text" name="tb_imp1_4" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_4" runat="server" name="select_str1_4" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_4" type="text" name="tb_str1_4" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>①-5）มีการติดตั้ง Safety Cover, Safety Device, Safety Valve ไว้ในจุดที่มีการใช้วัตถุดิบที่มีความอันตรายหรือไม่</td>
                                        <td>
                                            <select id="select_imp1_5" runat="server" name="select_imp1_5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_5" type="text" name="tb_imp1_5" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_5" runat="server" name="select_str1_5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_5" type="text" name="tb_str1_5" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>①-6）มีการติดตั้ง Leak Detector หรือไม่</td>
                                        <td>
                                            <select id="select_imp1_6" runat="server" name="select_imp1_6" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_6" type="text" name="tb_imp1_6" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_6" runat="server" name="select_str1_6" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_6" type="text" name="tb_str1_6" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>①-7）ชิ้นส่วน, อุปกรณ์ที่มีการสัมผัสแก๊ส, สารเคมีนั้น ได้ใช้วัสดุที่มีความทนทานหรือไม่</td>
                                        <td>
                                            <select id="select_imp1_7" runat="server" name="select_imp1_7" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_7" type="text" name="tb_imp1_7" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_7" runat="server" name="select_str1_7" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_7" type="text" name="tb_str1_7" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>①-8）มีการติดตั้งระบบ Emergency Stop ในกรณีที่เกิดการรั่วของแก๊สหรือไม่</td>
                                        <td>
                                            <select id="select_imp1_8" runat="server" name="select_imp1_8" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_8" type="text" name="tb_imp1_8" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_8" runat="server" name="select_str1_8" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_8" type="text" name="tb_str1_8" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>①-9）มีการติดตั้ง Gas Leak Detector ภายในท่อ Ductหรือไม่</td>
                                        <td>
                                            <select id="select_imp1_9" runat="server" name="select_imp1_9" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_9" type="text" name="tb_imp1_9" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_9" runat="server" name="select_str1_9" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_9" type="text" name="tb_str1_9" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>①-10）มีการดำเนินมาตรการความปลอดภัยที่เครื่องจักรที่มีการใช้ความถี่สูงตามข้อกฎหมายหรือไม่หรือไม่</td>
                                        <td>
                                            <select id="select_imp1_10" runat="server" name="select_imp1_10" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_10" type="text" name="tb_imp1_10" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_10" runat="server" name="select_str1_10" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_10" type="text" name="tb_str1_10" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>①-11）มีการติดตั้ง Magnetic Field Shelter (ต้องมี Interlock） ที่เครื่องจักรที่มีการใช้ High Magnetic Field ตามข้อกฎหมายหรือไม่</td>
                                        <td>
                                            <select id="select_imp1_11" runat="server" name="select_imp1_11" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp1_11" type="text" name="tb_imp1_11" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str1_11" runat="server" name="select_str1_11" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str1_11" type="text" name="tb_str1_11" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="5">② มาตรการความปลอดภัยต่อสิ่งที่จะเกิดตามๆมาหรือวัตถุที่ปล่อยออกมา</th>
                                    </tr>
                                    <tr>
                                        <td>②-1）มีการติดตั้งเครื่องกำจัดฝุ่นที่มีความเหมาะสมตามขนาดของอนุภาคหรือไม่</td>
                                        <td>
                                            <select id="select_imp12_1" runat="server" name="select_imp12_1" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp12_1" type="text" name="tb_imp12_1" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str12_1" runat="server" name="select_str12_1" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str12_1" type="text" name="tb_str12_1" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>②-2）มีการติดตั้งเครื่องกำจัดไอเสียหรือไม่</td>
                                        <td>
                                            <select id="select_imp12_2" runat="server" name="select_imp12_2" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp12_2" type="text" name="tb_imp12_2" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str12_2" runat="server" name="select_str12_2" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str12_2" type="text" name="tb_str12_2" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>②-3）มีการติดตั้งเครื่องกำจัด Waste Fluid (ของเสียหรือไม่) หรือไม่</td>
                                        <td>
                                            <select id="select_imp12_3" runat="server" name="select_imp12_3" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp12_3" type="text" name="tb_imp12_3" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str12_3" runat="server" name="select_str12_3" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str12_3" type="text" name="tb_str12_3" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>②-4）มีภาชนะสำหรับจัดเก็บเศษผ้า, เศษกระดาษหรือไม่</td>
                                        <td>
                                            <select id="select_imp12_4" runat="server" name="select_imp12_4" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp12_4" type="text" name="tb_imp12_4" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str12_4" runat="server" name="select_str12_4" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str12_4" type="text" name="tb_str12_4" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>②-5）มีการติดตั้ง Exhaust Pressure Sensor หรือไม่</td>
                                        <td>
                                            <select id="select_imp12_5" runat="server" name="select_imp12_5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp12_5" type="text" name="tb_imp12_5" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str12_5" runat="server" name="select_str12_5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str12_5" type="text" name="tb_str12_5" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>②-6）ในท่อ Exhaust ของเครื่องจักรนั้น มีระบบในการป้องกันการค้างของสารละลายหรือการแบ่งแยกระหว่างวัตถุที่ติดไฟ หรือไม่</td>
                                        <td>
                                            <select id="select_imp12_6" runat="server" name="select_imp12_6" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp12_6" type="text" name="tb_imp12_6" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str12_6" runat="server" name="select_str12_6" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str12_6" type="text" name="tb_str21_6" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>②-7）ท่อต่างๆ (รวมถึงท่อ Duct) ของเครื่องจักรนั้น อยู่ในโครงสร้างที่สามารถป้องกันการรั่วไหลของสารละลายได้หรือไม่</td>
                                        <td>
                                            <select id="select_imp12_7" runat="server" name="select_imp12_7" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp12_7" type="text" name="tb_imp12_7" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str12_7" runat="server" name="select_str12_7" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str12_7" type="text" name="tb_str12_7" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row fd_animate">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">2.ความปลอดภัยด้านไฟฟ้า</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจเช็ค</th>
                                        <th class="text-center">การตัดสินก่อนนำเข้า</th>
                                        <th class="text-center">หมายเหตุ</th>
                                        <th class="text-center">การตัดสินก่อนเริ่มใช้งาน</th>
                                        <th class="text-center">หมายเหตุ</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr>
                                        <td>2-1）สายไฟฟ้ามีการเก็บรวบเข้าด้วยกันโดยสายรัดสายไฟ และมีการจัดเก็บเป็นระเบียบเรียบร้อยหรือไม่</td>
                                        <td>
                                            <select id="select_imp2_1" runat="server" name="select_imp2_1" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp2_1" type="text" name="tb_imp2_1" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str2_1" runat="server" name="select_str2_1" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str2_1" type="text" name="tb_str2_1" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2-2）มีการติดป้ายระบุจุดปลายทางของ Breaker ของตู้ไฟฟ้าหรือไม่</td>
                                        <td>
                                            <select id="select_imp2_2" runat="server" name="select_imp2_2" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp2_2" type="text" name="tb_imp2_2" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str2_2" runat="server" name="select_str2_2" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str2_2" type="text" name="tb_str2_2" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2-3）มีการติดตั้ง Safety Cover ที่จุดชาร์จที่อยู่ในสภาพเปลือยหรือไม่</td>
                                        <td>
                                            <select id="select_imp2_3" runat="server" name="select_imp2_3" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp2_3" type="text" name="tb_imp2_3" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str2_3" runat="server" name="select_str2_3" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str2_3" type="text" name="tb_str2_3" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2-4）มีการเชื่อมต่อ Short Circuit Breaker,　สายดิน และ Fuse หรือไม่</td>
                                        <td>
                                            <select id="select_imp2_4" runat="server" name="select_imp2_4" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp2_4" type="text" name="tb_imp2_4" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str2_4" runat="server" name="select_str2_4" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str2_4" type="text" name="tb_str2_4" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2-5）มีการติด Cover ที่ในจุดที่มีความเสี่ยงที่ของเหลวจะไปโดนอุปกรณ์ไฟฟ้าเนื่องจากการเสียหายของจุดต่อสำหรับของเหลวหรือไม่</td>
                                        <td>
                                            <select id="select_imp2_5" runat="server" name="select_imp2_5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp2_5" type="text" name="tb_imp2_5" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str2_5" runat="server" name="select_str2_5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str2_5" type="text" name="tb_str2_5" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row fd_animate">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">3. ความปลอดภัยเกี่ยวกับโครงสร้าง, จุดขับเคลื่อน, ด้านรูปทรง (แนบ Drawing - Catalog - Specifications ในส่วนที่เกี่ยวข้องกับความปลอดภัย, ตำแหน่งของจุดที่ขีดเส้นใต้, และที่มีการระบุความสามารถ)</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center" colspan="4">หัวข้อการตรวจเช็ค</th>
                                        <th class="text-center">การตัดสินก่อนนำเข้า</th>
                                        <th class="text-center">หมายเหตุ</th>
                                        <th class="text-center">การตัดสินก่อนเริ่มใช้งาน</th>
                                        <th class="text-center">หมายเหตุ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th colspan="8">①มาตรการความปลอดภัยในการ Operate</th>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-1）Emergency Stop Lot นั้น อยู่ในตำแหน่งที่สามารถกดได้ง่ายหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_1" runat="server" name="select_imp31_1" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_1" type="text" name="tb_imp31_1" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_1" runat="server" name="select_str31_1" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_1" type="text" name="tb_str31_1" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-2）สามารถตรวจสอบประเภทอุปกรณ์ได้อย่างสะดวกหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_2" runat="server" name="select_imp31_2" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_2" type="text" name="tb_imp31_2" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_2" runat="server" name="select_str31_2" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_2" type="text" name="tb_str31_2" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-3）ความสะดวกในการดูจอ Display รวมถึงตำแหน่ง (ความสูง) นั้น มีความเหมาะสมหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_3" runat="server" name="select_imp31_3" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_3" type="text" name="tb_imp31_3" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_3" runat="server" name="select_str31_3" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_3" type="text" name="tb_str31_3" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-4）มีการดำเนินมาตรป้องกันการทำงานที่ผิดพลาด ที่ Switch Panel ของแต่ะละ Operate Panel หรือไม่</td>
                                        <td>
                                            <select id="select_imp31_4" runat="server" name="select_imp31_4" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_4" type="text" name="tb_imp31_4" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_4" runat="server" name="select_str31_4" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_4" type="text" name="tb_str31_4" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-5）มีการใช้ฟังค์ชั่นการแสดงด้านนอก (เช่น ไฟไซเรน, สัญญาณไฟ, อุปกรณ์ตรวจจับ เป็นต้น) ในกรณีที่มีความผิดปกตืหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_5" runat="server" name="select_imp31_5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_5" type="text" name="tb_imp31_5" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_5" runat="server" name="select_str31_5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_5" type="text" name="tb_str31_5" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-6）มีการใช้ฟังค์ชั่น Back up ในกรณีไฟดับหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_6" runat="server" name="select_imp31_6" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_6" type="text" name="tb_imp31_6" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_6" runat="server" name="select_str31_6" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_6" type="text" name="tb_str31_6" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-7）มีการบ่งชี้สถานะการเปิดปิดของวาล์ว , ก๊อกหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_7" runat="server" name="select_imp31_7" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_7" type="text" name="tb_imp31_7" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_7" runat="server" name="select_str31_7" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_7" type="text" name="tb_str31_7" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-8）มีการบ่งชี้ชนิดของวัตถุดิบที่ Supply เข้าไป และลำดับการทำงานในจุดที่สามารถมองเห็นได้ชัดหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_8" runat="server" name="select_imp31_8" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_8" type="text" name="tb_imp31_8" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_8" runat="server" name="select_str31_8" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_8" type="text" name="tb_str31_8" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-9）มีการบ่งชี้ทิศทางการไหลของวัตถุดิบที่ Supply เข้าไปติดอยู่ที่ท่อในจุดที่สามารถมองเห็นได้ชัดหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_9" runat="server" name="select_imp31_9" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_9" type="text" name="tb_imp31_9" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_9" runat="server" name="select_str31_9" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_9" type="text" name="tb_str31_9" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">①-10）ในกรณีที่มีเครื่องจักรที่เชื่อมต่อกันมากกว่า 2 เครื่อง แล้วเครื่องใดเครื่องหนึ่งหยุดทำงาน จะทำให้เครื่องอื่นๆหยุดตามไปด้วยหรือไม่</td>
                                        <td>
                                            <select id="select_imp31_10" runat="server" name="select_imp31_10" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp31_10" type="text" name="tb_imp31_10" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str31_10" runat="server" name="select_str31_10" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str31_10" type="text" name="tb_str31_10" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="8">②มาตรการความปลอดภัยของจุดที่เคลื่อนไหว</th>
                                    </tr>
                                    <tr>
                                        <td colspan="4">A）มี Safety Cover ที่เครื่อง Power transmission หรือไม่</td>
                                        <td>
                                            <select id="select_imp32_A" runat="server" name="select_imp32_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp32_A" type="text" name="tb_imp32_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str32_A" runat="server" name="select_str32_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str32_A" type="text" name="tb_str32_A" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">B）มี Safety Cover ที่จุดที่มีการหมุน, เคลื่อนไป-กลับ, เคลื่อนขึ้น-ลง หรือไม่</td>
                                        <td>
                                            <select id="select_imp32_B" runat="server" name="select_imp32_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp32_B" type="text" name="tb_imp32_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str32_B" runat="server" name="select_str32_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str32_B" type="text" name="tb_str32_B" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">C）บริเวณ Cylinder และ Slider ไปหยุดที่ฝั่ง Safety ด้วยปุ่ม Power off หรือไม่</td>
                                        <td>
                                            <select id="select_imp32_C" runat="server" name="select_imp32_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp32_C" type="text" name="tb_imp32_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str32_C" runat="server" name="select_str32_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str32_C" type="text" name="tb_str32_C" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">D）วัสดุของ Safety Cover เป็นวัสดุที่มีความแข็งแรงทนทานหรือไม่ หรือ มีการติดตั้งเซนเซอร์เปิดปิดหรือไม่ (ยกเว้นการยึดด้วยน๊อต)</td>
                                        <td>
                                            <select id="select_imp32_D" runat="server" name="select_imp32_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp32_D" type="text" name="tb_imp32_D" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str32_D" runat="server" name="select_str32_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str32_D" type="text" name="tb_str32_D" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">E）อยู่ในโครงสร้างที่อวัยวะในร่างกายจะไม่เข้าไปในจุดที่มีการเคลื่อนที่ถึงแม้ว่าดำเนินงานเปลี่ยนอุปกรณ์ก็ตาม</td>
                                        <td>
                                            <select id="select_imp32_E" runat="server" name="select_imp32_E" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp32_E" type="text" name="tb_imp32_E" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str32_E" runat="server" name="select_str32_E" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str32_E" type="text" name="tb_str32_E" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">F）อยู่ในโครงสร้างที่ไม่สามารถนำมือเข้าไปใน Cover ได้หากเครื่องไม่หยุดทำงาน หรือไม่</td>
                                        <td>
                                            <select id="select_imp32_F" runat="server" name="select_imp32_F" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp32_F" type="text" name="tb_imp32_F" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str32_F" runat="server" name="select_str32_F" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str32_F" type="text" name="tb_str32_F" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">G）ทำการตรวจสอบโดย Check sheet การทำงานของ Interlock หรือไม่ (แนบ Check sheet ที่ทำการตรวจสอบแล้ว เฉพาะก่อนที่จะมีการใช้งาน</td>
                                        <td>
                                            <select id="select_imp32_G" runat="server" name="select_imp32_G" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp32_G" type="text" name="tb_imp32_G" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str32_G" runat="server" name="select_str32_G" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str32_G" type="text" name="tb_str32_G" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="8">③มาตรการความปลอดภัยของโครงสร้าง (รูปร่าง, โครงสร้าง)</th>
                                    </tr>
                                    <tr>
                                        <td colspan="4">A）เป็นโครงสร้างที่แข็งแรง มีการใช้วัสดุที่แข็งแรงและคงทน ไม่พังเสียหายแม้ว่ามีของไปกระแทก</td>
                                        <td>
                                            <select id="select_imp33_A" runat="server" name="select_imp33_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp33_A" type="text" name="tb_imp33_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str33_A" runat="server" name="select_str33_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str33_A" type="text" name="tb_str33_A" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">B）มีวัตถุอุปสรรค, ของที่ยื่นโผล่ออกมา, ของแหลมคมในพื้นที่ทำงานและบริเวณทางเดินที่มีความสูงตํ่ากว่า 1.8 เมตร</td>
                                        <td>
                                            <select id="select_imp33_B" runat="server" name="select_imp33_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp33_B" type="text" name="tb_imp33_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str33_B" runat="server" name="select_str33_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str33_B" type="text" name="tb_str33_B" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">C）ได้ตรวจสอบการทำงานของ Interlock ทั้งหมดหรือไม่</td>
                                        <td>
                                            <select id="select_imp33_C" runat="server" name="select_imp33_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp33_C" type="text" name="tb_imp33_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str33_C" runat="server" name="select_str33_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str33_C" type="text" name="tb_str33_C" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">D）มีฟังค์ชั่น Feel safe Full Proof หรือไม่</td>
                                        <td>
                                            <select id="select_imp33_D" runat="server" name="select_imp33_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp33_D" type="text" name="tb_imp33_D" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str33_D" runat="server" name="select_str33_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str33_D" type="text" name="tb_str33_D" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>E）มีมาตรการการป้องกันเสียง, สั่นสะเทือน, ระเบิด หรือไม่</td>
                                        <td>ป้องกันเสียง</td>
                                        <td>ป้องกันการสั่นสะเทือน</td>
                                        <td>ป้องกันการระเบิด</td>
                                        <td>
                                            <select id="select_imp33_E" runat="server" name="select_imp33_E" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp33_E" type="text" name="tb_imp33_E" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str33_E" runat="server" name="select_str33_E" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str33_E" type="text" name="tb_str33_E" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">F）มี Cover ที่บ่งชี้ให้ระวัง ในจุดที่มีอุณหภูมิตํ่าหรือสูงหรือไม่</td>
                                        <td>
                                            <select id="select_imp33_F" runat="server" name="select_imp33_F" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp33_F" type="text" name="tb_imp33_F" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str33_F" runat="server" name="select_str33_F" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str33_F" type="text" name="tb_str33_F" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="8">④มาตรการความปลอดภัยของเครื่องจักรที่ทำความร้อนและทำความเย็น</th>
                                    </tr>
                                    <tr>
                                        <td colspan="4">A）มีอุปกรณ์ตรวจจับความผิดปกติของอุณหภูมิที่แยกต่างหากกับตัวปรับอุณหภูมิหรือไม่</td>
                                        <td>
                                            <select id="select_imp34_A" runat="server" name="select_imp34_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp34_A" type="text" name="tb_imp34_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str34_A" runat="server" name="select_str34_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str34_A" type="text" name="tb_str34_A" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">B）มีอุปกรณ์ตรวจจับปริมาณการไหลผ่านของนํ้าเย็น และอุปกรณ์เพิ่มความร้อนจะหยุดทำงานเมื่อเกิดความผิดปกติพร้อมส่งเสียง Alarm หรือไม่</td>
                                        <td>
                                            <select id="select_imp34_B" runat="server" name="select_imp34_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp34_B" type="text" name="tb_imp34_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str34_B" runat="server" name="select_str34_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str34_B" type="text" name="tb_str34_B" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">C）มีอุปกรณ์ Emergency Stop หรือไม่</td>
                                        <td>
                                            <select id="select_imp34_C" runat="server" name="select_imp34_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp34_C" type="text" name="tb_imp34_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str34_C" runat="server" name="select_str34_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str34_C" type="text" name="tb_str34_C" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row fd_animate">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">4. ความปลอดภัยเกี่ยวกับสถานที่ที่วางแผนว่าจะติดตั้ง (แนบแผนผังที่มีการชี้บ่งถึงจุด A, B, C และ G)</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center" colspan="4">หัวข้อการตรวจเช็ค</th>
                                        <th class="text-center">การตัดสินก่อนนำเข้า</th>
                                        <th class="text-center">หมายเหตุ</th>
                                        <th class="text-center">การตัดสินก่อนเริ่มใช้งาน</th>
                                        <th class="text-center">หมายเหตุ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="4">A）ช่องทางเดินระหว่างเครื่องจักรกว้างกว่า 80 ซม. หรือไม่</td>
                                        <td>
                                            <select id="select_imp4_A" runat="server" name="select_imp4_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp4_A" type="text" name="tb_imp4_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str4_A" runat="server" name="select_str4_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str4_A" type="text" name="tb_str4_A" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">B）มีการจัดพื้นที่การทำงานและพื้นที่การซ่อมบำรุงอย่างเพียงพอหรือไม่</td>
                                        <td>
                                            <select id="select_imp4_B" runat="server" name="select_imp4_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp4_B" type="text" name="tb_imp4_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str4_B" runat="server" name="select_str4_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str4_B" type="text" name="tb_str4_B" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">C）มีพื้นทางเดินพอที่สำหรับการอพยพไปยังประตูหนีไฟ และมีประตูทางหนีไฟมากกว่า 2 จุดหรือไม่</td>
                                        <td>
                                            <select id="select_imp4_C" runat="server" name="select_imp4_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp4_C" type="text" name="tb_imp4_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str4_C" runat="server" name="select_str4_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str4_C" type="text" name="tb_str4_C" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">D）สามารถถ่ายเทอากาศและมีไฟแสงสว่างพร้อมหรือไม่</td>
                                        <td>
                                            <select id="select_imp4_D" runat="server" name="select_imp4_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp4_D" type="text" name="tb_imp4_D" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str4_D" runat="server" name="select_str4_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str4_D" type="text" name="tb_str4_D" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">E）มีจุดบกพร่องใดๆในการใช้งาน Alarm, สายฉีดดับเพลิงหรือไม่</td>
                                        <td>
                                            <select id="select_imp4_E" runat="server" name="select_imp4_E" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp4_E" type="text" name="tb_imp4_E" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str4_E" runat="server" name="select_str4_E" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str4_E" type="text" name="tb_str4_E" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">F）มีอุปกรณ์ตรวจจับความร้อน, อุปกรณ์ตรวจจับควันอยู่ด้านบน (ภายในระยะ 1.5 ม.) ของจุดที่ปล่อยความร้อนออกจากเครื่องจักร เช่น เตา หรือไม่</td>
                                        <td>
                                            <select id="select_imp4_F" runat="server" name="select_imp4_F" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp4_F" type="text" name="tb_imp4_F" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str4_F" runat="server" name="select_str4_F" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str4_F" type="text" name="tb_str4_F" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">G）มีจุดที่นูนออกมาหรือหุบลงไป (เช่น รู) บนพื้น อันก่อให้เกิดอุบัติเหตุจากการหกล้มหรือไม่</td>
                                        <td>
                                            <select id="select_imp4_G" runat="server" name="select_imp4_G" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>

                                        </td>
                                        <td>
                                            <input id="tb_imp4_G" type="text" name="tb_imp4_G" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str4_G" runat="server" name="select_str4_G" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str4_G" type="text" name="tb_str4_G" class="form-control input-sm"  placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="row fd_animate">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">5. ความปลอดภัยด้านการควบคุม</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center" colspan="4">หัวข้อการตรวจเช็ค</th>
                                        <th class="text-center">การตัดสินก่อนนำเข้า</th>
                                        <th class="text-center">หมายเหตุ</th>
                                        <th class="text-center">การตัดสินก่อนเริ่มใช้งาน</th>
                                        <th class="text-center">หมายเหตุ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th colspan="8">①คัดเลือกหัวหน้างาน (Chief)</th>
                                    </tr>
                                    <tr>
                                        <td colspan="4">A）มีการคัดเลือกหัวหน้างาน (Chief) หรือไม่</td>
                                        <td>
                                            <select id="select_imp51_A" runat="server" name="select_imp51_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp51_A" type="text" name="tb_imp51_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str51_A" runat="server" name="select_str51_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str51_A" type="text" name="tb_str51_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">B）มีการบ่งชี้ชื่อและตำแหน่งของหัวหน้างาน (Chief) หรือไม่</td>
                                        <td>
                                            <select id="select_imp51_B" runat="server" name="select_imp51_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp51_B" type="text" name="tb_imp51_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str51_B" runat="server" name="select_str51_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str51_B" type="text" name="tb_str51_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="8">② การอบรมความปลอดภัยอาชีวอนามัย และการตรวจสุขภาพ</th>
                                    </tr>
                                    <tr>
                                        <td colspan="4">A）ได้มีการจัดอบรมด้านความปลอดภัยให้กับผู้ที่วางแผนไว้ว่าจะรับผิดชอบเครื่องจักรที่เป็นเป้าหมายหรือไม่</td>
                                        <td>
                                            <select id="select_imp52_A" runat="server" name="select_imp52_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp52_A" type="text" name="tb_imp52_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str52_A" runat="server" name="select_str52_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str52_A" type="text" name="tb_str52_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">B）เป็นระบบการทำงานที่ จะต้องกำหนดกฎเกณฑ์การทำงานถึงค่อยปฏิบัติงาน หรือไม่</td>
                                        <td>
                                            <select id="select_imp52_B" runat="server" name="select_imp52_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp52_B" type="text" name="tb_imp52_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str52_B" runat="server" name="select_str52_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str52_B" type="text" name="tb_str52_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">C）ได้ดำเนินการตรวจสุขภาพขณะที่มีการเปลี่ยนงานหรือไม่</td>
                                        <td>
                                            <select id="select_imp52_C" runat="server" name="select_imp52_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp52_C" type="text" name="tb_imp52_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str52_C" runat="server" name="select_str52_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str52_C" type="text" name="tb_str52_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="8">③อุปกรณ์ป้องกันอันตราย</th>
                                    </tr>
                                    <tr>
                                        <td colspan="4">A）มีการจัดเตรียมอุปกรณ์ป้องกันอันตรายตามชนิดและจำนวนที่มีความจำเป็นหรือไม่</td>
                                        <td>
                                            <select id="select_imp53_A" runat="server" name="select_imp53_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp53_A" type="text" name="tb_imp53_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str53_A" runat="server" name="select_str53_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str53_A" type="text" name="tb_str53_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">B）(O)　มีป้ายบ่งชี้สำหรับสารละลายอินทรีย์ (Organic Solvent) หรือไม่</td>
                                        <td>
                                            <select id="select_imp53_B" runat="server" name="select_imp53_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp53_B" type="text" name="tb_imp53_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str53_B" runat="server" name="select_str53_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str53_B" type="text" name="tb_str53_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">C）(S)　มีป้ายบ่งชี้สำหรับสารเคมีชนิดพิเศษหรือไม่</td>
                                        <td>
                                            <select id="select_imp53_C" runat="server" name="select_imp53_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp53_C" type="text" name="tb_imp53_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str53_C" runat="server" name="select_str53_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str53_C" type="text" name="tb_str53_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">D）(S)　มีการจัดเตรียมชุดหรือถุงมือ Safety แบบไม่ใสสำหรับการทำงานที่เกี่ยวกับ Beryllium เป็นต้น หรือไม่</td>
                                        <td>
                                            <select id="select_imp53_D" runat="server" name="select_imp53_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp53_D" type="text" name="tb_imp53_D" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str53_D" runat="server" name="select_str53_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str53_D" type="text" name="tb_str53_D" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="8">④การตรวจสอบ</th>
                                    </tr>
                                    <tr>
                                        <td colspan="4">A）ได้มีการจัดทำ Check Sheet ก่อนเริ่มงานหรือไม่</td>
                                        <td>
                                            <select id="select_imp54_A" runat="server" name="select_imp54_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp54_A" type="text" name="tb_imp54_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str54_A" runat="server" name="select_str54_A" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str54_A" type="text" name="tb_str54_A" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">B）มีการจัดทำ Self-Check Sheet ตามระยะหรือไม่</td>
                                        <td>
                                            <select id="select_imp54_B" runat="server" name="select_imp54_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp54_B" type="text" name="tb_imp54_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str54_B" runat="server" name="select_str54_B" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str54_B" type="text" name="tb_str54_B" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">C）ได้ดำเนิน ER/A ขณะที่มีการเข้าตรวจสอบเครื่องจักรที่ซื้อมาหรือไม่</td>
                                        <td>
                                            <select id="select_imp54_C" runat="server" name="select_imp54_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp54_C" type="text" name="tb_imp54_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str54_C" runat="server" name="select_str54_C" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str54_C" type="text" name="tb_str54_C" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">D）ได้ดำเนิน ER/A การออกแบบหรือไม่ (เครื่องจักรใหม่ที่ผลิตภายใน Rohm)</td>
                                        <td>
                                            <select id="select_imp54_D" runat="server" name="select_imp54_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_imp54_D" type="text" name="tb_imp54_D" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <select id="select_str54_D" runat="server" name="select_str54_D" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ดี</option>
                                                <option value="2">ไม่ดี</option>
                                                <option value="3">ไม่สอดคล้อง</option>
                                                <option value="4">ไม่สามารถตรวจสอบก่อนนำเข้าได้</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tb_str54_D" type="text" name="tb_str54_D" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

    
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
                            <asp:LinkButton ID="lnksave" runat="server" CssClass="btn btn-success btn-lg btn-block login-button font800" data-style="zoom-out"  Text="Save" OnClick="Callfunction"></asp:LinkButton>
                        </div>
                    </div>  
                </div>
            </div>
             
        </div>
    </div>
    
    <a href="#" class="cd-top js-cd-top">Top</a>
    <script src="Scripts/main.js"></script>
    


    </div>
</asp:Content>
