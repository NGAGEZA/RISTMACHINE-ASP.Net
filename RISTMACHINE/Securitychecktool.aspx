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
                    <h3 class="panel-title">แหล่งความร้อน</h3>
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
                                        <td>แผ่นกันความร้อนมีอุณหภูมิต่ำกว่า 50 องศาหรือไม่</td>
                                        <td>
                                            <select id="choice5" runat="server" name="choice5" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpb5" type="text" name="tbpb5" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbresp5" type="text" name="tbresp5" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdt5" type="text" name="tbdt5" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>บริเวณที่มีอุณหภูมิสูง จะมีป้ายแสดงให้เห็นชัดเจนหรือไม่ (มากกว่า 50 องศา)</td>
                                        <td>
                                            <select id="choice6" runat="server" name="choice6" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpb6" type="text" name="tbpb6" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbresp6" type="text" name="tbresp6" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdt6" type="text" name="tbdt6" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีพื้นผิวร้อนที่พนักงานจะสัมผัสได้หรือไม่</td>
                                        <td>
                                            <select id="choice7" runat="server" name="choice7" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpb7" type="text" name="tbpb7" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbresp7" type="text" name="tbresp7" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdt7" type="text" name="tbdt7" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
                    <h3 class="panel-title">ส่วนที่เคลื่อนที่</h3>
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
                                            <select id="choice8" runat="server" name="choice8" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpb8" type="text" name="tbpb8" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbresp8" type="text" name="tbresp8" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdt8" type="text" name="tbdt8" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>มีโอกาสที่นิ้วจะเข้าไปหรือไม่</td>
                                        <td>
                                            <select id="choice9" runat="server" name="choice9" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpb9" type="text" name="tbpb9" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbresp9" type="text" name="tbresp9" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdt9" type="text" name="tbdt9" class="form-control input-sm datepix" placeholder="" runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ถ้ากดปุ่มหยุดฉุกเฉินหยุดทันทีหรือไม่ / ใช้เวลากี่นาที</td>
                                        <td>
                                            <select id="choicex10" runat="server" name="choicex10" class="form-control input-sm">
                                                <option value="" selected disabled hidden>Choose here</option>
                                                <option value="1">ไม่มีปัญหา</option>
                                                <option value="2">มีปัญหาเล็กน้อยแต่ไม่เป็นอุปสรรค</option>
                                                <option value="3">มีปัญหาจำเป็นต้องแก้ไข</option>
                                                <option value="4">ไม่จำเป็นต้องประเมิน</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input id="tbpbx10" type="text" name="tbpbx10" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbrespx10" type="text" name="tbrespx10" class="form-control input-sm" placeholder="" runat="server"/>
                                        </td>
                                        <td>
                                            <input id="tbdtx10" type="text" name="tbdtx10" class="form-control input-sm datepix" placeholder="" runat="server"/>
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
