<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="EquipmentCheck.aspx.vb" Inherits="RISTMACHINE.EquipmentCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type="text/javascript">
        $(function () {
            $("#btnpage3").bind("click",
                function() {
                    //debugger;
                    const e = document.getElementById(('<%= lbmcno.ClientID %>'));
                    const s = document.getElementById(('<%= lbstatus.ClientID %>'));

                    const ep3Mcno = e.textContent;
                    const status = s.textContent;
                    const url = "Securitychecktool.aspx?ep3mcno=" + ep3Mcno + "&Status="+ status;;
                    window.location.href = url;

                   
                });
        });

    </script>
    
    <script>
        function setupFileUploadBoxMCFront() {
            //setup file upload 
            $("#upfront").fileinput({
                uploadUrl: "ReceieveFile.aspx",
                uploadAsync: true,
                showUpload: true,
                dropZoneEnabled: true,
                maxFileCount: 1,
                //mainClass: "input-group-lg",
                allowedFileExtensions: ["png","jpg"]
            });
        }
        function setupFileUploadBoxMCBack() {
            //setup file upload 
            $("#upback").fileinput({
                uploadUrl: "ReceieveFile.aspx",
                uploadAsync: true,
                showUpload: true,
                dropZoneEnabled: true,
                maxFileCount: 1,
                //mainClass: "input-group-lg",
                allowedFileExtensions: ["png","jpg"]
            });
        }
    </script>
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

        
        function setupFileUploadlayout() {
            //setup file upload 
            $("#uplayout").fileinput({
                uploadUrl: "ReceieveFile.aspx",
                uploadAsync: true,
                showUpload: true,
                dropZoneEnabled: true,
                maxFileCount: 1,
                //mainClass: "input-group-lg",
                allowedFileExtensions: ["png","jpg"]
            });
        }

        function UpdateComplete() {
            bootbox.dialog({
                message: "<h4 class='text-center'><i class='fa fa-check fa-3x text-success'></i><br/>Update Data Page 2 Complete</h4>",
                title: "<h3 class='text-center'>RIST MACHINE SYSTEM ONLINE</h3>",
                buttons: {
                    danger: {
                        label: 'OK',
                        className: "btn-success",
                        callback: function () {
                            setTimeout(function () {
                                //txtemail.focus();
                                //window.location.href="home.aspx";
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
        <div class="row wellz">
    
            <div class="col-md-8">
                <h4 class="text-left font800">Equipment Safety Device & Safety Cover Check Sheet</h4>
                <p class="text-left font800"><a href="#" class="btn btn-primary" onClick="history.go(-1); return false;">Go back page 1</a> </p>
                
            </div>
            <div class="col-md-4">
                <h4 class="text-right font800 text-danger"><asp:Label ID="lbmcno" runat="server" CssClass="label label-success" ></asp:Label></h4>
                <p class="text-right font800"><asp:Label ID="lbstatus" runat="server" CssClass="text-danger" ></asp:Label></p>
                <p class="text-right "><button class="btn btn-primary" type="button" id="btnpage3">Next page 3</button></p>
            </div>
        </div>
        <div class='row fd_animate'>
             <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Machine Name & Check list</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span> 
                </div>
                    <div class="panel-body">
                    <div class="row">
                <div class='col-md-6'>    
                    <div class='form-group'>
                        <label for="tb_mcname">ชื่อเครื่องจักรอุปกรณ์</label>
                        <input id="tb_mcname" type="text" name="tb_mcname" class="form-control input-sm" placeholder="machine name" runat="server"/>
                    </div>
                </div>
                <div class='col-md-6'>    
                    <div class='form-group'>
                        <label for="tb_mcno">หมายเลขเครื่องจักร</label>
                        <input id="tb_mcno" type="text" name="tb_mcno" class="form-control input-sm" placeholder="machine no." runat="server"/>
                    </div>
                </div>
                    <div class="row xmargin">
                <div class="col-md-6">
                    <div class="form-group">
                        <form id="frmupmcfront" enctype="multipart/form-data">
                            <label>รูปภาพเครื่องจักร (ด้านหน้า)</label>
                            <input id="upfront" name="upfront" type="file" data-show-preview="false" >
                            <script>
                                //setup
                                setupFileUploadBoxMCFront();
                            </script>
                        </form>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <asp:Label ID="lbmcfront" runat="server" Text="" Visible="False"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:LinkButton ID="lnkdownload1" runat="server" CssClass="btn btn-block btn-success" OnClick="DownloadFile1"  Visible="False"><i class="fa fa-cloud-download"></i></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <form id="frmupmcback" enctype="multipart/form-data">
                            <label>รูปภาพเครื่องจักร (ด้านหลัง)</label>
                            <input id="upback" name="upback" type="file" data-show-preview="false" >
                            <script>
                                //setup
                                setupFileUploadBoxMCBack();
                            </script>
                        </form>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <asp:Label ID="lbmcback" runat="server" Text="" Visible="False"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:LinkButton ID="lnkdownload2" runat="server" CssClass="btn btn-block btn-success" OnClick="DownloadFile2"  Visible="False"><i class="fa fa-cloud-download"></i></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                        
                    </div>
                <div class="col-md-6">
                   <table class="table table-responsive table-bordered">
                       <thead>
                           <tr>
                               <th class="text-center">No.</th>
                               <th class="text-center text-nowrap">หัวข้อตรวจเช็ค Emergency Switch</th>
                               <th class="text-center">หมายเลข</th>
                               <th class="text-center">(OK/NG)</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <th class="text-center">1.</th>
                               <td>
                                   <input id="tbemersdt1" type="text" name="tbemersdt1" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbemersno1" type="text" name="tbemersno1" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk11" id="chk11" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                            <tr>
                               <th class="text-center">2.</th>
                               <td>
                                   <input id="tbemersdt2" type="text" name="tbemersdt2" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbemersno2" type="text" name="tbemersno2" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk12" id="chk12" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                            </tr>
                           <tr>
                               <th class="text-center">3.</th>
                               <td>
                                   <input id="tbemersdt3" type="text" name="tbemersdt3" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbemersno3" type="text" name="tbemersno3" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk13" id="chk13" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">4.</th>
                               <td>
                                   <input id="tbemersdt4" type="text" name="tbemersdt4" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbemersno4" type="text" name="tbemersno4" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk14" id="chk14" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">5.</th>
                               <td>
                                   <input id="tbemersdt5" type="text" name="tbemersdt5" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbemersno5" type="text" name="tbemersno5" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk15" id="chk15" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">6.</th>
                               <td>
                                   <input id="tbemersdt6" type="text" name="tbemersdt6" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbemersno6" type="text" name="tbemersno6" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk16" id="chk16" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">7.</th>
                               <td>
                                   <input id="tbemersdt7" type="text" name="tbemersdt7" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbemersno7" type="text" name="tbemersno7" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk17" id="chk17" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">8.</th>
                               <td>
                                   <input id="tbemersdt8" type="text" name="tbemersdt8" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbemersno8" type="text" name="tbemersno8" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk18" id="chk18" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                       </tbody>
                   </table>
                    
                    <table class="table table-responsive table-bordered">
                       <thead>
                           <tr>
                               <th class="text-center">No.</th>
                               <th class="text-center">หัวข้อตรวจเช็ค Area Sensor</th>
                               <th class="text-center">หมายเลข</th>
                               <th class="text-center">(OK/NG)</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <th class="text-center">1.</th>
                               <td>
                                   <input id="tbareas1" type="text" name="tbareas1" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbareasno1" type="text" name="tbareasno1" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk21" id="chk21" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                            <tr>
                               <th class="text-center">2.</th>
                                <td>
                                    <input id="tbareas2" type="text" name="tbareas2" class="form-control input-sm" placeholder="" runat="server"/>
                                </td>
                                <td>
                                    <input id="tbareasno2" type="text" name="tbareasno2" class="form-control input-sm" placeholder="" runat="server"/>
                                </td>
                                <td>
                                    <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                        <label>
                                            <input type="checkbox" class="" name="chk22" id="chk22" runat="server" />                         
                                            <span></span>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                           <tr>
                               <th class="text-center">3.</th>
                               <td>
                                   <input id="tbareas3" type="text" name="tbareas3" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbareasno3" type="text" name="tbareasno3" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk23" id="chk23" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">4.</th>
                               <td>
                                   <input id="tbareas4" type="text" name="tbareas4" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbareasno4" type="text" name="tbareasno4" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk24" id="chk24" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">5.</th>
                               <td>
                                   <input id="tbareas5" type="text" name="tbareas5" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbareasno5" type="text" name="tbareasno5" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk25" id="chk25" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">6.</th>
                               <td>
                                   <input id="tbareas6" type="text" name="tbareas6" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbareasno6" type="text" name="tbareasno6" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk26" id="chk26" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">7.</th>
                               <td>
                                   <input id="tbareas7" type="text" name="tbareas7" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbareasno7" type="text" name="tbareasno7" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk27" id="chk27" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">8.</th>
                               <td>
                                   <input id="tbareas8" type="text" name="tbareas8" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbareasno8" type="text" name="tbareasno8" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk28" id="chk28" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                       </tbody>
                   </table>
                </div>
                
                <div class="col-md-6">
                   <table class="table table-responsive table-bordered">
                       <thead>
                           <tr>
                               <th class="text-center">No.</th>
                               <th class="text-center">หัวข้อตรวจเช็ค Safety Cover</th>
                               <th class="text-center">หมายเลข</th>
                               <th class="text-center">(OK/NG)</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <th class="text-center">1.</th>
                               <td>
                                   <input id="tbsafecover1" type="text" name="tbsafecover1" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbsafecoverno1" type="text" name="tbsafecoverno1" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk31" id="chk31" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                            <tr>
                               <th class="text-center">2.</th>
                                <td>
                                    <input id="tbsafecover2" type="text" name="tbsafecover2" class="form-control input-sm" placeholder="" runat="server"/>
                                </td>
                                <td>
                                    <input id="tbsafecoverno2" type="text" name="tbsafecoverno2" class="form-control input-sm" placeholder="" runat="server"/>
                                </td>
                                <td>
                                    <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                        <label>
                                            <input type="checkbox" class="" name="chk32" id="chk32" runat="server" />                         
                                            <span></span>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                           <tr>
                               <th class="text-center">3.</th>
                               <td>
                                   <input id="tbsafecover3" type="text" name="tbsafecover3" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbsafecoverno3" type="text" name="tbsafecoverno3" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk33" id="chk33" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">4.</th>
                               <td>
                                   <input id="tbsafecover4" type="text" name="tbsafecover4" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbsafecoverno4" type="text" name="tbsafecoverno4" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk34" id="chk34" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">5.</th>
                               <td>
                                   <input id="tbsafecover5" type="text" name="tbsafecover5" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbsafecoverno5" type="text" name="tbsafecoverno5" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk35" id="chk35" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">6.</th>
                               <td>
                                   <input id="tbsafecover6" type="text" name="tbsafecover6" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbsafecoverno6" type="text" name="tbsafecoverno6" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk36" id="chk36" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">7.</th>
                               <td>
                                   <input id="tbsafecover7" type="text" name="tbsafecover7" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbsafecoverno7" type="text" name="tbsafecoverno7" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk37" id="chk37" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">8.</th>
                               <td>
                                   <input id="tbsafecover8" type="text" name="tbsafecover8" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tbsafecoverno8" type="text" name="tbsafecoverno8" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk38" id="chk38" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                       </tbody>
                   </table>
                    
                    <table class="table table-responsive table-bordered">
                       <thead>
                           <tr>
                               <th class="text-center">No.</th>
                               <th class="text-center">หัวข้อตรวจเช็ค Limit Switch</th>
                               <th class="text-center">หมายเลข</th>
                               <th class="text-center">(OK/NG)</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <th class="text-center">1.</th>
                               <td>
                                   <input id="tblimitsw1" type="text" name="tblimitsw1" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tblimitswno1" type="text" name="tblimitswno1" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk41" id="chk41" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                            <tr>
                               <th class="text-center">2.</th>
                                <td>
                                    <input id="tblimitsw2" type="text" name="tblimitsw2" class="form-control input-sm" placeholder="" runat="server"/>
                                </td>
                                <td>
                                    <input id="tblimitswno2" type="text" name="tblimitswno2" class="form-control input-sm" placeholder="" runat="server"/>
                                </td>
                                <td>
                                    <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                        <label>
                                            <input type="checkbox" class="" name="chk42" id="chk42" runat="server" />                         
                                            <span></span>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                           <tr>
                               <th class="text-center">3.</th>
                               <td>
                                   <input id="tblimitsw3" type="text" name="tblimitsw3" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tblimitswno3" type="text" name="tblimitswno3" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk43" id="chk43" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">4.</th>
                               <td>
                                   <input id="tblimitsw4" type="text" name="tblimitsw4" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tblimitswno4" type="text" name="tblimitswno4" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk44" id="chk44" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">5.</th>
                               <td>
                                   <input id="tblimitsw5" type="text" name="tblimitsw5" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tblimitswno5" type="text" name="tblimitswno5" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk45" id="chk45" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">6.</th>
                               <td>
                                   <input id="tblimitsw6" type="text" name="tblimitsw6" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tblimitswno6" type="text" name="tblimitswno6" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk46" id="chk46" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">7.</th>
                               <td>
                                   <input id="tblimitsw7" type="text" name="tblimitsw7" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tblimitswno7" type="text" name="tblimitswno7" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk47" id="chk47" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <th class="text-center">8.</th>
                               <td>
                                   <input id="tblimitsw8" type="text" name="tblimitsw8" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <input id="tblimitswno8" type="text" name="tblimitswno8" class="form-control input-sm" placeholder="" runat="server"/>
                               </td>
                               <td>
                                   <div class="checkbox checbox-switch switch-success" style="margin-top: 0;">
                                       <label>
                                           <input type="checkbox" class="" name="chk48" id="chk48" runat="server" />                         
                                           <span></span>
                                       </label>
                                   </div>
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
                    <h3 class="panel-title">แผนผัง (Lay out) สถานที่ในการติดตั้งเครื่องจักรและอุปกรณ์</h3>
                    <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span> 
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class='col-md-4'>    
                            <div class='form-group'>
                                <label>หน่วยงาน/ฝ่าย/แผนก</label>
                                <input id="tb_organize" type="text" name="tb_organize" class="form-control input-sm" placeholder="Div/Dept/Sec"  runat="server" />
                            </div>
                        </div>

                        <div class='col-md-2'>    
                            <div class='form-group'>
                                <label>อาคาร</label>
                                <input id="tb_building" type="text" name="tb_building" class="form-control input-sm" placeholder="Building" runat="server"/>
                            </div>
                        </div>
                        <div class='col-md-2'>    
                            <div class='form-group'>
                                <label>ชั้น</label>
                                <input id="tb_floor" type="text" name="tb_floor" class="form-control input-sm" placeholder="Floor" runat="server"/>
                            </div>
                        </div>
                        <div class='col-md-4'>    
                            <div class='form-group'>
                                <label>Process</label>
                                <input id="tb_process" type="text" name="tb_process" class="form-control input-sm" placeholder="Process" runat="server"/>
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <form id="frmlayout" enctype="multipart/form-data">
                                    <label for="uplayout">Lay out</label>
                                    <input id="uplayout" name="uplayout" type="file" data-show-preview="false">
                                    <script>
                                        //setup
                                        setupFileUploadlayout();
                                    </script>
                                </form>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <asp:Label ID="lbmsglayout" runat="server" Text="" Visible="False"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:LinkButton ID="lnkdownload3" runat="server" CssClass="btn btn-block btn-success" OnClick="DownloadFile3"  Visible="False"><i class="fa fa-cloud-download" aria-hidden="true"></i></asp:LinkButton>
                                    </div>
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
