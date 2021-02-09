Option Explicit On
Option Strict On

Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports System.Security.Cryptography
Imports Oracle.DataAccess.Client


Public Class Main
    Inherits Page
    Dim ReadOnly _conStrDbhrms As String = ConfigurationManager.ConnectionStrings("CONN_HRMS").ConnectionString

    'Dim _division as String = String.Empty
    'Dim _department As String = String.Empty
    'Dim _section As String = String.Empty
    Dim _stampname as String = String.Empty

    'Dim RegisterNewMc As Boolean = If((Request.Form("chk_regis_mc_new") = "on"), True, False)

    Private Property Divdeptsec() As String
    Private Property Division() As String
    Private Property Department() As String
    Private Property Section() As String
    Private Property Mcno() As String


    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()

            Else 
            'Getdata for edit
            If Not String.IsNullOrEmpty(Request.QueryString("emcno")) Then

                If lnksave.Text <> "UPDATE"
                    Getdata()
                    
                    lnksave.Text = "UPDATE"
                End If

                
            Exit Sub
            End If
            'get data for review data from email request
            If Not String.IsNullOrEmpty(Request.QueryString("rmcno")) Then
                Getdatapreview()
                lnksave.Visible = False
                Exit Sub
            End If
            'get data for Sect.mgr preview approve
            If Not String.IsNullOrEmpty(Request.QueryString("smcno")) Then
                Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("smcno")))
                GetdataforMgr()
                lnksave.Text = "Sect.Mgr Approve"
                Exit Sub
            End If
            'get data for Dept.mgr preview approve
            If Not String.IsNullOrEmpty(Request.QueryString("dmcno")) Then
                Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("dmcno")))
                GetdataforMgr()
                lnksave.Text = "Dept.Mgr Approve"
                Exit Sub
            End If
            'get data for Dept.mgr preview approve
            If Not String.IsNullOrEmpty(Request.QueryString("dimcno")) Then
                Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("dimcno")))
                GetdataforMgr()
                lnksave.Text = "Div.Mgr Approve"
                Exit Sub
            End If
            'get data for Sub-Com preview approve
            If Not String.IsNullOrEmpty(Request.QueryString("scmcno")) Then
                Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("scmcno")))
                GetdataforMgr()
                lnksave.Text = "MCE Sub-Com Approve"
                Exit Sub
            End If
            'get data for SafetyOfficer preview approve
            If Not String.IsNullOrEmpty(Request.QueryString("sfmcno")) Then
                Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("sfmcno")))
                GetdataforMgr()
                lnksave.Text = "Safety Officer Approve"
                Exit Sub
            End If
            'get data for SafetyMgr preview approve
            If Not String.IsNullOrEmpty(Request.QueryString("sfmgrmcno")) Then
                Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("sfmgrmcno")))
                GetdataforMgr()
                lnksave.Text = "Safety Mgr Approve"
                Exit Sub
            End If

            
            

            'Continue to page 2 EquipmentCheck
            If lnksave.Text = "Go to page 2" then
                Dim reqmcnocookie As HttpCookie = Request.Cookies("ep2mcno")
                Mcno = reqmcnocookie("ep2mcno").ToString

                Response.Redirect("EquipmentCheck.aspx?ep2mcno=" + Mcno)
            End If





            Checkflow
            GetDetailOrganize

        End If
        
    End Sub
   Private Sub Checkflow()
       Using db As New DBRISTMCDataContext
            Try
                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
               


                '//function checkflow request
                'dim getflow = From f in db.TB_FLOW_REQUESTs
                '        where f.REQUEST_OP = opno
                '        Select f
                Dim getflow = db.TB_FLOW_REQUESTs.Where(Function(x) x.REQUEST_OP = opno)

                If getflow.Count() = 0 Then

                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alertnoflow();", True)
                    Exit Sub

                End If
            Catch ex As Exception
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
                Finally
                    db.Dispose()
            End Try
          
           
       End Using
   End Sub
    Private Sub GetDetailOrganize()

        'Dim opno As String = CType(Session("opnologin"), String)
        Dim opnocookie As HttpCookie = Request.Cookies("opno")
        Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
       ' Dim query As String = String.Empty
        Dim query = "Select * From hrms.v_empmail WHERE CODEMPID = " & "'" & opno & "'"

        Using con As New OracleConnection(_conStrDbhrms)
            Try
                Using cmd As New OracleCommand(query)
                Using sda As New OracleDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)

                        Dim dt As New DataTable()
                        Dim fullname As String 
                        Dim n1 as String = String.Empty
                        Dim n2 As String = String.Empty
                        dt = ds.Tables(0)

                        If dt.Rows.Count <> 0 Then

                            For Each dr As DataRow In dt.Rows

                                If dr.IsNull("DIVISION") = True Then
                                    Division = "-"
                                Else
                                    Division = dr("DIVISION").ToString.Trim.ToUpper
                                End If

                                If dr.IsNull("DEPARTMENT") = True Then
                                    Department = "-"
                                Else
                                    Department = dr("DEPARTMENT").ToString.Trim.ToUpper
                                End If


                                If dr.IsNull("SECTION") = True Then
                                    Section = "-"
                                Else
                                    Section = dr("SECTION").ToString.Trim.ToUpper
                                End If


                                If dr.IsNull("NAMEMPE") = True Then

                                    fullname = "-"
                                Else
                                    fullname = dr("NAMEMPE").ToString.Trim.ToUpper
                                    Dim spname As String() = fullname.Split(New Char() {" "c})
                                    select Case spname.Length
                                        Case 2
                                            Dim n as string = String.Empty
                                            n = spname(0).ToUpper() + " "
                                            Dim np As String() = n.Split(New Char() {"."c})
                                            n1 = np(1).ToUpper() + " "
                                            n2 = Mid(spname(1), 1, 1).ToUpper() + "."

                                        Case 3
                                            n1 = spname(1).ToUpper() + " "
                                            n2 = Mid(spname(2), 1, 1).ToUpper() + "."
                                    End Select


                                End If

                            Next
                            _stampname = n1 + n2
                            Divdeptsec = Division + " / " + Department + " / " + Section
                            tb_organize.Value = Divdeptsec
                            tb_organize.Disabled = True
                        Else
                            ' ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert_For_NameNotfound();", True)
                            'ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('Data Not Found.!!!!');", True)
                            Exit Sub
                        End If

                    End Using
                End Using
            End Using
            Catch ex As Exception

                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                con.Close()
            End Try
            
        End Using

    End Sub
    
    Protected Sub Callfunction()
        Select Case lnksave.Text
            Case "Save"
                InsertData()
            Case "UPDATE"
                UpdateData()
            Case "Sect.Mgr Approve"
                ApproveSectmgr()
            Case "Dept.Mgr Approve"
                ApproveDeptmgr()
            Case "Div.Mgr Approve"
                ApproveDivmgr()
            Case "MCE Sub-Com Approve"
                ApproveSubCom()
            Case "Safety Officer Approve"
                ApproveSafetyOfficer()
            Case "Safety Mgr Approve"
                ApproveSafetyMgr()
        End Select
    End Sub

    Private Sub InsertData
      
        'Dim ip = CType(Session("IP_ADDRESS"), String)

        Dim  ipcookie As HttpCookie = Request.Cookies("ip")
        Dim  ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")

        Dim opnocookie As HttpCookie = Request.Cookies("opno")
        Dim opno As String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
        Dim statusname =  "@Requested"
       
        Using db As New DBRISTMCDataContext()
            Try
               
                '//Generate MC NO.
                Dim getlastmc = db.TB_MACHINE_DATAs.OrderByDescending(function(x) x.MC_NO).FirstOrDefault()

            
                Dim getmc As Integer
              
                
                If getlastmc Is Nothing
                    Mcno = "MC-001"
                Else 
                    getmc = CInt(Mid(getlastmc.MC_NO, 4, 3)) + 1

                    Select Case CStr(getmc).Length
                        Case 1
                            Mcno = "MC-00" + CStr(getmc)
                        Case 2
                            Mcno = "MC-0" + CStr(getmc)
                    End Select

                End If
                '//End Generate MC NO


                '//Function Save Image to Database
                'Read the file and convert it to Byte Array
                Dim filePath As String = Server.MapPath("Images/STAMP_ROHM.emf")
                Dim filename As String = Path.GetFileName(filePath)
                Dim fs = New FileStream(filePath, FileMode.Open, FileAccess.Read)
                Dim br = New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(Convert.ToInt32(fs.Length))
                br.Close()
                fs.Close()
                '//end function save image

                ''//Function Save Attach file main 1 

                'Dim nameupload1 = CType(Session("namefile1"), String)
                'Dim filePathupload1 as String
                'Dim filenameupload1 As String
                'Dim fsupload1 As FileStream
                'Dim brupload1 As BinaryReader
                'Dim bytesupload1 As Byte()
                'Dim doccontentype As string

                ''//Function Save Attach file main 2 
                Dim uploadfileErs As HttpCookie = Request.Cookies("fileErs")
                Dim nameuploadErs as String = If(uploadfileErs IsNot Nothing, uploadfileErs.Value.Split("="c)(1), "undefined")
                'Dim nameuploadErs = CType(Session("fileErs"), String)
                Dim filePathuploadErs as String
                Dim filenameuploadErs As String
                Dim fsuploadErs As FileStream
                Dim bruploadErs As BinaryReader
                Dim bytesuploadErs As Byte()
                Dim doccontentypeErs As string

               

                If nameuploadErs Isnot Nothing


                    filePathuploadErs = Server.MapPath("upload/" & nameuploadErs & "")
                    filenameuploadErs = Path.GetFileName(filePathuploadErs)
                    fsuploadErs = New FileStream(filePathuploadErs, FileMode.Open, FileAccess.Read)
                    bruploadErs = New BinaryReader(fsuploadErs)
                    bytesuploadErs = bruploadErs.ReadBytes(Convert.ToInt32(fsuploadErs.Length))
                    doccontentypeErs = MimeMapping.GetMimeMapping(filenameuploadErs)
                    bruploadErs.Close()
                    fsuploadErs.Close()


                    'filePathupload2 = Server.MapPath("upload/" & nameupload2 & "")
                    'filenameupload2 = Path.GetFileName(filePathupload2)
                    'fsupload2 = New FileStream(filePathupload2, FileMode.Open, FileAccess.Read)
                    'brupload2 = New BinaryReader(fsupload2)
                    'bytesupload2 = brupload2.ReadBytes(Convert.ToInt32(fsupload2.Length))
                    'doccontentype2 = MimeMapping.GetMimeMapping(filenameupload2)
                    'brupload2.Close()
                    'fsupload2.Close()

                End If


                Dim insertMc As New TB_MACHINE_DATA With {
                        .MC_NO = Mcno,
                        .REGISTER_DATE = Datetime.Now,
                        .REGISTER_NEW_MC = chk1.Checked,
                        .CANCEL_MC = chk2.Checked,
                        .CATEGORY1_NEW_MC = chk3.Checked,
                        .CATEGORY1_TF_MC = chk4.Checked,
                        .CATEGORY1_OTH_MC = chk_category1_mc_other.Checked,
                        .CATEGORY1_MC_OTHER_DETAIL = tb_category1_mc_other.Value,
                        .CATEGORY2_NEW_MODEL_MC = chk5.Checked,
                        .CATEGORY2_ORIGINAL_MODEL_MC = chk6.Checked,
                        .CATEGORY2_OTH_MODEL_MC = chk_category2_mc_other.Checked,
                        .CATEGORY2_MC_OTHER_DETAIL = tb_category2_mc_other.Value,
                        .MAKER = tb_maker.Value.ToUpper.Trim(),
                        .COUNTRY = tb_country.Value.ToUpper.Trim(),
                        .SUPPLIER = tb_supplier.Value.ToUpper.Trim(),
                        .PROVIDER = tb_provider.Value.ToUpper.Trim(),
                        .TEL = tb_tel.Value.Trim(),
                        .TYPE_MC = tb_type_mc.Value.ToUpper.Trim(),
                        .SIZE_HP_MC = tb_size_hp_mc.Value.Trim(),
                        .DIVISION = Division.ToUpper.Trim(),
                        .DEPARTMENT = Department.ToUpper.Trim(),
                        .SECTION = Section.ToUpper.Trim(),
                        .DANGER_CHEME_1 = chk7.Checked,
                        .DANGER_CHEME_2 = chk8.Checked,
                        .DANGER_CHEME_3 = chk9.Checked,
                        .DANGER_CHEME_4 = chk10.Checked,
                        .DANGER_CHEME_NAME = tb_cheme_daneger_name.Value.Trim,
                        .CAS_NO = tb_casno.Value.Trim,
                        .FLAMMABLE = chk11.Checked,
                        .CORROSIVE = chk12.Checked,
                        .POISON = chk13.Checked,
                        .GAS = chk14.Checked,
                        .SUBSTANCE_OTHER = chk_substanceother.Checked,
                        .SUBSTANCE_OTHER_DETAIL = tb_substanceother_detail.Value.Trim,
                        .OBJ_POWDER = chk15.Checked,
                        .OBJ_HEAT = chk16.Checked,
                        .OBJ_NOISE = chk17.Checked,
                        .OBJ_VIBRATE = chk18.Checked,
                        .OBJ_POISONGAS = chk19.Checked,
                        .OBJ_WASTE_WATER = chk20.Checked,
                        .OBJ_RAY = chk21.Checked,
                        .OBJ_SMOKE = chk22.Checked,
                        .OBJ_ELECTRIC_WAVE = chk23.Checked,
                        .OBJ_OTHER = chk_objother.Checked,
                        .OBJ_OTHER_DETAIL = tb_objotherdetail.Value.Trim,
                        .OBJ_CHEME_NAME = tb_objcheme_daneger_name.Value.Trim,
                        .EQUIPMENT_HELMET = chk24.Checked,
                        .EQUIPMENT_GLASSES = chk25.Checked,
                        .EQUIPMENT_CHEMICAL_MASK = chk26.Checked,
                        .EQUIPMENT_BIB_PROTECT_CHEMECAL = chk27.Checked,
                        .EQUIPMENT_CHEMICAL_GLOVES = chk28.Checked,
                        .EQUIPMENT_HEAT_RESISTANT_GLOVES = chk29.Checked,
                        .EQUIPMENT_CUT_PROTECT_GLOVES = chk30.Checked,
                        .EQUIPMENT_EYE_COVER = chk31.Checked,
                        .EQUIPMENT_FACE_SHIELD = chk32.Checked,
                        .EQUIPMENT_DUST_MASK = chk33.Checked,
                        .EQUIPMENT_CHEMICAL_PACK = chk34.Checked,
                        .EQUIPMENT_ELECTRIC_GLOVES = chk35.Checked,
                        .EQUIPMENT_OTHER = chk_equi_other.Checked,
                        .EQUIPMENT_OTHER_DETAIL = tb_equi_other_detail.Value.Trim,
                        .LAW_MC = chk36.Checked,
                        .LAW_CHEMECALS = chk37.Checked,
                        .LAW_ENVIRONMENTAL = chk38.Checked,
                        .LAW_HIGH_PRESSURE_GAS = chk39.Checked,
                        .LAW_PREVENT_STOP_FIRE = chk40.Checked,
                        .LAW_FACTORY = chk41.Checked,
                        .LAW_FUEL_REGULATORY = chk42.Checked,
                        .LAW_OTHER = chk_rawother.Checked,
                        .LAW_OTHER_DETAIL = tb_rawotherdetail.Value.Trim,
                        .LAW_NAME = tb_rawname.Value.Trim,
                        .LAW_NOTICE = chk_legal_notice.Checked,
                        .LAW_NOTICE_DETAIL = tb_legal_notice.Value.Trim,
                        .LAW_APPROVE = chk_get_legal_approval.Checked,
                        .LAW_APPROVE_DETAIL = tb_get_legal_approval.Value.Trim,
                        .LAW_CHECK = chk_legal_investigation.Checked,
                        .LAW_CHECK_DETAIL = tb_legal_investigation.Value.Trim,
                        .IMG_TEMP_STAMP = filename.Trim,
                        .IMG_TEMP_STAMP_CONTENT_TYPE = "application/emf",
                        .IMG_TEMP_STAMP_DATA = bytes,
                        .REQUEST_NAME_APPROVE = _stampname,
                        .REQUEST_APPROVE_DATE = DateTime.Now,
                        .OPNO_ADD = opno,
                        .DATE_ADD = DateTime.Now,
                        .STATUS_ID = 1,
                        .STATUS_NAME = statusname,
                        .IP = ip,
                        .DOCUMENT_ATTACH_NAME = filenameuploadErs,
                        .DOCUMENT_ATTACH_CONTENT_TYPE = doccontentypeErs,
                        .DOCUMENT_ATTACH_DATA = bytesuploadErs
                         }



                    db.TB_MACHINE_DATAs.InsertOnSubmit(insertMc)
                    db.SubmitChanges()
                    'db.Dispose()
                  

                    'SendEmailToSectMgr()
                    'Session.Remove("opnologin")
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "InsertCompletePage1()", True)

            Catch ex As Exception

                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)

                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()

                'Page 1 finish Insert Data Prepare Page 2
                'Function
                DataPage2

                DataPage3
               
                lnksave.Text = "Go to page 2"
             

            End Try


        End Using
    End Sub
    'update data
    Private Sub UpdateData()
        Using db = New DBRISTMCDataContext()
            Try
                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")

                Mcno = Request.QueryString("emcno")
                
                ' Update Statement
                'Dim u = db.TB_MACHINE_DATAs.Where(Function(o) o.MC_NO = Mcno).FirstOrDefault()
                Dim u = db.TB_MACHINE_DATAs.FirstOrDefault(Function (o) o.MC_NO = Mcno)

                If u IsNot Nothing Then

                    u.REGISTER_NEW_MC = chk1.Checked
                    u.CANCEL_MC = chk2.Checked
                    u.CATEGORY1_NEW_MC = chk3.Checked
                    u.CATEGORY1_TF_MC = chk4.Checked

                    u.CATEGORY1_OTH_MC = chk_category1_mc_other.Checked 
                    u.CATEGORY1_MC_OTHER_DETAIL = tb_category1_mc_other.Value 
                    u.CATEGORY2_NEW_MODEL_MC = chk5.Checked 
                    u.CATEGORY2_ORIGINAL_MODEL_MC = chk6.Checked 
                    u.CATEGORY2_OTH_MODEL_MC = chk_category2_mc_other.Checked 
                    u.CATEGORY2_MC_OTHER_DETAIL = tb_category2_mc_other.Value 
                    u.MAKER = tb_maker.Value.ToUpper.Trim() 
                    u.COUNTRY = tb_country.Value.ToUpper.Trim() 
                    u.SUPPLIER = tb_supplier.Value.ToUpper.Trim() 
                    u.PROVIDER = tb_provider.Value.ToUpper.Trim() 
                    u.TEL = tb_tel.Value.Trim()

                    u.SIZE_HP_MC = tb_size_hp_mc.Value.Trim() 
                    u.DANGER_CHEME_1 = chk7.Checked 
                    u.DANGER_CHEME_2 = chk8.Checked 
                    u.DANGER_CHEME_3 = chk9.Checked 
                    u.DANGER_CHEME_4 = chk10.Checked 
                    u.DANGER_CHEME_NAME = tb_cheme_daneger_name.Value.Trim 
                    u.CAS_NO = tb_casno.Value.Trim 
                    u.FLAMMABLE = chk11.Checked
                    u.CORROSIVE = chk12.Checked
                    u.POISON = chk13.Checked
                    u.GAS = chk14.Checked
                    u.SUBSTANCE_OTHER = chk_substanceother.Checked
                    u.SUBSTANCE_OTHER_DETAIL = tb_substanceother_detail.Value.Trim()
                    u.OBJ_POWDER = chk15.Checked
                    u.OBJ_HEAT = chk16.Checked
                    u.OBJ_NOISE = chk17.Checked
                    u.OBJ_VIBRATE = chk18.Checked
                    u.OBJ_POISONGAS = chk19.Checked
                    u.OBJ_WASTE_WATER = chk20.Checked
                    u.OBJ_RAY = chk21.Checked
                    u.OBJ_SMOKE = chk22.Checked
                    u.OBJ_ELECTRIC_WAVE = chk23.Checked
                    u.OBJ_OTHER = chk_objother.Checked
                    u.OBJ_OTHER_DETAIL = tb_objotherdetail.Value.Trim()
                    u.OBJ_CHEME_NAME = tb_objcheme_daneger_name.Value.Trim()
                    u.EQUIPMENT_HELMET = chk24.Checked
                    u.EQUIPMENT_GLASSES = chk25.Checked
                    u.EQUIPMENT_CHEMICAL_MASK = chk26.Checked
                    u.EQUIPMENT_BIB_PROTECT_CHEMECAL = chk27.Checked
                    u.EQUIPMENT_CHEMICAL_GLOVES = chk28.Checked
                    u.EQUIPMENT_HEAT_RESISTANT_GLOVES = chk29.Checked
                    u.EQUIPMENT_CUT_PROTECT_GLOVES = chk30.Checked
                    u.EQUIPMENT_EYE_COVER = chk31.Checked
                    u.EQUIPMENT_FACE_SHIELD = chk32.Checked
                    u.EQUIPMENT_DUST_MASK = chk33.Checked
                    u.EQUIPMENT_CHEMICAL_PACK = chk34.Checked
                    u.EQUIPMENT_ELECTRIC_GLOVES = chk35.Checked
                    u.EQUIPMENT_OTHER = chk_equi_other.Checked
                    u.EQUIPMENT_OTHER_DETAIL = tb_equi_other_detail.Value.Trim
                    u.LAW_MC = chk36.Checked
                    u.LAW_CHEMECALS = chk37.Checked
                    u.LAW_ENVIRONMENTAL = chk38.Checked
                    u.LAW_HIGH_PRESSURE_GAS = chk39.Checked
                    u.LAW_PREVENT_STOP_FIRE = chk40.Checked
                    u.LAW_FACTORY = chk41.Checked
                    u.LAW_FUEL_REGULATORY = chk42.Checked
                    u.LAW_OTHER = chk_rawother.Checked
                    u.LAW_OTHER_DETAIL = tb_rawotherdetail.Value.Trim
                    u.LAW_NAME = tb_rawname.Value.Trim
                    u.LAW_NOTICE = chk_legal_notice.Checked
                    u.LAW_NOTICE_DETAIL = tb_legal_notice.Value.Trim
                    u.LAW_APPROVE = chk_get_legal_approval.Checked
                    u.LAW_APPROVE_DETAIL = tb_get_legal_approval.Value.Trim
                    u.LAW_CHECK = chk_legal_investigation.Checked
                    u.LAW_CHECK_DETAIL = tb_legal_investigation.Value.Trim
                    u.OPNO_UPDATE = opno
                    u.DATE_UPDATE = DateTime.Now

                    ''//Function Save Attach file main 1 

                    'Dim nameupload1 as String = CType(Session("namefile1"), String)
                    'Dim filePathupload1 as String
                    'Dim filenameupload1 As String
                    'Dim fsupload1 As FileStream
                    'Dim brupload1 As BinaryReader
                    'Dim bytesupload1 As Byte()
                    'Dim doccontentype As string

                    'If nameupload1 Isnot Nothing

             
                    '    filePathupload1 = Server.MapPath("upload/" & nameupload1 & "")
                    '    filenameupload1 = Path.GetFileName(filePathupload1)
                    '    fsupload1 = New FileStream(filePathupload1, FileMode.Open, FileAccess.Read)
                    '    brupload1 = New BinaryReader(fsupload1)
                    '    bytesupload1 = brupload1.ReadBytes(Convert.ToInt32(fsupload1.Length))
                    '    doccontentype = "application/pdf"
                    '    brupload1.Close()
                    '    fsupload1.Close()
                      
                    '    u.DOCUMENT_ATTACH_NAME = filenameupload1.Substring(filenameupload1.Length - 20)
                    '    u.DOCUMENT_ATTACH_CONTENT_TYPE = doccontentype
                    '    u.DOCUMENT_ATTACH_DATA = bytesupload1
                    'End If
                    ''//Function Save Attach file main 2

                    'Dim nameupload2 as String = CType(Session("namefile2"), String)
                    'Dim filePathupload2 as String
                    'Dim filenameupload2 As String
                    'Dim fsupload2 As FileStream
                    'Dim brupload2 As BinaryReader
                    'Dim bytesupload2 As Byte()
                    'Dim doccontentype2 As string

                    'If nameupload2 Isnot Nothing

             
                    '    filePathupload2 = Server.MapPath("upload/" & nameupload2 & "")
                    '    filenameupload2 = Path.GetFileName(filePathupload2)
                    '    fsupload2 = New FileStream(filePathupload2, FileMode.Open, FileAccess.Read)
                    '    brupload2 = New BinaryReader(fsupload2)
                    '    bytesupload2 = brupload2.ReadBytes(Convert.ToInt32(fsupload2.Length))
                    '    doccontentype2 = "image/jpeg"
                    '    brupload2.Close()
                    '    fsupload2.Close()

                    '    u.LAYOUT_ATTACH_NAME = filenameupload2.Substring(filenameupload2.Length - 20)
                    '    u.LAYOUT_ATTACH_CONTENT_TYPE = doccontentype2
                    '    u.LAYOUT_ATTACH_DATA = bytesupload2
                    'End If
                    


                
                End If
                
                db.SubmitChanges()
                db.Dispose()

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "UpdateComplete()", True)
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)

                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
        End Using
        
    End Sub

    Private Sub Getdata()
        
        Mcno = Request.QueryString("emcno")
        
        Using db As New DBRISTMCDataContext()
            Try
                

                Dim getdata As IEnumerable(Of TB_MACHINE_DATA) = db.TB_MACHINE_DATAs.Where(Function(r) r.MC_NO = Mcno).ToList()

                If getdata.Any()

                    For Each l In getdata
                        
                        lbmcno.Text = l.MC_NO
                        lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)

                        chk1.Checked = l.REGISTER_NEW_MC
                        chk2.Checked = l.CANCEL_MC
                        chk3.Checked = l.CATEGORY1_NEW_MC
                        chk4.Checked = l.CATEGORY1_TF_MC
                        chk_category1_mc_other.Checked = l.CATEGORY1_OTH_MC
                        If chk_category1_mc_other.Checked = True
                            tb_category1_mc_other.Disabled = False
                        End If
                        tb_category1_mc_other.Value = l.CATEGORY1_MC_OTHER_DETAIL
                        chk5.Checked = l.CATEGORY2_NEW_MODEL_MC
                        chk6.Checked = l.CATEGORY2_ORIGINAL_MODEL_MC
                        chk_category2_mc_other.Checked = l.CATEGORY2_OTH_MODEL_MC
                        if chk_category2_mc_other.Checked = True
                            tb_category2_mc_other.Disabled = False
                        End If
                        tb_category2_mc_other.Value = l.CATEGORY2_MC_OTHER_DETAIL
                        tb_maker.Value = l.MAKER
                        tb_country.Value = l.COUNTRY
                        tb_supplier.Value = l.SUPPLIER
                        tb_provider.Value = l.PROVIDER
                        tb_tel.Value = l.TEL
                        tb_type_mc.Value = l.TYPE_MC
                        tb_size_hp_mc.Value = l.SIZE_HP_MC
                        tb_organize.Value = l.DIVISION + " / " + l.DEPARTMENT + " / " + l.SECTION
                        
                        chk7.Checked = l.DANGER_CHEME_1
                        chk8.Checked = l.DANGER_CHEME_2
                        chk9.Checked = l.DANGER_CHEME_3
                        chk10.Checked = l.DANGER_CHEME_4
                        tb_cheme_daneger_name.Value = l.DANGER_CHEME_NAME
                        tb_casno.Value = l.CAS_NO
                        chk11.Checked = l.FLAMMABLE
                        chk12.Checked = l.CORROSIVE
                        chk13.Checked = l.POISON
                        chk14.Checked = l.GAS
                        chk_substanceother.Checked = l.SUBSTANCE_OTHER
                        if chk_substanceother.Checked =True 
                            tb_substanceother_detail.Disabled = False
                        End If
                        tb_substanceother_detail.Value = l.SUBSTANCE_OTHER_DETAIL
                        chk15.Checked = l.OBJ_POWDER
                        chk16.Checked = l.OBJ_HEAT
                        chk17.Checked = l.OBJ_NOISE
                        chk18.Checked = l.OBJ_VIBRATE
                        chk19.Checked = l.OBJ_POISONGAS
                        chk20.Checked = l.OBJ_WASTE_WATER
                        chk21.Checked = l.OBJ_RAY
                        chk22.Checked = l.OBJ_SMOKE
                        chk23.Checked = l.OBJ_ELECTRIC_WAVE
                        chk_objother.Checked = l.OBJ_OTHER
                        if chk_objother.Checked = True
                            tb_objotherdetail.Disabled = False
                        End If
                        tb_objotherdetail.Value = l.OBJ_OTHER_DETAIL
                        tb_objcheme_daneger_name.Value = l.OBJ_CHEME_NAME
                        chk24.Checked = l.EQUIPMENT_HELMET
                        chk25.Checked = l.EQUIPMENT_GLASSES
                        chk26.Checked = l.EQUIPMENT_CHEMICAL_MASK
                        chk27.Checked = l.EQUIPMENT_BIB_PROTECT_CHEMECAL
                        chk28.Checked = l.EQUIPMENT_CHEMICAL_GLOVES
                        chk29.Checked = l.EQUIPMENT_HEAT_RESISTANT_GLOVES
                        chk30.Checked = l.EQUIPMENT_CUT_PROTECT_GLOVES
                        chk31.Checked = l.EQUIPMENT_EYE_COVER
                        chk32.Checked = l.EQUIPMENT_FACE_SHIELD
                        chk33.Checked = l.EQUIPMENT_DUST_MASK
                        chk34.Checked = l.EQUIPMENT_CHEMICAL_PACK
                        chk35.Checked = l.EQUIPMENT_ELECTRIC_GLOVES
                        chk_equi_other.Checked = l.EQUIPMENT_OTHER
                        If chk_equi_other.Checked = True
                            tb_equi_other_detail.Disabled = False
                        End If
                        tb_equi_other_detail.Value = l.EQUIPMENT_OTHER_DETAIL
                        chk36.Checked = l.LAW_MC
                        chk37.Checked = l.LAW_CHEMECALS
                        chk38.Checked = l.LAW_ENVIRONMENTAL
                        chk39.Checked = l.LAW_HIGH_PRESSURE_GAS
                        chk40.Checked = l.LAW_PREVENT_STOP_FIRE
                        chk41.Checked = l.LAW_FACTORY
                        chk42.Checked = l.LAW_FUEL_REGULATORY
                        chk_rawother.Checked = l.LAW_CHECK
                        If chk_rawother.Checked = True
                            tb_rawotherdetail.Disabled = False
                        End If
                        tb_rawotherdetail.Value = l.LAW_OTHER_DETAIL
                        tb_rawname.Value = l.LAW_NAME
                        chk_legal_notice.Checked = l.LAW_NOTICE
                        If chk_legal_notice.Checked = True
                            tb_legal_notice.Disabled = False
                        End If
                        tb_legal_notice.Value = l.LAW_NOTICE_DETAIL
                        chk_get_legal_approval.Checked = l.LAW_APPROVE
                        If chk_get_legal_approval.Checked = True
                            tb_get_legal_approval.Disabled = False
                        End If
                        tb_get_legal_approval.Value = l.LAW_APPROVE_DETAIL
                        chk_legal_investigation.Checked = l.LAW_CHECK
                        If chk_legal_investigation.Checked = True
                            tb_legal_investigation.Disabled = False
                        End If
                        tb_legal_investigation.Value = l.LAW_CHECK_DETAIL

                       


                        'file for download ERS File
                        If l.DOCUMENT_ATTACH_NAME IsNot "" Then
                            lnkdownloadERS.Visible = True
                            lbnamefileERS.Visible = True
                            lbnamefileERS.Text = l.DOCUMENT_ATTACH_NAME
                        Else 
                            lnkdownloadERS.Visible = False
                            lbnamefileERS.Visible = False
                        End If
                        
                    Next

                Else

                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Nodata()", True)

                End If
            Catch ex As Exception

                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)

                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
            End Try
           

        End Using
    End Sub

    Private Sub Getdatapreview()
        'Dim mcnoz As String
        mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("rmcno")))
        
        Using db As New DBRISTMCDataContext()
            Try
                
                Dim getdata As IEnumerable(Of TB_MACHINE_DATA) = db.TB_MACHINE_DATAs.Where(Function(r) r.MC_NO = Mcno).ToList()

                If getdata.Any()

                    For Each l In getdata
                        lbmcno.Text = l.MC_NO
                        lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)

                        chk1.Checked = l.REGISTER_NEW_MC
                        chk2.Checked = l.CANCEL_MC
                        chk3.Checked = l.CATEGORY1_NEW_MC
                        chk4.Checked = l.CATEGORY1_TF_MC
                        chk_category1_mc_other.Checked = l.CATEGORY1_OTH_MC
                        If chk_category1_mc_other.Checked = True
                            tb_category1_mc_other.Disabled = False
                        End If
                        tb_category1_mc_other.Value = l.CATEGORY1_MC_OTHER_DETAIL
                        chk5.Checked = l.CATEGORY2_NEW_MODEL_MC
                        chk6.Checked = l.CATEGORY2_ORIGINAL_MODEL_MC
                        chk_category2_mc_other.Checked = l.CATEGORY2_OTH_MODEL_MC
                        if chk_category2_mc_other.Checked = True
                            tb_category2_mc_other.Disabled = False
                        End If
                        tb_category2_mc_other.Value = l.CATEGORY2_MC_OTHER_DETAIL
                        tb_maker.Value = l.MAKER
                        tb_country.Value = l.COUNTRY
                        tb_supplier.Value = l.SUPPLIER
                        tb_provider.Value = l.PROVIDER
                        tb_tel.Value = l.TEL
                        tb_type_mc.Value = l.TYPE_MC
                        tb_size_hp_mc.Value = l.SIZE_HP_MC
                        tb_organize.Value = l.DIVISION + " / " + l.DEPARTMENT + " / " + l.SECTION
                       
                        chk7.Checked = l.DANGER_CHEME_1
                        chk8.Checked = l.DANGER_CHEME_2
                        chk9.Checked = l.DANGER_CHEME_3
                        chk10.Checked = l.DANGER_CHEME_4
                        tb_cheme_daneger_name.Value = l.DANGER_CHEME_NAME
                        tb_casno.Value = l.CAS_NO
                        chk11.Checked = l.FLAMMABLE
                        chk12.Checked = l.CORROSIVE
                        chk13.Checked = l.POISON
                        chk14.Checked = l.GAS
                        chk_substanceother.Checked = l.SUBSTANCE_OTHER
                        if chk_substanceother.Checked =True 
                            tb_substanceother_detail.Disabled = False
                        End If
                        tb_substanceother_detail.Value = l.SUBSTANCE_OTHER_DETAIL
                        chk15.Checked = l.OBJ_POWDER
                        chk16.Checked = l.OBJ_HEAT
                        chk17.Checked = l.OBJ_NOISE
                        chk18.Checked = l.OBJ_VIBRATE
                        chk19.Checked = l.OBJ_POISONGAS
                        chk20.Checked = l.OBJ_WASTE_WATER
                        chk21.Checked = l.OBJ_RAY
                        chk22.Checked = l.OBJ_SMOKE
                        chk23.Checked = l.OBJ_ELECTRIC_WAVE
                        chk_objother.Checked = l.OBJ_OTHER
                        if chk_objother.Checked = True
                            tb_objotherdetail.Disabled = False
                        End If
                        tb_objotherdetail.Value = l.OBJ_OTHER_DETAIL
                        tb_objcheme_daneger_name.Value = l.OBJ_CHEME_NAME
                        chk24.Checked = l.EQUIPMENT_HELMET
                        chk25.Checked = l.EQUIPMENT_GLASSES
                        chk26.Checked = l.EQUIPMENT_CHEMICAL_MASK
                        chk27.Checked = l.EQUIPMENT_BIB_PROTECT_CHEMECAL
                        chk28.Checked = l.EQUIPMENT_CHEMICAL_GLOVES
                        chk29.Checked = l.EQUIPMENT_HEAT_RESISTANT_GLOVES
                        chk30.Checked = l.EQUIPMENT_CUT_PROTECT_GLOVES
                        chk31.Checked = l.EQUIPMENT_EYE_COVER
                        chk32.Checked = l.EQUIPMENT_FACE_SHIELD
                        chk33.Checked = l.EQUIPMENT_DUST_MASK
                        chk34.Checked = l.EQUIPMENT_CHEMICAL_PACK
                        chk35.Checked = l.EQUIPMENT_ELECTRIC_GLOVES
                        chk_equi_other.Checked = l.EQUIPMENT_OTHER
                        If chk_equi_other.Checked = True
                            tb_equi_other_detail.Disabled = False
                        End If
                        tb_equi_other_detail.Value = l.EQUIPMENT_OTHER_DETAIL
                        chk36.Checked = l.LAW_MC
                        chk37.Checked = l.LAW_CHEMECALS
                        chk38.Checked = l.LAW_ENVIRONMENTAL
                        chk39.Checked = l.LAW_HIGH_PRESSURE_GAS
                        chk40.Checked = l.LAW_PREVENT_STOP_FIRE
                        chk41.Checked = l.LAW_FACTORY
                        chk42.Checked = l.LAW_FUEL_REGULATORY
                        chk_rawother.Checked = l.LAW_CHECK
                        If chk_rawother.Checked = True
                            tb_rawotherdetail.Disabled = False
                        End If
                        tb_rawotherdetail.Value = l.LAW_OTHER_DETAIL
                        tb_rawname.Value = l.LAW_NAME
                        chk_legal_notice.Checked = l.LAW_NOTICE
                        If chk_legal_notice.Checked = True
                            tb_legal_notice.Disabled = False
                        End If
                        tb_legal_notice.Value = l.LAW_NOTICE_DETAIL
                        chk_get_legal_approval.Checked = l.LAW_APPROVE
                        If chk_get_legal_approval.Checked = True
                            tb_get_legal_approval.Disabled = False
                        End If
                        tb_get_legal_approval.Value = l.LAW_APPROVE_DETAIL
                        chk_legal_investigation.Checked = l.LAW_CHECK
                        If chk_legal_investigation.Checked = True
                            tb_legal_investigation.Disabled = False
                        End If
                        tb_legal_investigation.Value = l.LAW_CHECK_DETAIL



                    Next

                Else

                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Nodata()", True)

                End If
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)

                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
            End Try
           

        End Using
    End Sub
    'Protected Sub DownloadFile
       
       
            
    '        Using db As New  DBRISTMCDataContext
    '            Try
    '                Mcno = Request.QueryString("emcno")
    '                Dim file = db.TB_MACHINE_DATAs.FirstOrDefault(Function (f) f.MC_NO.Equals(Mcno))

    '                If file IsNot Nothing Then
    '                    Response.ContentType = file.DOCUMENT_ATTACH_CONTENT_TYPE
    '                    Response.AddHeader("content-disposition", "attachment; filename=" & file.DOCUMENT_ATTACH_NAME)
    '                    Response.BinaryWrite(file.DOCUMENT_ATTACH_DATA)
    '                    Response.Flush()
    '                    Response.[End]()
    '                End If
    '            Catch ex As Exception
    '                Dim message As String = $"Message: {ex.Message}\n\n"
    '                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
    '                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
    '                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

    '                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
    '            Finally
    '                db.Dispose()
    '            End Try
                
    '        End Using
       
            
       
    'End Sub
    'Protected Sub DownloadFileLayout
       
       
            
    '        Using db As New  DBRISTMCDataContext
    '            Try
    '                Mcno = Request.QueryString("emcno")
    '                Dim file = db.TB_MACHINE_DATAs.FirstOrDefault(Function (f) f.MC_NO.Equals(Mcno))

    '                If file IsNot Nothing Then
    '                    Response.ContentType = file.LAYOUT_ATTACH_CONTENT_TYPE
    '                    Response.AddHeader("content-disposition", "attachment; filename=" & file.LAYOUT_ATTACH_NAME)
    '                    Response.BinaryWrite(file.LAYOUT_ATTACH_DATA)
    '                    Response.Flush()
    '                    Response.[End]()
    '                End If
    '            Catch ex As Exception
    '                Dim message As String = $"Message: {ex.Message}\n\n"
    '                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
    '                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
    '                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

    '                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

    '            Finally
    '                db.Dispose()
    '            End Try
                
    '        End Using
       
            
       
    'End Sub
    'Protected Sub DownloadFile
    '    Try
    '        using db As New DBRISTMCDataContext
    '            Dim bytes As Byte
    '            Dim filename As String, contentType As String
    '            Dim getfile = From doc In db.TB_MACHINE_DATAs
    '                    Where doc.MC_NO = Mcno
    '                    Select New With{doc.MC_NO,doc.DOCUMENT_ATTACH_DATA,doc.DOCUMENT_ATTACH_NAME,doc.DOCUMENT_ATTACH_CONTENT_TYPE}
    '            If getfile Is Nothing

    '                else
    '                    For Each x In getfile

    '                        'CType(linqBinaryField.ToArray(), Byte())
    '                        bytes = x.DOCUMENT_ATTACH_DATA.ToArray()
    '                    'bytes = CType(record.First().FileData.ToArray(), Byte())
    '                    'bytes = x.DOCUMENT_ATTACH_DATA
    '                    contentType = x.DOCUMENT_ATTACH_CONTENT_TYPE
    '                        filename = x.DOCUMENT_ATTACH_NAME

    '                        Response.Clear()
    '                        Response.Buffer = True
    '                        Response.Charset = ""
    '                        Response.Cache.SetCacheability(HttpCacheability.NoCache)
    '                        Response.ContentType = contentType
    '                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
    '                        Response.BinaryWrite(x.DOCUMENT_ATTACH_DATA)
    '                        Response.Flush()
    '                        Response.End()
    '                    Next
                    
    '            End If                                
    '        End Using
    '    Catch ex As Exception

    '    End Try
    '    'Dim id As Integer = Integer.Parse(TryCast(sender, LinkButton).CommandArgument)
    '    'Dim bytes As Byte()
    '    'Dim fileName As String, contentType As String
    '    'Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    'Using con As New SqlConnection(constr)
    '    '    Using cmd As New SqlCommand()
    '    '        cmd.CommandText = "select Name, Data, ContentType from tblFiles where Id=@Id"
    '    '        cmd.Parameters.AddWithValue("@Id", id)
    '    '        cmd.Connection = con
    '    '        con.Open()
    '    '        Using sdr As SqlDataReader = cmd.ExecuteReader()
    '    '            sdr.Read()
    '    '            bytes = DirectCast(sdr("Data"), Byte())
    '    '            contentType = sdr("ContentType").ToString()
    '    '            fileName = sdr("Name").ToString()
    '    '        End Using
    '    '        con.Close()
    '    '    End Using
    '    'End Using
    '    'Response.Clear()
    '    'Response.Buffer = True
    '    'Response.Charset = ""
    '    'Response.Cache.SetCacheability(HttpCacheability.NoCache)
    '    'Response.ContentType = contentType
    '    'Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
    '    'Response.BinaryWrite(bytes)
    '    'Response.Flush()
    '    'Response.End()
    'End Sub
    Protected Sub TestAlert()
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "InsertComplete()", True)
    End Sub

    Private Sub SendEmailToRequest()
        Dim username As String = String.Empty
       
        Dim email As String = String.Empty
        Dim rmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Dim opnocookie As HttpCookie = Request.Cookies("opno")
        Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
       
        Using db As New DBRISTMCDataContext()

            Try
                Dim getemail As IEnumerable(Of User) = db.Users.Where(Function(o) o.OperatorNo = opno).ToList()

                For Each n In getemail
                    username = n.Username
                    email = n.Email
                    'password = n.Password

                Next

                If Not String.IsNullOrEmpty(email) Then
                    BindGrid
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvDetailsMcno.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", email)
                            mm.Subject = "Your Machine Register No " & Mcno 
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Your machine register no. " & Mcno & "<br /><br />
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/Main.aspx?rmcno={1} '>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", username, rmcno)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                   End Using
                    
                Else
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "RecoverypasswordNotComplete()", True)
                  
                End If

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
           
            
        End Using


        
    End Sub

    Private sub SendEmailToSectMgr
        Dim emailsectEnc As string 
        Dim emailsect As string 
        Dim opnosect As string
        Dim sectmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try
                'searchflow step for sectmgr with req opno
                Dim opreq As String = String.Empty

               

                Dim reqno = db.TB_MACHINE_DATAs.Where(Function(x) x.MC_NO = Mcno).Select(Function(x) New With{x.OPNO_ADD})

                For Each x In reqno
                    opreq = x.OPNO_ADD
                Next


               
                Dim s = db.TB_FLOW_REQUESTs.Where(Function(x) x.REQUEST_OP = opreq)


                For Each e In s
                    
                    opnosect = e.SECT_MGR_STAMP
                    emailsect = e.SECT_MGR_EMAIL
                    emailsectEnc = HttpUtility.UrlEncode(Encrypt(e.SECT_MGR_EMAIL))
                    
                    BindGridForMgr
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emailsect)
                            mm.Subject = "Machine Register No. "& Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Sect.Mgr Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/Main.aspx?smcno={1}&semail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnosect, sectmcno, emailsectEnc)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                    End Using
                   
                Next

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True) 
            Finally
                db.Dispose()
            End Try
        End Using
    End sub

    Private sub SendEmailToDeptMgr
        Dim emaildeptEnc As string = String.Empty
        Dim emaildept As string = String.Empty
        Dim opnodept As string = String.Empty
        Dim deptmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try
                
                Dim opreq As String

                Dim reqno = db.TB_MACHINE_DATAs.Where(Function(c) c.MC_NO = Mcno).Select(Function(x) New With{x.OPNO_ADD}).ToList()

                For Each x In reqno
                    opreq = x.OPNO_ADD
                Next

               

                Dim d = db.TB_FLOW_REQUESTs.Where(Function(c) c.REQUEST_OP = opreq).ToList()


                For Each e In d
                    opnodept = e.DEPT_MGR_STAMP
                    emaildept = e.DEPT_MGR_EMAIL
                    emaildeptEnc = HttpUtility.UrlEncode(Encrypt(e.DEPT_MGR_EMAIL))
                    
                    BindGridForMgr
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emaildept)
                            mm.Subject = "Machine Register No. "& Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Dept.Mgr Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/Main.aspx?dmcno={1}&demail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnodept, deptmcno, emaildeptEnc)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                    End Using
                   
                Next

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
        End Using
    End sub

    Private sub SendEmailToDivMgr
        Dim emaildivEnc As string = String.Empty
        Dim emaildiv As string = String.Empty
        Dim opnodiv As string = String.Empty
        Dim divmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try
                'searchflow step for divmgr with req opno
                Dim opreq As String
                Dim reqno = From c In db.TB_MACHINE_DATAs
                        Where c.MC_NO = Mcno
                        Select New With {c.OPNO_ADD}
                         
                For Each x In reqno
                    opreq = x.OPNO_ADD
                Next

                Dim d = From t In db.TB_FLOW_REQUESTs
                        Where t.REQUEST_OP = opreq
                        Select t

                For Each e In d
                    opnodiv = e.DIV_MGR_OP
                    emaildiv = e.DIV_MGR_EMAIL
                    emaildivEnc = HttpUtility.UrlEncode(Encrypt(e.DIV_MGR_EMAIL))
                    
                    BindGridForMgr
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emaildiv)
                            mm.Subject = "Machine Register No. "& Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Division Manager Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/Main.aspx?dimcno={1}&diemail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnodiv, divmcno, emaildivEnc)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                    End Using
                   
                Next

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
        End Using
    End sub

    Private sub SendEmailToSubCom
        Dim emailSubcomEnc As string = String.Empty
        Dim emailSubcom As string = String.Empty
        Dim opnoSubcom As string = String.Empty
        Dim Subcommcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try
                

                Dim d = From t In db.TB_FLOW_SAFETies Select t

                For Each e In d
                    opnoSubcom = e.MCESUBCOM_OP
                    emailSubcom = e.MCESUBCOM_EMAIL
                    emailSubcomEnc = HttpUtility.UrlEncode(Encrypt(e.MCESUBCOM_EMAIL))
                    
                    BindGridForMgr
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emailSubcom)
                            mm.Subject = "Machine Register No. "& Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Sub-Com Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/Main.aspx?scmcno={1}&scemail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnoSubcom, Subcommcno, emailSubcomEnc)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                    End Using
                   
                Next

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
        End Using
    End sub

    Private sub SendEmailToSafetyOfficer
        Dim emailSfofficerEnc As string = String.Empty
        Dim emailSfofficer As string = String.Empty
        Dim opnoSfofficer As string = String.Empty
        Dim Sfofficermcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try
                

                Dim d = From t In db.TB_FLOW_SAFETies Select t

                For Each e In d
                    opnoSfofficer = e.SAFETYOFF_OP
                    emailSfofficer = e.SAFETYOFF_EMAIL
                    emailSfofficerEnc = HttpUtility.UrlEncode(Encrypt(e.SAFETYOFF_EMAIL))
                    
                    BindGridForMgr
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emailSfofficer)
                            mm.Subject = "Machine Register No. "& Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Safety Officer Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/Main.aspx?sfmcno={1}&sfemail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnoSfofficer, Sfofficermcno, emailSfofficerEnc)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                    End Using
                   
                Next

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
        End Using
    End sub

    Private sub SendEmailToSafetyMgr
        Dim emailSfmgrEnc As string = String.Empty
        Dim emailSfmgr As string = String.Empty
        Dim opnoSfmgr As string = String.Empty
        Dim Sfmgrmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try
                
                Dim d = db.TB_FLOW_SAFETies.ToList()
                'Dim d = From t In db.TB_FLOW_SAFETies Select t

                For Each e In d
                    opnoSfmgr = e.SAFETYMGR_OP
                    emailSfmgr = e.SAFETYMGR_EMAIL
                    emailSfmgrEnc = HttpUtility.UrlEncode(Encrypt(e.SAFETYMGR_EMAIL))
                    
                    BindGridForMgr
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emailSfmgr)
                            mm.Subject = "Machine Register No. "& Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Safety Mgr. Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/Main.aspx?sfmgrmcno={1}&sfmgremail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnoSfmgr, Sfmgrmcno, emailSfmgrEnc)
                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "10.29.1.240"
                            smtp.EnableSsl = False
                            Dim networkCred As New NetworkCredential()
                            networkCred.UserName = "RISTMCSYSTEM@rist.local"
                            networkCred.Password = "Rist2018"
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = networkCred
                            smtp.Port = 25
                            smtp.Send(mm)
                        End Using
                    End Using
                   
                Next

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
        End Using
    End sub

    Private Sub BindGrid()
        Using db As New DBRISTMCDataContext()
            Try
                gvDetailsMcno.DataSource = From m In db.TB_MACHINE_DATAs
                    Where m.MC_NO = Mcno
                    Select New with {m.MC_NO, m.MAKER, m.COUNTRY, m.SUPPLIER, m.PROVIDER, m.TEL, 
                        m.DIVISION, m.DEPARTMENT, m.SECTION, m.REGISTER_DATE}
                gvDetailsMcno.DataBind()
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
            
        End Using
    End Sub
    Private Sub BindGridForMgr()
        Using db As New DBRISTMCDataContext()
            Try
                gvmailapprove.DataSource = From m In db.TB_MACHINE_DATAs
                    Where m.MC_NO = Mcno
                    Select New with {m.MC_NO, m.MAKER, m.COUNTRY, m.SUPPLIER, m.PROVIDER, m.TEL, 
                        m.DIVISION, m.DEPARTMENT, m.SECTION, m.REGISTER_DATE,m.TYPE_MC,m.STATUS_NAME}
                gvmailapprove.DataBind()
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
            
        End Using
    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub
    Private Shared Function Encrypt(clearText As String) As String
        Dim EncryptionKey As String = "RISTMC18NOVSYS"
        Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
                                                                         &H65, &H64, &H76, &H65, &H64, &H65, _
                                                                         &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
                    cs.Write(clearBytes, 0, clearBytes.Length)
                    cs.Close()
                End Using
                clearText = Convert.ToBase64String(ms.ToArray())
            End Using
        End Using
        Return clearText
    End Function
    Private Shared Function Decrypt(cipherText As String) As String
        Const encryptionKey As String = "RISTMC18NOVSYS"
        'If cipherText Is Nothing 
        '    Exit Function
        'Else 
            cipherText = cipherText.Replace(" ", "+")
        'End If
       
        Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(encryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
                                                                         &H65, &H64, &H76, &H65, &H64, &H65, _
                                                                         &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write)
                    cs.Write(cipherBytes, 0, cipherBytes.Length)
                    cs.Close()
                End Using
                cipherText = Encoding.Unicode.GetString(ms.ToArray())
            End Using
        End Using
        Return cipherText
    End Function

    Private Sub GetdataforMgr()
        
        
        Using db As New DBRISTMCDataContext()
            Try
                'select condition
                Dim getdata = From d In db.TB_MACHINE_DATAs
                        Where d.MC_NO = Mcno 
                        Select d

                If getdata.Any()

                    For Each l In getdata

                        Select l.STATUS_ID
                            Case 1
                                lbmcno.Text = l.MC_NO
                                lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)
                                lnksave.Visible = True
                            Case 2
                                lbmcno.Text = l.MC_NO
                                lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)
                                lnksave.Visible = True
                            Case 3
                                lbmcno.Text = l.MC_NO
                                lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)
                                lnksave.Visible = True
                            Case 4
                                lbmcno.Text = l.MC_NO
                                lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)
                                lnksave.Visible = True
                            Case 5
                                lbmcno.Text = l.MC_NO
                                lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)
                                lnksave.Visible = True
                            Case 6
                                lbmcno.Text = l.MC_NO
                                lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)
                                lnksave.Visible = True
                            Case 7
                                lbmcno.Text = l.MC_NO
                                lbstatus.Text = "Status : " & Mid(l.STATUS_NAME, 2)
                                lnksave.Visible = True
                        End Select
                      
                        chk1.Checked = l.REGISTER_NEW_MC
                        chk2.Checked = l.CANCEL_MC
                        chk3.Checked = l.CATEGORY1_NEW_MC
                        chk4.Checked = l.CATEGORY1_TF_MC
                        chk_category1_mc_other.Checked = l.CATEGORY1_OTH_MC
                        If chk_category1_mc_other.Checked = True
                            tb_category1_mc_other.Disabled = False
                        End If
                        tb_category1_mc_other.Value = l.CATEGORY1_MC_OTHER_DETAIL
                        chk5.Checked = l.CATEGORY2_NEW_MODEL_MC
                        chk6.Checked = l.CATEGORY2_ORIGINAL_MODEL_MC
                        chk_category2_mc_other.Checked = l.CATEGORY2_OTH_MODEL_MC
                        if chk_category2_mc_other.Checked = True
                            tb_category2_mc_other.Disabled = False
                        End If
                        tb_category2_mc_other.Value = l.CATEGORY2_MC_OTHER_DETAIL
                        tb_maker.Value = l.MAKER
                        tb_country.Value = l.COUNTRY
                        tb_supplier.Value = l.SUPPLIER
                        tb_provider.Value = l.PROVIDER
                        tb_tel.Value = l.TEL
                        tb_type_mc.Value = l.TYPE_MC
                        tb_size_hp_mc.Value = l.SIZE_HP_MC
                        tb_organize.Value = l.DIVISION + " / " + l.DEPARTMENT + " / " + l.SECTION
                        'tb_name_mc.Value = l.MC_NAME
                        'tb_mcno1.Value = l.MC_NO1
                        'tb_mcno2.Value = l.MC_NO2
                        'tb_mcno3.Value = l.MC_NO3
                        'tb_mcno4.Value = l.MC_NO4
                        'tb_mcno5.Value = l.MC_NO5
                        'tb_mcno6.Value = l.MC_NO6
                        'tb_mcno7.Value = l.MC_NO7
                        'tb_mcno8.Value = l.MC_NO8
                        'tb_mcno9.Value = l.MC_NO9
                        'tb_mcno10.Value = l.MC_NO10
                        chk7.Checked = l.DANGER_CHEME_1
                        chk8.Checked = l.DANGER_CHEME_2
                        chk9.Checked = l.DANGER_CHEME_3
                        chk10.Checked = l.DANGER_CHEME_4
                        tb_cheme_daneger_name.Value = l.DANGER_CHEME_NAME
                        tb_casno.Value = l.CAS_NO
                        chk11.Checked = l.FLAMMABLE
                        chk12.Checked = l.CORROSIVE
                        chk13.Checked = l.POISON
                        chk14.Checked = l.GAS
                        chk_substanceother.Checked = l.SUBSTANCE_OTHER
                        if chk_substanceother.Checked =True 
                            tb_substanceother_detail.Disabled = False
                        End If
                        tb_substanceother_detail.Value = l.SUBSTANCE_OTHER_DETAIL
                        chk15.Checked = l.OBJ_POWDER
                        chk16.Checked = l.OBJ_HEAT
                        chk17.Checked = l.OBJ_NOISE
                        chk18.Checked = l.OBJ_VIBRATE
                        chk19.Checked = l.OBJ_POISONGAS
                        chk20.Checked = l.OBJ_WASTE_WATER
                        chk21.Checked = l.OBJ_RAY
                        chk22.Checked = l.OBJ_SMOKE
                        chk23.Checked = l.OBJ_ELECTRIC_WAVE
                        chk_objother.Checked = l.OBJ_OTHER
                        if chk_objother.Checked = True
                            tb_objotherdetail.Disabled = False
                        End If
                        tb_objotherdetail.Value = l.OBJ_OTHER_DETAIL
                        tb_objcheme_daneger_name.Value = l.OBJ_CHEME_NAME
                        chk24.Checked = l.EQUIPMENT_HELMET
                        chk25.Checked = l.EQUIPMENT_GLASSES
                        chk26.Checked = l.EQUIPMENT_CHEMICAL_MASK
                        chk27.Checked = l.EQUIPMENT_BIB_PROTECT_CHEMECAL
                        chk28.Checked = l.EQUIPMENT_CHEMICAL_GLOVES
                        chk29.Checked = l.EQUIPMENT_HEAT_RESISTANT_GLOVES
                        chk30.Checked = l.EQUIPMENT_CUT_PROTECT_GLOVES
                        chk31.Checked = l.EQUIPMENT_EYE_COVER
                        chk32.Checked = l.EQUIPMENT_FACE_SHIELD
                        chk33.Checked = l.EQUIPMENT_DUST_MASK
                        chk34.Checked = l.EQUIPMENT_CHEMICAL_PACK
                        chk35.Checked = l.EQUIPMENT_ELECTRIC_GLOVES
                        chk_equi_other.Checked = l.EQUIPMENT_OTHER
                        If chk_equi_other.Checked = True
                            tb_equi_other_detail.Disabled = False
                        End If
                        tb_equi_other_detail.Value = l.EQUIPMENT_OTHER_DETAIL
                        chk36.Checked = l.LAW_MC
                        chk37.Checked = l.LAW_CHEMECALS
                        chk38.Checked = l.LAW_ENVIRONMENTAL
                        chk39.Checked = l.LAW_HIGH_PRESSURE_GAS
                        chk40.Checked = l.LAW_PREVENT_STOP_FIRE
                        chk41.Checked = l.LAW_FACTORY
                        chk42.Checked = l.LAW_FUEL_REGULATORY
                        chk_rawother.Checked = l.LAW_CHECK
                        If chk_rawother.Checked = True
                            tb_rawotherdetail.Disabled = False
                        End If
                        tb_rawotherdetail.Value = l.LAW_OTHER_DETAIL
                        tb_rawname.Value = l.LAW_NAME
                        chk_legal_notice.Checked = l.LAW_NOTICE
                        If chk_legal_notice.Checked = True
                            tb_legal_notice.Disabled = False
                        End If
                        tb_legal_notice.Value = l.LAW_NOTICE_DETAIL
                        chk_get_legal_approval.Checked = l.LAW_APPROVE
                        If chk_get_legal_approval.Checked = True
                            tb_get_legal_approval.Disabled = False
                        End If
                        tb_get_legal_approval.Value = l.LAW_APPROVE_DETAIL
                        chk_legal_investigation.Checked = l.LAW_CHECK
                        If chk_legal_investigation.Checked = True
                            tb_legal_investigation.Disabled = False
                        End If
                        tb_legal_investigation.Value = l.LAW_CHECK_DETAIL
                           

                    Next

                Else

                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Nodata()", True)

                End If
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
            End Try
           

        End Using
    End Sub
    Protected Sub DisableControls(parent As Control, state As Boolean)
        For Each c As Control In parent.Controls
            Dim checkBox  = TryCast(c, CheckBox)
            If (checkBox IsNot Nothing)
                checkBox.Enabled = state
            End If

            DisableControls(c, state)
        Next
    End Sub
    '1-Section mgr Approve
    Private Sub ApproveSectmgr()
        Dim emailsect = Decrypt(HttpUtility.UrlDecode(Request.QueryString("semail")))
        Using db As New DBRISTMCDataContext
            Try
                'get op req from tb machine data
                Dim opnoreq As String = String.Empty
                Dim q = From t In db.TB_MACHINE_DATAs
                        Where t.MC_NO = Mcno
                        Select t

                For Each o In q
                    opnoreq = o.OPNO_ADD
                Next
                'get flow sectmgr approve
                Dim sectmgrname As String
                Dim sect = From f In db.TB_FLOW_REQUESTs
                           Where f.REQUEST_OP = opnoreq And f.SECT_MGR_EMAIL = emailsect
                           Select f

                For Each a In sect
                    sectmgrname = a.SECT_MGR_STAMP
                Next

                Dim s As TB_MACHINE_DATA = (From u In db.TB_MACHINE_DATAs Where u.MC_NO = Mcno Select u).FirstOrDefault()
                s.SECT_MGR_NAME_APPROVE = sectmgrname
                s.SECT_MGR_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 2
                s.STATUS_NAME = "@Sect.Mgr Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
                SendEmailToDeptMgr
            End Try
        End Using
    End Sub
    '2-Department mgr Approve
    Private Sub ApproveDeptmgr()
        Dim emaildept = Decrypt(HttpUtility.UrlDecode(Request.QueryString("demail")))
        Using db As New DBRISTMCDataContext
            Try
                'get op req from tb machine data
                Dim opnoreq As String = String.Empty
                Dim q = From t In db.TB_MACHINE_DATAs
                        Where t.MC_NO = Mcno
                        Select t

                For Each o In q
                    opnoreq = o.OPNO_ADD
                Next
                'get flow deptmgr approve
                Dim deptmgrname As String
                Dim dept = From f In db.TB_FLOW_REQUESTs
                           Where f.REQUEST_OP = opnoreq And f.DEPT_MGR_EMAIL = emaildept
                           Select f

                For Each a In dept
                    deptmgrname = a.DEPT_MGR_STAMP
                Next

                Dim s As TB_MACHINE_DATA = (From u In db.TB_MACHINE_DATAs Where u.MC_NO = Mcno Select u).FirstOrDefault()
                s.DEPT_MGR_NAME_APPROVE = deptmgrname
                s.DEPT_MGR_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 3
                s.STATUS_NAME = "@Dept.Mgr Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
                SendEmailToDivMgr
            End Try
        End Using
    End Sub
    '3-Division mgr Approve
    Private Sub ApproveDivmgr()
        Dim emaildiv = Decrypt(HttpUtility.UrlDecode(Request.QueryString("diemail")))
        Using db As New DBRISTMCDataContext
            Try
                'get op req from tb machine data
                Dim opnoreq As String = String.Empty
                Dim q = From t In db.TB_MACHINE_DATAs
                        Where t.MC_NO = Mcno
                        Select t

                For Each o In q
                    opnoreq = o.OPNO_ADD
                Next
                'get flow deptmgr approve
                Dim divmgrname As String
                Dim div = From f In db.TB_FLOW_REQUESTs
                           Where f.REQUEST_OP = opnoreq And f.DIV_MGR_EMAIL = emaildiv
                           Select f

                For Each a In div
                    divmgrname = a.DIV_MGR_STAMP
                Next

                Dim s As TB_MACHINE_DATA = (From u In db.TB_MACHINE_DATAs Where u.MC_NO = Mcno Select u).FirstOrDefault()
                s.DIV_MGR_NAME_APPROVE = divmgrname
                s.DIV_MGR_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 4
                s.STATUS_NAME = "@Div.Mgr Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
                SendEmailToSubCom
            End Try
        End Using
    End Sub
    '4-Sub-Com Approve
    Private Sub ApproveSubCom()
        Dim emailsubcom = Decrypt(HttpUtility.UrlDecode(Request.QueryString("scemail")))
        Using db As New DBRISTMCDataContext
            Try
                
                Dim subcomname As String
                Dim subcom = From f In db.TB_FLOW_SAFETies
                           Where f.MCESUBCOM_EMAIL = emailsubcom
                           Select f

                For Each a In subcom
                    subcomname = a.MCESUBCOM_STAMP
                Next

                Dim s As TB_MACHINE_DATA = (From u In db.TB_MACHINE_DATAs Where u.MC_NO = Mcno Select u).FirstOrDefault()
                s.MCEQ_SUBCOM_NAME_APPROVE = subcomname
                s.MCEQ_SUBCOM_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 5
                s.STATUS_NAME = "@Sub-Com Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
                SendEmailToSafetyOfficer
            End Try
        End Using
    End Sub
    '4-Sub-Com Approve
    Private Sub ApproveSafetyOfficer()
        Dim emailsfofficer = Decrypt(HttpUtility.UrlDecode(Request.QueryString("sfemail")))
        Using db As New DBRISTMCDataContext
            Try
                
                Dim sfname As String
                Dim safetyofficer = From f In db.TB_FLOW_SAFETies
                           Where f.SAFETYOFF_EMAIL = emailsfofficer
                           Select f

                For Each a In safetyofficer
                    sfname = a.SAFETYOFF_STAMP
                Next

                Dim s As TB_MACHINE_DATA = (From u In db.TB_MACHINE_DATAs Where u.MC_NO = Mcno Select u).FirstOrDefault()
                s.SAFETY_OFFICER_NAME_APPROVE = sfname
                s.SAFETY_OFFICER_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 6
                s.STATUS_NAME = "@Safety Officer Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
                SendEmailToSafetyMgr
            End Try
        End Using
    End Sub
    Private Sub ApproveSafetyMgr()
        Dim emailsfmgr = Decrypt(HttpUtility.UrlDecode(Request.QueryString("sfmgremail")))
        Using db As New DBRISTMCDataContext
            Try
                
                Dim sfmgrname As String
                Dim safetymgr = From f In db.TB_FLOW_SAFETies
                           Where f.SAFETYMGR_EMAIL = emailsfmgr
                           Select f

                For Each a In safetymgr
                    sfmgrname = a.SAFETYMGR_STAMP
                Next

                Dim s As TB_MACHINE_DATA = (From u In db.TB_MACHINE_DATAs Where u.MC_NO = Mcno Select u).FirstOrDefault()
                s.SAFETY_MGR_NAME_APPROVE = sfmgrname
                s.SAFETY_MGR_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 7
                s.STATUS_NAME = "@Safety Mgr Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()
                SendEmailToSafetyMgr
            End Try
        End Using
    End Sub

    Private Sub DataPage2()
        Using db As New DBRISTMCDataContext

            Dim ipcookie As HttpCookie = Request.Cookies("ip")
            Dim ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")
            Dim opnocookie As HttpCookie = Request.Cookies("opno")
            Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
                

           
            Try

                'loop title 4
                For  t = 1 To 5 -1
                    'loop title_no 8
                    For i = 1 To 9 - 1
                        Dim dbp2 = New TB_EQUIPMENT_CHECK With {
                                .MC_NO = Mcno,
                                .Title = t,
                                .Title_No = i,
                                .Detail_topic = "",
                                .Number = 0,
                                .IsSelected = False,
                                .IP = ip,
                                .OPNO_ADD = opno,
                                .DATE_ADD = DateTime.Now,
                                .OPNO_UPDATE = "000000",
                                .DATE_UPDATE = DateTime.Now,
                                .FLAG = 0
                                }

                        db.TB_EQUIPMENT_CHECKs.InsertOnSubmit(dbp2)
                        db.SubmitChanges()
                    Next
                Next
                Dim p2B = New TB_EQUIPMENT_DETAIL With{
                        .MC_NO = Mcno,
                        .MC_NAME = "",
                        .MC_NUMBER = "",
                        .DIVISION = "",
                        .DEPARTMENT = "",
                        .SECTION = "",
                        .IP = ip,
                        .OPNO_ADD = opno,
                        .DATE_ADD = DateTime.Now,
                        .OPNO_UPDATE = "000000",
                        .DATE_UPDATE = DateTime.Now,
                        .FLAG = 0
                        }
                        db.TB_EQUIPMENT_DETAILs.InsertOnSubmit(p2B)
                        db.SubmitChanges()

            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()

                'Create a Cookie with a suitable Key.
                Dim mcnoCookie As New HttpCookie("ep2mcno")
 
                'Set the Cookie value.
                mcnoCookie.Values("ep2mcno") = Mcno
 
                'Set the Expiry date.
                mcnoCookie.Expires = DateTime.Now.AddHours(1)
 
                'Add the Cookie to Browser.
                Response.Cookies.Add(mcnoCookie)
                'btnpage2.Disabled = False
                lbmcno.Text = Mcno
               
            End Try
        End Using
    End Sub
    

    Private Sub DataPage3()
        Using db As New DBRISTMCDataContext

            Dim ipcookie As HttpCookie = Request.Cookies("ip")
            Dim ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")
            Dim opnocookie As HttpCookie = Request.Cookies("opno")
            Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
                

           
            Try
                
                Dim p3 = New TB_MACHINE_TOOL_CHECK_P3()


                Dim dt As Date


                p3.MC_NO = Mcno
                p3.OPNO_ADD = opno
                p3.DATE_ADD = DateTime.Now
                p3.IP = ip

                db.TB_MACHINE_TOOL_CHECK_P3s.InsertOnSubmit(p3)
                db.SubmitChanges()


            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)

            Finally
                db.Dispose()

                'Create a Cookie with a suitable Key.
                Dim mcnoCookie As New HttpCookie("ep3mcno")
 
                'Set the Cookie value.
                mcnoCookie.Values("ep3mcno") = Mcno
 
                'Set the Expiry date.
                mcnoCookie.Expires = DateTime.Now.AddHours(1)
 
                'Add the Cookie to Browser.
                Response.Cookies.Add(mcnoCookie)
              
                lbmcno.Text = Mcno
               
            End Try
        End Using
    End Sub

    Protected Sub DownloadFileErs
       
        Using db As New  DBRISTMCDataContext
            Try
                Mcno = Request.QueryString("emcno")
                Dim getfile As IEnumerable(Of TB_MACHINE_DATA) = db.TB_MACHINE_DATAs.Where(Function(r) r.MC_NO = Mcno).ToList()
                If getfile IsNot Nothing Then

                    For Each file In getfile

                        Response.ContentType = file.DOCUMENT_ATTACH_CONTENT_TYPE
                        Response.AddHeader("content-disposition", "attachment; filename=" & file.DOCUMENT_ATTACH_NAME)
                        Response.BinaryWrite(file.DOCUMENT_ATTACH_DATA)
                        Response.Flush()
                        Response.[End]()
                    Next
                    
                   
                    'Response.Flush()
                    'Response.[End]()
                End If
            Catch unusedThreadAbortException1 As Threading.ThreadAbortException
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
                
        End Using

    End Sub
    

End Class