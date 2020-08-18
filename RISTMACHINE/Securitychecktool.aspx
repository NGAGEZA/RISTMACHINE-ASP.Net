<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="Securitychecktool.aspx.vb" Inherits="RISTMACHINE.Securitychecktool" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
   
   

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
                                            <input id="tb_imp1_1" type="text" name="tb_imp1_1" class="form-control input-sm" placeholder="" runat="server"/>
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
                                        <th class="text-center">หัวข้อการตรวจเช็ค</th>
                                        <th class="text-center">การตัดสินก่อนนำเข้า</th>
                                        <th class="text-center">หมายเหตุ</th>
                                        <th class="text-center">การตัดสินก่อนเริ่มใช้งาน</th>
                                        <th class="text-center">หมายเหตุ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th colspan="5">①มาตรการความปลอดภัยในการ Operate</th>
                                    </tr>
                                    <tr>
                                        <td>①-1）Emergency Stop Lot นั้น อยู่ในตำแหน่งที่สามารถกดได้ง่ายหรือไม่</td>
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
                                        <td>①-2）สามารถตรวจสอบประเภทอุปกรณ์ได้อย่างสะดวกหรือไม่</td>
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
                                        <td>①-3）ความสะดวกในการดูจอ Display รวมถึงตำแหน่ง (ความสูง) นั้น มีความเหมาะสมหรือไม่</td>
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
                                        <td>①-4）มีการดำเนินมาตรป้องกันการทำงานที่ผิดพลาด ที่ Switch Panel ของแต่ะละ Operate Panel หรือไม่</td>
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
                                        <td>①-5）มีการใช้ฟังค์ชั่นการแสดงด้านนอก (เช่น ไฟไซเรน, สัญญาณไฟ, อุปกรณ์ตรวจจับ เป็นต้น) ในกรณีที่มีความผิดปกตืหรือไม่</td>
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
                                        <td>①-6）มีการใช้ฟังค์ชั่น Back up ในกรณีไฟดับหรือไม่</td>
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
                                        <td>①-7）มีการบ่งชี้สถานะการเปิดปิดของวาล์ว , ก๊อกหรือไม่</td>
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
                                            <select id="select_str3_7" runat="server" name="select_str3_7" class="form-control input-sm">
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
                                        <td>①-8）มีการบ่งชี้ชนิดของวัตถุดิบที่ Supply เข้าไป และลำดับการทำงานในจุดที่สามารถมองเห็นได้ชัดหรือไม่</td>
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
                                        <td>①-9）มีการบ่งชี้ทิศทางการไหลของวัตถุดิบที่ Supply เข้าไปติดอยู่ที่ท่อในจุดที่สามารถมองเห็นได้ชัดหรือไม่</td>
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
                                        <td>①-10）ในกรณีที่มีเครื่องจักรที่เชื่อมต่อกันมากกว่า 2 เครื่อง แล้วเครื่องใดเครื่องหนึ่งหยุดทำงาน จะทำให้เครื่องอื่นๆหยุดตามไปด้วยหรือไม่</td>
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
                                        <th colspan="5">②มาตรการความปลอดภัยของจุดที่เคลื่อนไหว</th>
                                    </tr>
                                    <tr>
                                        <td>A）มี Safety Cover ที่เครื่อง Power transmission หรือไม่</td>
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
                                        <td>B）มี Safety Cover ที่จุดที่มีการหมุน, เคลื่อนไป-กลับ, เคลื่อนขึ้น-ลง หรือไม่</td>
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
                                        <td>C）บริเวณ Cylinder และ Slider ไปหยุดที่ฝั่ง Safety ด้วยปุ่ม Power off หรือไม่</td>
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
                                        <td>D）วัสดุของ Safety Cover เป็นวัสดุที่มีความแข็งแรงทนทานหรือไม่ หรือ มีการติดตั้งเซนเซอร์เปิดปิดหรือไม่ (ยกเว้นการยึดด้วยน๊อต)</td>
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
                                        <td>E）อยู่ในโครงสร้างที่อวัยวะในร่างกายจะไม่เข้าไปในจุดที่มีการเคลื่อนที่ถึงแม้ว่าดำเนินงานเปลี่ยนอุปกรณ์ก็ตาม</td>
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
                                        <td>F）อยู่ในโครงสร้างที่ไม่สามารถนำมือเข้าไปใน Cover ได้หากเครื่องไม่หยุดทำงาน หรือไม่</td>
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
                                        <td>G）ทำการตรวจสอบโดย Check sheet การทำงานของ Interlock หรือไม่ (แนบ Check sheet ที่ทำการตรวจสอบแล้ว เฉพาะก่อนที่จะมีการใช้งาน</td>
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
                    <h3 class="panel-title">ส่วนที่มีการเคลื่อนตัว</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>มีโครงสร้างป้องกันไม่ให้อวัยวะส่วนใดส่วนหนึ่งของร่างกายเข้าไปในบริเวณที่เครื่องจักรมีการเคลื่อนที่ได้</td>
                                        <td>
                                            <select id="choicex11" runat="server" name="choicex11" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbx11" type="text" name="tbpbx11" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespx11" type="text" name="tbrespx11" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtx11" type="text" name="tbdtx11" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีโอกาสที่นิ้วจะเข้าไปหรือไม่</td>
                                        <td>
                                            <select id="choiceb12" runat="server" name="choiceb12" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbb12" type="text" name="tbpbb12" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespb12" type="text" name="tbrespb12" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtb12" type="text" name="tbdtb12" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">ไฟฟ้า</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>มีสิ่งที่ยื่นออกมาอันอาจทำให้ไม่ปลอดภัยหรือไม่</td>
                                        <td>
                                            <select id="choicec13" runat="server" name="choicec13" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbc13" type="text" name="tbpbc13" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespc13" type="text" name="tbrespc13" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtc13" type="text" name="tbdtc13" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มอเตอร์, Cylinder ยื่นออกมาหรือไม่</td>
                                        <td>
                                            <select id="choiced14" runat="server" name="choiced14" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbd14" type="text" name="tbpbd14" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespd14" type="text" name="tbrespd14" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtd14" type="text" name="tbdtd14" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีโอกาสถูกไฟดูดหรือไม่</td>
                                        <td>
                                            <select id="choicee15" runat="server" name="choicee15" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbe15" type="text" name="tbpbe15" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespe15" type="text" name="tbrespe15" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdte15" type="text" name="tbdte15" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ความจุไฟเกินกว่าที่กำหนดหรือไม่</td>
                                        <td>
                                            <select id="choicef16" runat="server" name="choicef16" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbf16" type="text" name="tbpbf16" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespf16" type="text" name="tbrespf16" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtf16" type="text" name="tbdtf16" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีสายไฟพาดกลางอากาศ หรือสายไฟติดพื้นหรือไม่</td>
                                        <td>
                                            <select id="choiceg17" runat="server" name="choiceg17" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbg17" type="text" name="tbpbg17" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespg17" type="text" name="tbrespg17" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtg17" type="text" name="tbdtg17" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีป้ายเตือนว่าใช้ไฟฟ้าแรงสูงหรือไม่</td>
                                        <td>
                                            <select id="choiceh18" runat="server" name="choiceh18" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbh18" type="text" name="tbpbh18" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbresph18" type="text" name="tbresph18" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdth18" type="text" name="tbdth18" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">Cover</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>มีความแข็งแรงพอหรือไม่</td>
                                        <td>
                                            <select id="choicei19" runat="server" name="choicei19" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbi19" type="text" name="tbpbi19" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespi19" type="text" name="tbrespi19" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdti19" type="text" name="tbdti19" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มี Interlock ในที่ที่ควรมีหรือไม่</td>
                                        <td>
                                            <select id="choicej20" runat="server" name="choicej20" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbj20" type="text" name="tbpbj20" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespj20" type="text" name="tbrespj20" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtj20" type="text" name="tbdtj20" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีการเตรียม maintenance jig ไว้พร้อมหรือไม่</td>
                                        <td>
                                            <select id="choicek21" runat="server" name="choicek21" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbk21" type="text" name="tbpbk21" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespk21" type="text" name="tbrespk21" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtk21" type="text" name="tbdtk21" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีเหลี่ยมคมหรือไม่</td>
                                        <td>
                                            <select id="choicel22" runat="server" name="choicel22" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbl22" type="text" name="tbpbl22" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespl22" type="text" name="tbrespl22" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtl22" type="text" name="tbdtl22" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">ส่วนที่ทำงาน</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>มีการติดตั้งที่จับตามความจำเป็นหรือไม่</td>
                                        <td>
                                            <select id="choicem23" runat="server" name="choicem23" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbm23" type="text" name="tbpbm23" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespm23" type="text" name="tbrespm23" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtm23" type="text" name="tbdtm23" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>สวิตช์ฉุกเฉินกดง่ายหรือไม่</td>
                                        <td>
                                            <select id="choicen24" runat="server" name="choicen24" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbn24" type="text" name="tbpbn24" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespn24" type="text" name="tbrespn24" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtn24" type="text" name="tbdtn24" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Operation Panel มีปุ่มที่อาจทำให้ Operate ผิดพลาดหรือไม่</td>
                                        <td>
                                            <select id="choiceo25" runat="server" name="choiceo25" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbo25" type="text" name="tbpbo25" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespo25" type="text" name="tbrespo25" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdto25" type="text" name="tbdto25" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">แรงดันอากาศ</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>พอปิดสวิตช์แล้ว ฝั่ง Fix หยุดหรือไม่</td>
                                        <td>
                                            <select id="choicep26" runat="server" name="choicep26" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbp26" type="text" name="tbpbp26" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespp26" type="text" name="tbrespp26" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtp26" type="text" name="tbdtp26" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>การเดินท่อมีการฝืนและเสี่ยงอันตรายหรือไม่</td>
                                        <td>
                                            <select id="choiceq27" runat="server" name="choiceq27" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbq27" type="text" name="tbpbq27" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespq27" type="text" name="tbrespq27" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtq27" type="text" name="tbdtq27" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>น้ำเสียจากร่องระบายน้ำไหลไปถูกชิ้นส่วนอื่นหรือไม่</td>
                                        <td>
                                            <select id="choicer28" runat="server" name="choicer28" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbr28" type="text" name="tbpbr28" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespr28" type="text" name="tbrespr28" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtr28" type="text" name="tbdtr28" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีการเดินท่อกลางอากาศหรือไม่</td>
                                        <td>
                                            <select id="choices29" runat="server" name="choices29" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbs29" type="text" name="tbpbs29" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbresps29" type="text" name="tbresps29" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdts29" type="text" name="tbdts29" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">ความมั่นคง</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>ขณะติดตั้ง แม้เอียง 15 องศาก็ไม่ล้ม</td>
                                        <td>
                                            <select id="choicet30" runat="server" name="choicet30" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbt30" type="text" name="tbpbt30" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespt30" type="text" name="tbrespt30" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtt30" type="text" name="tbdtt30" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ขณะเดินเครื่อง แม้เอียง 15 องศาก็ไม่ล้ม</td>
                                        <td>
                                            <select id="choiceu31" runat="server" name="choiceu31" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbu31" type="text" name="tbpbu31" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespu31" type="text" name="tbrespu31" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtu31" type="text" name="tbdtu31" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>สำหรับเครื่องที่จำเป็น มีการระบุ Center Point ของเครื่องหรือไม่</td>
                                        <td>
                                            <select id="choicev32" runat="server" name="choicev32" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbv32" type="text" name="tbpbv32" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespv32" type="text" name="tbrespv32" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtv32" type="text" name="tbdtv32" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ความสูงของเครื่องสูงกว่าความกว้าง  3  เท่าหรือไม่</td>
                                        <td>
                                            <select id="choicew33" runat="server" name="choicew33" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbw33" type="text" name="tbpbw33" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespw33" type="text" name="tbrespw33" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtw33" type="text" name="tbdtw33" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ยึดชิ้นส่วนมั่นคงหรือไม่ มีชิ้นส่วนที่เสี่ยงต่อการหลุดร่วงหรือไม่</td>
                                        <td>
                                            <select id="choicex34" runat="server" name="choicex34" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbx34" type="text" name="tbpbx34" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespx34" type="text" name="tbrespx34" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtx34" type="text" name="tbdtx34" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">อุปกรณ์ คปภ.</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>มีปุ่มหยุดฉุกเฉินหรือไม่</td>
                                        <td>
                                            <select id="choicey35" runat="server" name="choicey35" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpby35" type="text" name="tbpby35" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespy35" type="text" name="tbrespy35" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdty35" type="text" name="tbdty35" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มี Micro swicth หรือไม่</td>
                                        <td>
                                            <select id="choicez36" runat="server" name="choicez36" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbz36" type="text" name="tbpbz36" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespz36" type="text" name="tbrespz36" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtz36" type="text" name="tbdtz36" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มี Sensor หรือไม่และครอบคลุมถึงส่วนไหนของเครื่องจักร</td>
                                        <td>
                                            <select id="choiceza37" runat="server" name="choiceza37" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbza37" type="text" name="tbpbza37" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespza37" type="text" name="tbrespza37" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtza37" type="text" name="tbdtza37" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">สัญลักษณ์ คปภ.</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>มีป้าย, Sticker ภาษาไทย แจ้งบอกปุ่มต่าง ๆ  เช่น ปุ่มฉุกเฉิน</td>
                                        <td>
                                            <select id="choicezx38" runat="server" name="choicezx38" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbzx38" type="text" name="tbpbzx38" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespzx38" type="text" name="tbrespzx38" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtzx38" type="text" name="tbdtzx38" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีป้ายภาษาไทยบ่งบอกส่วนอันตรายหรือข้อควรระวังของเครื่อง เช่น มีอุณหภูมิสูง  ระวังรังสี อื่น ๆ</td>
                                        <td>
                                            <select id="choicezc39" runat="server" name="choicezc39" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbzc39" type="text" name="tbpbzc39" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespzc39" type="text" name="tbrespzc39" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtzc39" type="text" name="tbdtzc39" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">คู่มือและการอบรม</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">หัวข้อการตรวจสอบ</th>
                                        <th class="text-center">ประเมิน</th>
                                        <th class="text-center">ปัญหาที่พบ</th>
                                        <th class="text-center">ผู้รับผิดชอบ</th>
                                        <th class="text-center">กำหนดแล้วเสร็จ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>มีคู่มือการทำงานและกฎระเบียบเรื่องความปลอดภัยที่อ่านแล้วเข้าใจง่ายและอยู่ในพื่นที่การทำงาน</td>
                                        <td>
                                            <select id="choicezv40" runat="server" name="choicezv40" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbzv40" type="text" name="tbpbzv40" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespzv40" type="text" name="tbrespzv40" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtzv40" type="text" name="tbdtzv40" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>พนักงานที่ปฏิบัติงานอยู่กับเครื่องจักร ได้รับการอบรมถึงวิธีการทำงานกับเครื่องจักรอย่างปลอดภัย</td>
                                        <td>
                                            <select id="choicezs41" runat="server" name="choicezs41" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbzs41" type="text" name="tbpbzs41" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespzs41" type="text" name="tbrespzs41" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtzs41" type="text" name="tbdtzs41" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
