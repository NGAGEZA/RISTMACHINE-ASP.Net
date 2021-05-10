Option Explicit On
Option Strict On

Imports System.IO
Imports Oracle.DataAccess.Client

Public Class EquipmentCheck
    Inherits Page
    Private Property Mcno() As String
    Private Property Status() As String
    Dim ReadOnly _conStrDbhrms As String = ConfigurationManager.ConnectionStrings("CONN_HRMS").ConnectionString

    Private Property Divdeptsec() As String
    Private Property Division() As String
    Private Property Department() As String
    Private Property Section() As String

    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()

            Else
            'Getdata for edit Page 2
            If Not String.IsNullOrEmpty(Request.QueryString("ep2mcno")) Then

                Mcno = Request.QueryString("ep2mcno")

                Select Case CheckStatus(Mcno)

                    Case 0 '0 = Not Finish

                        If lnksave.Text <> "UPDATE"
                            Getdata()

                            lnksave.Text = "UPDATE"
                        End If

                    Case 1, 2, 3
                        lnksave.Text = "CAN'T UPDATE"



                End Select

            End If

           
            'Continue to page 3 Securitychecktool
            If lnksave.Text = "Go to page 3" then
                Dim reqmcnocookie As HttpCookie = Request.Cookies("ep3mcno")
                Mcno = reqmcnocookie("ep3mcno").ToString

                Response.Redirect("Securitychecktool.aspx?ep3mcno=" + Mcno)
            End If


        End If
    End Sub

    Private Shared Function CheckStatus(mcno As String) As Integer

        'Dim dt As Date
        'If Date.TryParse(value, dt) Then

        '    Return value
        'End If
        Dim statusid As Integer
        Dim statusname As String
        Using db As New  DBRISTMCDataContext
            
            Try
                ' Mcno = Request.QueryString("emcno")
                Dim getstatus  = db.TB_MACHINE_TOOL_CHECK_P3s.Where(Function(x) x.MC_NO = mcno).ToList()

                For Each g In getstatus
                    statusid = CInt(g.STATUS_ID)
                    statusname = g.STATUS_NAME
                Next
              
            
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
               
            Finally
                
                db.Dispose()
            End Try
                
        End Using


        Return statusid
    End Function

    Private Sub Functionupload()


        Using db = New DBRISTMCDataContext
            Try
                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
                

                Dim ipcookie As HttpCookie = Request.Cookies("ip")
                Dim ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")

                Mcno = Request.QueryString("ep2mcno")

                '//Function Save Attach file main 1 
                Dim uploadfile1 As HttpCookie = Request.Cookies("namefile1")
                Dim nameupload1 as String = If(uploadfile1 IsNot Nothing, uploadfile1.Value.Split("="c)(1), "undefined")
                Dim filePathupload1 as String
                Dim filenameupload1 As String
                Dim fsupload1 As FileStream
                Dim brupload1 As BinaryReader
                Dim bytesupload1 As Byte()
                Dim doccontentype1 As string

                '//Function Save Attach file main 2 
                Dim uploadfile2 As HttpCookie = Request.Cookies("namefile2")
                Dim nameupload2 as String = If(uploadfile2 IsNot Nothing, uploadfile2.Value.Split("="c)(1), "undefined")
                Dim filePathupload2 as String
                Dim filenameupload2 As String
                Dim fsupload2 As FileStream
                Dim brupload2 As BinaryReader
                Dim bytesupload2 As Byte()
                Dim doccontentype2 As string

                '//Function Save Attach file main 3 
                Dim uploadfile3 As HttpCookie = Request.Cookies("namefile3")
                Dim nameupload3 as String = If(uploadfile3 IsNot Nothing, uploadfile3.Value.Split("="c)(1), "undefined")
                Dim filePathupload3 as String
                Dim filenameupload3 As String
                Dim fsupload3 As FileStream
                Dim brupload3 As BinaryReader
                Dim bytesupload3 As Byte()
                Dim doccontentype3 As string

                'Dim mimeType As String = System.Web.MimeMapping.GetMimeMapping(fileName)

               

            

                    'Dim filePath As String = Server.MapPath("~/TransacSlip/") + Path.GetFileName(postedFile.FileName)
                    'postedFile.SaveAs(filePath)
                    'lblMessage.Visible = True

                    If nameupload1 IsNot "undefined"
           
     
                        filePathupload1 = Server.MapPath("upload/Front/" & nameupload1 & "")
                        filenameupload1 = Path.GetFileName(filePathupload1)
                        fsupload1 = New FileStream(filePathupload1, FileMode.Open, FileAccess.Read)
                        brupload1 = New BinaryReader(fsupload1)
                        bytesupload1 = brupload1.ReadBytes(Convert.ToInt32(fsupload1.Length))
                        doccontentype1 = MimeMapping.GetMimeMapping(filenameupload1)
                        brupload1.Close()
                        fsupload1.Close()

                        Dim queryfile1 As IEnumerable(Of TB_FILE_ATTACH) = db.TB_FILE_ATTACHes.Where(Function(f) f.MC_NO = Mcno And f.FILE_ATTACH_NO_GROUP.Value = 1).ToList()

                        If queryfile1.Count <> 0
                        
                               'update
                                For Each o In queryfile1
                                    o.MC_NO = Mcno
                                    o.FILE_ATTACH_NO_GROUP = 1
                                    o.FILE_ATTACH_NAME = filenameupload1
                                    o.FILE_ATTACH_CONTENT_TYPE = doccontentype1
                                    o.FILE_ATTACH_DATA = bytesupload1
                                    o.IP = ip
                                    o.OPNO_UPDATE = opno
                                    o.DATE_UPDATE = DateTime.Now
                                    db.SubmitChanges()
                                Next
                        Else 
                                'insert
                                Dim fileupload1 = New TB_FILE_ATTACH With {
                                        .MC_NO = Mcno,
                                        .FILE_ATTACH_NO_GROUP = 1,
                                        .FILE_ATTACH_NAME = filenameupload1,
                                        .FILE_ATTACH_CONTENT_TYPE = doccontentype1,
                                        .FILE_ATTACH_DATA = bytesupload1,
                                        .IP = ip,
                                        .OPNO_ADD = opno,
                                        .DATE_ADD = DateTime.Now
                                        }

                                db.TB_FILE_ATTACHes.InsertOnSubmit(fileupload1)
                                db.SubmitChanges()
                        End If

                      

                    End If

                If nameupload2 Isnot "undefined"
           
     
                    filePathupload2 = Server.MapPath("upload/Back/" & nameupload2 & "")
                    filenameupload2 = Path.GetFileName(filePathupload2)
                    fsupload2 = New FileStream(filePathupload2, FileMode.Open, FileAccess.Read)
                    brupload2 = New BinaryReader(fsupload2)
                    bytesupload2 = brupload2.ReadBytes(Convert.ToInt32(fsupload2.Length))
                    doccontentype2 = MimeMapping.GetMimeMapping(filenameupload2)
                    brupload2.Close()
                    fsupload2.Close()

                    Dim queryfile2 As IEnumerable(Of TB_FILE_ATTACH) = db.TB_FILE_ATTACHes.Where(Function(f) f.MC_NO = Mcno And f.FILE_ATTACH_NO_GROUP.Value = 2).ToList()

                    If queryfile2.Count <> 0
                        
                        'update
                        For Each o In queryfile2
                            o.MC_NO = Mcno
                            o.FILE_ATTACH_NO_GROUP = 2
                            o.FILE_ATTACH_NAME = filenameupload2
                            o.FILE_ATTACH_CONTENT_TYPE = doccontentype2
                            o.FILE_ATTACH_DATA = bytesupload2
                            o.IP = ip
                            o.OPNO_UPDATE = opno
                            o.DATE_UPDATE = DateTime.Now
                            db.SubmitChanges()
                        Next
                    Else 
                        'insert
                        Dim fileupload2 = New TB_FILE_ATTACH With {
                                .MC_NO = Mcno,
                                .FILE_ATTACH_NO_GROUP = 2,
                                .FILE_ATTACH_NAME = filenameupload2,
                                .FILE_ATTACH_CONTENT_TYPE = doccontentype2,
                                .FILE_ATTACH_DATA = bytesupload2,
                                .IP = ip,
                                .OPNO_ADD = opno,
                                .DATE_ADD = DateTime.Now
                                }

                        db.TB_FILE_ATTACHes.InsertOnSubmit(fileupload2)
                        db.SubmitChanges()
                    End If

                    

                End If

                If nameupload3 Isnot "undefined"
           
     
                    filePathupload3 = Server.MapPath("upload/" & nameupload3 & "")
                    filenameupload3 = Path.GetFileName(filePathupload3)
                    fsupload3 = New FileStream(filePathupload3, FileMode.Open, FileAccess.Read)
                    brupload3 = New BinaryReader(fsupload3)
                    bytesupload3 = brupload3.ReadBytes(Convert.ToInt32(fsupload3.Length))
                    doccontentype3 = MimeMapping.GetMimeMapping(filenameupload3)
                    brupload3.Close()
                    fsupload3.Close()

                    Dim queryfile3 As IEnumerable(Of TB_FILE_ATTACH) = db.TB_FILE_ATTACHes.Where(Function(f) f.MC_NO = Mcno And f.FILE_ATTACH_NO_GROUP.Value = 3).ToList()

                    If queryfile3.Count <> 0
                        
                        'update
                        For Each o In queryfile3
                            o.MC_NO = Mcno
                            o.FILE_ATTACH_NO_GROUP = 3
                            o.FILE_ATTACH_NAME = filenameupload3
                            o.FILE_ATTACH_CONTENT_TYPE = doccontentype3
                            o.FILE_ATTACH_DATA = bytesupload3
                            o.IP = ip
                            o.OPNO_UPDATE = opno
                            o.DATE_UPDATE = DateTime.Now
                            db.SubmitChanges()
                        Next
                    Else 
                        'insert
                        Dim fileupload3 = New TB_FILE_ATTACH With {
                                .MC_NO = Mcno,
                                .FILE_ATTACH_NO_GROUP = 3,
                                .FILE_ATTACH_NAME = filenameupload3,
                                .FILE_ATTACH_CONTENT_TYPE = doccontentype3,
                                .FILE_ATTACH_DATA = bytesupload3,
                                .IP = ip,
                                .OPNO_ADD = opno,
                                .DATE_ADD = DateTime.Now
                                }

                        db.TB_FILE_ATTACHes.InsertOnSubmit(fileupload3)
                        db.SubmitChanges()
                    End If


                   

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
    Protected Sub Callfunction()
        Select Case lnksave.Text
          
            Case "UPDATE"
                UpdateData()
            Case "Save"
                UpdateData()

           
        End Select
    End Sub

  
    Protected Sub DownloadFile1
       
        Using db As New  DBRISTMCDataContext
            Try
                Mcno = Request.QueryString("ep2mcno")
                Dim getfile As IEnumerable(Of TB_FILE_ATTACH) = db.TB_FILE_ATTACHes.Where(Function(r) r.MC_NO = Mcno And r.FILE_ATTACH_NO_GROUP.Value = 1).ToList()
                If getfile IsNot Nothing Then

                    For Each file In getfile

                        Response.ContentType = file.FILE_ATTACH_CONTENT_TYPE
                        Response.AddHeader("content-disposition", "attachment; filename=" & file.FILE_ATTACH_NAME)
                        Response.BinaryWrite(file.FILE_ATTACH_DATA)
                        Response.Flush()
                        Response.[End]()
                    Next
                    
                   
                    
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
    Protected Sub DownloadFile2
       
        Using db As New  DBRISTMCDataContext
            Try
                Mcno = Request.QueryString("ep2mcno")
                Dim getfile As IEnumerable(Of TB_FILE_ATTACH) = db.TB_FILE_ATTACHes.Where(Function(r) r.MC_NO = Mcno And r.FILE_ATTACH_NO_GROUP.Value = 2).ToList()
                If getfile IsNot Nothing Then

                    For Each file In getfile

                        Response.ContentType = file.FILE_ATTACH_CONTENT_TYPE
                        Response.AddHeader("content-disposition", "attachment; filename=" & file.FILE_ATTACH_NAME)
                        Response.BinaryWrite(file.FILE_ATTACH_DATA)
                        Response.Flush()
                        Response.[End]()
                    Next
                    
                   
                    'Response.Flush()
                    'Response.[End]()
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
    Protected Sub DownloadFile3
       
        Using db As New  DBRISTMCDataContext
            Try
                Mcno = Request.QueryString("ep2mcno")
                Dim getfile As IEnumerable(Of TB_FILE_ATTACH) = db.TB_FILE_ATTACHes.Where(Function(r) r.MC_NO = Mcno And r.FILE_ATTACH_NO_GROUP.Value = 3).ToList()
                If getfile IsNot Nothing Then

                    For Each file In getfile

                        Response.ContentType = file.FILE_ATTACH_CONTENT_TYPE
                        Response.AddHeader("content-disposition", "attachment; filename=" & file.FILE_ATTACH_NAME)
                        Response.BinaryWrite(file.FILE_ATTACH_DATA)
                        Response.Flush()
                        Response.[End]()
                    Next
                    
                   
                    'Response.Flush()
                    'Response.[End]()
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

    Private Sub UpdateData()
        Using db = New DBRISTMCDataContext()
            Try
                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
                

                Dim ipcookie As HttpCookie = Request.Cookies("ip")
                Dim ip as String = If(ipcookie IsNot Nothing, ipcookie.Value.Split("="c)(1), "undefined")

                Mcno = Request.QueryString("ep2mcno")

                Dim rgetdata As IEnumerable(Of TB_EQUIPMENT_CHECK) = db.TB_EQUIPMENT_CHECKs.Where(Function(r) r.MC_NO = Mcno).OrderBy(Function(k) k.Title).ToList()

                'DownloadAttachfile(Mcno)

                Functionupload
                
                For Each p In rgetdata.GroupBy(Function(o) o.Title).ToList()
                    Dim xtitle as Integer
                    xtitle = p.Key

                    Select Case xtitle
                        'update title 1:Emergency Switch
                        Case 1
                            Dim queryTitle1 = db.TB_EQUIPMENT_CHECKs.Where(Function(o) o.MC_NO = Mcno And o.Title = xtitle).ToList()
                            If queryTitle1 IsNot Nothing Then

                                For Each t1 In queryTitle1

                                    Select case t1.Title_No
                                        Case 1
                                            If tbemersdt1.Value.Trim() <> ""
                                                t1.Number = CInt(tbemersno1.Value)
                                                t1.Detail_topic = tbemersdt1.Value.Trim()

                                                if chk11.Checked Then
                                                    t1.IsSelected = True
                                                Else
                                                    t1.IsSelected = False
                                                End If
                                                t1.IP = ip
                                                t1.OPNO_UPDATE = opno
                                                t1.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                           
                                        Case 2
                                            If tbemersdt2.Value.Trim() <> ""
                                                t1.Number = CInt(tbemersno2.Value)
                                                t1.Detail_topic = tbemersdt2.Value.Trim()

                                                if chk12.Checked Then
                                                    t1.IsSelected = True
                                                Else
                                                    t1.IsSelected = False
                                                End If
                                                t1.IP = ip
                                                t1.OPNO_UPDATE = opno
                                                t1.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 3
                                            If tbemersdt3.Value.Trim() <> ""
                                                t1.Number = CInt(tbemersno3.Value)
                                                t1.Detail_topic = tbemersdt3.Value.Trim()

                                                if chk13.Checked Then
                                                    t1.IsSelected = True
                                                Else
                                                    t1.IsSelected = False
                                                End If
                                                t1.IP = ip
                                                t1.OPNO_UPDATE = opno
                                                t1.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 4
                                            If tbemersdt4.Value.Trim() <> ""
                                                t1.Number = CInt(tbemersno4.Value)
                                                t1.Detail_topic = tbemersdt4.Value.Trim()

                                                if chk14.Checked Then
                                                    t1.IsSelected = True
                                                Else
                                                    t1.IsSelected = False
                                                End If
                                                t1.IP = ip
                                                t1.OPNO_UPDATE = opno
                                                t1.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 5
                                            If tbemersdt5.Value <> ""
                                                t1.Number = CInt(tbemersno5.Value)
                                                t1.Detail_topic = tbemersdt5.Value.Trim()

                                                if chk15.Checked Then
                                                    t1.IsSelected = True
                                                Else
                                                    t1.IsSelected = False
                                                End If
                                                t1.IP = ip
                                                t1.OPNO_UPDATE = opno
                                                t1.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                           
                                        Case 6
                                            If tbemersdt6.Value.Trim() <> ""
                                                t1.Number = CInt(tbemersno6.Value)
                                                t1.Detail_topic = tbemersdt6.Value.Trim()

                                                if chk16.Checked Then
                                                    t1.IsSelected = True
                                                Else
                                                    t1.IsSelected = False
                                                End If
                                                t1.IP = ip
                                                t1.OPNO_UPDATE = opno
                                                t1.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 7
                                            If tbemersdt7.Value.Trim() <> ""
                                                t1.Number = CInt(tbemersno7.Value)
                                                t1.Detail_topic = tbemersdt7.Value.Trim()

                                                if chk17.Checked Then
                                                    t1.IsSelected = True
                                                Else
                                                    t1.IsSelected = False
                                                End If
                                                t1.IP = ip
                                                t1.OPNO_UPDATE = opno
                                                t1.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                           
                                        Case 8
                                            If tbemersdt8.Value.Trim() <> ""
                                                t1.Number = CInt(tbemersno8.Value)
                                                t1.Detail_topic = tbemersdt8.Value.Trim()

                                                if chk18.Checked Then
                                                    t1.IsSelected = True
                                                Else
                                                    t1.IsSelected = False
                                                End If
                                                t1.IP = ip
                                                t1.OPNO_UPDATE = opno
                                                t1.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                    End Select
                            Next
                        End If
                        'update title 2:Area Sensor
                        Case 2
                            Dim queryTitle2 = db.TB_EQUIPMENT_CHECKs.Where(Function(o) o.MC_NO = Mcno And o.Title = xtitle).ToList()
                            If queryTitle2 IsNot Nothing Then

                            For Each t2 In queryTitle2

                                Select case t2.Title_No
                                    Case 1
                                        If tbareas1.Value.Trim() <> ""
                                            t2.Number = CInt(tbareasno1.Value)
                                            t2.Detail_topic = tbareas1.Value.Trim()

                                            if chk21.Checked Then
                                                t2.IsSelected = True
                                            Else
                                                t2.IsSelected = False
                                            End If
                                            t2.IP = ip
                                            t2.OPNO_UPDATE = opno
                                            t2.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 2
                                        If tbareas2.Value.Trim() <> ""
                                            t2.Number = CInt(tbareasno2.Value)
                                            t2.Detail_topic = tbareas2.Value.Trim()

                                            if chk22.Checked Then
                                                t2.IsSelected = True
                                            Else
                                                t2.IsSelected = False
                                            End If
                                            t2.IP = ip
                                            t2.OPNO_UPDATE = opno
                                            t2.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 3
                                        If tbareas3.Value.Trim() <> ""
                                            t2.Number = CInt(tbareasno3.Value)
                                            t2.Detail_topic = tbareas3.Value.Trim()

                                            if chk23.Checked Then
                                                t2.IsSelected = True
                                            Else
                                                t2.IsSelected = False
                                            End If
                                            t2.IP = ip
                                            t2.OPNO_UPDATE = opno
                                            t2.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 4
                                        If tbareas4.Value.Trim() <> ""
                                            t2.Number = CInt(tbareasno4.Value)
                                            t2.Detail_topic = tbareas4.Value.Trim()

                                            if chk24.Checked Then
                                                t2.IsSelected = True
                                            Else
                                                t2.IsSelected = False
                                            End If
                                            t2.IP = ip
                                            t2.OPNO_UPDATE = opno
                                            t2.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 5
                                        If tbareas5.Value.Trim() <> ""
                                            t2.Number = CInt(tbareasno5.Value)
                                            t2.Detail_topic = tbareas5.Value.Trim()

                                            if chk25.Checked Then
                                                t2.IsSelected = True
                                            Else
                                                t2.IsSelected = False
                                            End If
                                            t2.IP = ip
                                            t2.OPNO_UPDATE = opno
                                            t2.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 6
                                        If tbareas6.Value.Trim() <> ""
                                            t2.Number = CInt(tbareasno6.Value)
                                            t2.Detail_topic = tbareas6.Value.Trim()

                                            if chk26.Checked Then
                                                t2.IsSelected = True
                                            Else
                                                t2.IsSelected = False
                                            End If
                                            t2.IP = ip
                                            t2.OPNO_UPDATE = opno
                                            t2.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 7
                                        If tbareas7.Value.Trim() <> ""
                                            t2.Number = CInt(tbareasno7.Value)
                                            t2.Detail_topic = tbareas7.Value.Trim()

                                            if chk27.Checked Then
                                                t2.IsSelected = True
                                            Else
                                                t2.IsSelected = False
                                            End If
                                            t2.IP = ip
                                            t2.OPNO_UPDATE = opno
                                            t2.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 8
                                        If tbareas8.Value.Trim() <> ""
                                            t2.Number = CInt(tbareasno8.Value)
                                            t2.Detail_topic = tbareas7.Value.Trim()

                                            if chk28.Checked Then
                                                t2.IsSelected = True
                                            Else
                                                t2.IsSelected = False
                                            End If
                                            t2.IP = ip
                                            t2.OPNO_UPDATE = opno
                                            t2.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                End Select
                        Next
                    End If
                        'update title 3:Safety Cover
                        Case 3
                            Dim queryTitle3 = db.TB_EQUIPMENT_CHECKs.Where(Function(o) o.MC_NO = Mcno And o.Title = xtitle).ToList()
                            If queryTitle3 IsNot Nothing Then

                            For Each t3 In queryTitle3

                                Select case t3.Title_No
                                    Case 1
                                        If tbsafecover1.Value.Trim() <> ""
                                            t3.Number = CInt(tbsafecoverno1.Value)
                                            t3.Detail_topic = tbsafecover1.Value.Trim()

                                            if chk31.Checked Then
                                                t3.IsSelected = True
                                            Else
                                                t3.IsSelected = False
                                            End If
                                            t3.IP = ip
                                            t3.OPNO_UPDATE = opno
                                            t3.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 2
                                        if tbsafecover2.Value.Trim() <> ""
                                            t3.Number = CInt(tbsafecoverno2.Value)
                                            t3.Detail_topic = tbsafecover2.Value.Trim()

                                            if chk32.Checked Then
                                                t3.IsSelected = True
                                            Else
                                                t3.IsSelected = False
                                            End If
                                            t3.IP = ip
                                            t3.OPNO_UPDATE = opno
                                            t3.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 3
                                        If tbsafecover3.Value.Trim() <> ""
                                            t3.Number = CInt(tbsafecoverno3.Value)
                                            t3.Detail_topic = tbsafecover3.Value.Trim()

                                            if chk33.Checked Then
                                                t3.IsSelected = True
                                            Else
                                                t3.IsSelected = False
                                            End If
                                            t3.IP = ip
                                            t3.OPNO_UPDATE = opno
                                            t3.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 4
                                        If tbsafecover4.Value.Trim() <> ""
                                            t3.Number = CInt(tbsafecoverno5.Value)
                                            t3.Detail_topic = tbsafecover5.Value.Trim()

                                            if chk35.Checked Then
                                                t3.IsSelected = True
                                            Else
                                                t3.IsSelected = False
                                            End If
                                            t3.IP = ip
                                            t3.OPNO_UPDATE = opno
                                            t3.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                        
                                    Case 6
                                        If tbsafecover6.Value.Trim() <> ""
                                            t3.Number = CInt(tbsafecoverno6.Value)
                                            t3.Detail_topic = tbsafecover6.Value.Trim()

                                            if chk36.Checked Then
                                                t3.IsSelected = True
                                            Else
                                                t3.IsSelected = False
                                            End If
                                            t3.IP = ip
                                            t3.OPNO_UPDATE = opno
                                            t3.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 7
                                        If tbsafecover7.Value.Trim() <> "" 
                                            t3.Number = CInt(tbsafecoverno7.Value)
                                            t3.Detail_topic = tbsafecover7.Value.Trim()

                                            if chk37.Checked Then
                                                t3.IsSelected = True
                                            Else
                                                t3.IsSelected = False
                                            End If
                                            t3.IP = ip
                                            t3.OPNO_UPDATE = opno
                                            t3.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                    Case 8
                                        if tbsafecover8.Value.Trim() <> ""
                                            t3.Number = CInt(tbsafecoverno8.Value)
                                            t3.Detail_topic = tbsafecover8.Value.Trim()

                                            if chk38.Checked Then
                                                t3.IsSelected = True
                                            Else
                                                t3.IsSelected = False
                                            End If
                                            t3.IP = ip
                                            t3.OPNO_UPDATE = opno
                                            t3.DATE_UPDATE = DateTime.Now
                                            db.SubmitChanges()
                                        End If
                                        
                                End Select
                        Next
                    End If
                        'update title 4:Limit Switch
                        Case 4
                            Dim queryTitle4 = db.TB_EQUIPMENT_CHECKs.Where(Function(o) o.MC_NO = Mcno And o.Title = xtitle).ToList()
                            If queryTitle4 IsNot Nothing Then


                                For Each t4 In queryTitle4

                                    Select case t4.Title_No
                                        Case 1
                                            If tblimitsw1.Value.Trim() <> "" Then
                                                t4.Number = CInt(tblimitswno1.Value)
                                                t4.Detail_topic = tblimitsw1.Value.Trim()

                                                if chk41.Checked Then
                                                    t4.IsSelected = True
                                                Else
                                                    t4.IsSelected = False
                                                End If
                                                t4.IP = ip
                                                t4.OPNO_UPDATE = opno
                                                t4.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If

                                        Case 2
                                            If tblimitsw2.Value.Trim() <> ""
                                                t4.Number = CInt(tblimitswno2.Value)
                                                t4.Detail_topic = tblimitsw2.Value.Trim()

                                                if chk42.Checked Then
                                                    t4.IsSelected = True
                                                Else
                                                    t4.IsSelected = False
                                                End If
                                                t4.IP = ip
                                                t4.OPNO_UPDATE = opno
                                                t4.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 3
                                            If tblimitsw3.Value.Trim() <> ""
                                                t4.Number = CInt(tblimitswno3.Value)
                                                t4.Detail_topic = tblimitsw3.Value.Trim()

                                                if chk43.Checked Then
                                                    t4.IsSelected = True
                                                Else
                                                    t4.IsSelected = False
                                                End If
                                                t4.IP = ip
                                                t4.OPNO_UPDATE = opno
                                                t4.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 4
                                            If tblimitsw4.Value.Trim() <> ""
                                                t4.Number = CInt(tblimitswno4.Value)
                                                t4.Detail_topic = tblimitsw4.Value.Trim()

                                                if chk44.Checked Then
                                                    t4.IsSelected = True
                                                Else
                                                    t4.IsSelected = False
                                                End If
                                                t4.IP = ip
                                                t4.OPNO_UPDATE = opno
                                                t4.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 5
                                            If tblimitsw5.Value.Trim() <> ""
                                                t4.Number = CInt(tblimitswno5.Value)
                                                t4.Detail_topic = tblimitsw5.Value.Trim()

                                                if chk45.Checked Then
                                                    t4.IsSelected = True
                                                Else
                                                    t4.IsSelected = False
                                                End If
                                                t4.IP = ip
                                                t4.OPNO_UPDATE = opno
                                                t4.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 6
                                            If tblimitsw6.Value.Trim() <> ""
                                                t4.Number = CInt(tblimitswno6.Value)
                                                t4.Detail_topic = tblimitsw6.Value.Trim()

                                                if chk46.Checked Then
                                                    t4.IsSelected = True
                                                Else
                                                    t4.IsSelected = False
                                                End If
                                                t4.IP = ip
                                                t4.OPNO_UPDATE = opno
                                                t4.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 7
                                            If tblimitsw7.Value.Trim() <> ""
                                                t4.Number = CInt(tblimitswno7.Value)
                                                t4.Detail_topic = tblimitsw7.Value.Trim()

                                                if chk47.Checked Then
                                                    t4.IsSelected = True
                                                Else
                                                    t4.IsSelected = False
                                                End If
                                                t4.IP = ip
                                                t4.OPNO_UPDATE = opno
                                                t4.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                        Case 8
                                            If tblimitsw8.Value.Trim() <> ""
                                                t4.Number = CInt(tblimitswno8.Value)
                                                t4.Detail_topic = tblimitsw8.Value.Trim()

                                                if chk48.Checked Then
                                                    t4.IsSelected = True
                                                Else
                                                    t4.IsSelected = False
                                                End If
                                                t4.IP = ip
                                                t4.OPNO_UPDATE = opno
                                                t4.DATE_UPDATE = DateTime.Now
                                                db.SubmitChanges()
                                            End If
                                            
                                    End Select
                                Next
                            End If
                    End Select
                     
                Next

             
                Dim rgetdata2  = db.TB_EQUIPMENT_DETAILs.Where(Function(r) r.MC_NO = Mcno).ToList()

                For Each x In rgetdata2

                    GetDetailOrganize()

                    x.MC_NO = Mcno
                    x.MC_NAME = tb_mcname.Value.Trim()
                    x.MC_NUMBER = tb_mcno.Value.Trim()
                    x.DIVISION = Division
                    x.DEPARTMENT = Department
                    x.SECTION = Section
                    x.BUILDING = tb_building.Value.Trim()
                    x.FLOOR = tb_floor.Value.Trim()
                    x.PROCESS = tb_process.Value.Trim()
                    x.OPNO_UPDATE = opno
                    x.DATE_UPDATE = DateTime.Now
                    x.IP = ip
                    db.SubmitChanges()

                Next

                'db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "UpdateComplete()", True)
            Catch ex As Exception
                Dim message As String = $"Message: {ex.Message}\n\n"
                message &= $"StackTrace: {ex.StackTrace.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"Source: {ex.Source.Replace(Environment.NewLine, String.Empty)}\n\n"
                message &= $"TargetSite: {ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty)}"

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()

                lnksave.Text = "Go to page 3"

            End Try
        End Using
    End Sub

    Private Sub Getdata()
        
        Mcno = Request.QueryString("ep2mcno")
        Status = Request.QueryString("status")
        If Mcno IsNot Nothing
            Using db As New DBRISTMCDataContext()
                Try
                    'select condition
                    Dim getdata As IEnumerable(Of TB_EQUIPMENT_CHECK) = db.TB_EQUIPMENT_CHECKs.Where(Function(r) r.MC_NO = Mcno).OrderBy(Function(x) x.Title And x.Title_No).ToList()


                    If getdata IsNot Nothing Then

                        For Each list In getdata
                        
                            lbmcno.Text = list.MC_NO
                            lbstatus.Text = Status
                            Select Case list.Title
                                'select title 1:Emergency Switch
                                Case 1
                                    Select Case list.Title_No
                                        Case 1
                                            tbemersdt1.Value = list.Detail_topic
                                            If list.Number = 0
                                                    tbemersno1.Value = ""
                                                else
                                                    tbemersno1.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk11.Checked = list.IsSelected
                                            End If
                                        Case 2
                                            tbemersdt2.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbemersno2.Value = ""
                                            else
                                                tbemersno2.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk12.Checked = list.IsSelected
                                            End If
                                        Case 3
                                            tbemersdt3.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbemersno3.Value = ""
                                            else
                                                tbemersno3.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk13.Checked = list.IsSelected
                                            End If
                                        Case 4
                                            tbemersdt4.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbemersno4.Value = ""
                                            else
                                                tbemersno4.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk14.Checked = list.IsSelected
                                            End If
                                        Case 5
                                            tbemersdt5.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbemersno5.Value = ""
                                            else
                                                tbemersno5.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk15.Checked = list.IsSelected
                                            End If
                                        Case 6
                                            tbemersdt6.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbemersno6.Value = ""
                                            else
                                                tbemersno6.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk16.Checked = list.IsSelected
                                            End If
                                        Case 7
                                            tbemersdt7.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbemersno7.Value = ""
                                            else
                                                tbemersno7.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk17.Checked = list.IsSelected
                                            End If
                                        Case 8
                                            tbemersdt8.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbemersno8.Value = ""
                                            else
                                                tbemersno8.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk18.Checked = list.IsSelected
                                            End If
                                    End Select
                               'select title 2:Area
                                Case 2
                                    Select Case list.Title_No
                                        Case 1
                                            tbareas1.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbareasno1.Value = ""
                                            else
                                                tbareasno1.Value = CType(list.Number, String)
                                            End If
                                            
                                            If list.IsSelected = True Then
                                                chk21.Checked = list.IsSelected
                                            End If
                                        Case 2
                                            tbareas2.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbareasno2.Value = ""
                                            else
                                                tbareasno2.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk22.Checked = list.IsSelected
                                            End If
                                        Case 3
                                            tbareas3.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbareasno3.Value = ""
                                            else
                                                tbareasno3.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk23.Checked = list.IsSelected
                                            End If
                                        Case 4
                                            tbareas4.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbareasno4.Value = ""
                                            else
                                                tbareasno4.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk24.Checked = list.IsSelected
                                            End If
                                        Case 5
                                            tbareas5.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbareasno5.Value = ""
                                            else
                                                tbareasno5.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk25.Checked = list.IsSelected
                                            End If
                                        Case 6
                                            tbareas6.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbareasno6.Value = ""
                                            else
                                                tbareasno6.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk26.Checked = list.IsSelected
                                            End If
                                        Case 7
                                            tbareas7.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbareasno7.Value = ""
                                            else
                                                tbareasno7.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk27.Checked = list.IsSelected
                                            End If
                                        Case 8
                                            tbareas8.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbareasno8.Value = ""
                                            else
                                                tbareasno8.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk28.Checked = list.IsSelected
                                            End If
                                    End Select
                                'select title 3:Safety Cover
                                Case 3
                                    Select Case list.Title_No
                                        Case 1
                                            tbsafecover1.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbsafecoverno1.Value = ""
                                            else
                                                tbsafecoverno1.Value = CType(list.Number, String)
                                            End If
                                            
                                            If list.IsSelected = True Then
                                                chk31.Checked = list.IsSelected
                                            End If
                                        Case 2
                                            tbsafecover2.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbsafecoverno2.Value = ""
                                            else
                                                tbsafecoverno2.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk32.Checked = list.IsSelected
                                            End If
                                        Case 3
                                            tbsafecover3.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbsafecoverno3.Value = ""
                                            else
                                                tbsafecoverno3.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk33.Checked = list.IsSelected
                                            End If
                                        Case 4
                                            tbsafecover4.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbsafecoverno4.Value = ""
                                            else
                                                tbsafecoverno4.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk34.Checked = list.IsSelected
                                            End If
                                        Case 5
                                            tbsafecover5.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbsafecoverno5.Value = ""
                                            else
                                                tbsafecoverno5.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk35.Checked = list.IsSelected
                                            End If
                                        Case 6
                                            tbsafecover6.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbsafecoverno6.Value = ""
                                            else
                                                tbsafecoverno6.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk36.Checked = list.IsSelected
                                            End If
                                        Case 7
                                            tbsafecover7.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbsafecoverno7.Value = ""
                                            else
                                                tbsafecoverno7.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk37.Checked = list.IsSelected
                                            End If
                                        Case 8
                                            tbsafecover7.Value = list.Detail_topic
                                            If list.Number = 0
                                                tbsafecoverno8.Value = ""
                                            else
                                                tbsafecoverno8.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk38.Checked = list.IsSelected
                                            End If
                                    End Select
                                'select title 4:Limit Switch
                                Case 4
                                    Select Case list.Title_No
                                        Case 1
                                            tblimitsw1.Value = list.Detail_topic
                                            If list.Number = 0
                                                tblimitswno1.Value = ""
                                            else
                                                tblimitswno1.Value = CType(list.Number, String)
                                            End If
                                            
                                            If list.IsSelected = True Then
                                                chk41.Checked = list.IsSelected
                                            End If
                                        Case 2
                                            tblimitsw2.Value = list.Detail_topic
                                            If list.Number = 0
                                                tblimitswno2.Value = ""
                                            else
                                                tblimitswno2.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk42.Checked = list.IsSelected
                                            End If
                                        Case 3
                                            tblimitsw3.Value = list.Detail_topic
                                            If list.Number = 0
                                                tblimitswno3.Value = ""
                                            else
                                                tblimitswno3.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk43.Checked = list.IsSelected
                                            End If
                                        Case 4
                                            tblimitsw4.Value = list.Detail_topic
                                            If list.Number = 0
                                                tblimitswno4.Value = ""
                                            else
                                                tblimitswno4.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk44.Checked = list.IsSelected
                                            End If
                                        Case 5
                                            tblimitsw5.Value = list.Detail_topic
                                            If list.Number = 0
                                                tblimitswno5.Value = ""
                                            else
                                                tblimitswno5.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk45.Checked = list.IsSelected
                                            End If
                                        Case 6
                                            tblimitsw6.Value = list.Detail_topic
                                            If list.Number = 0
                                                tblimitswno6.Value = ""
                                            else
                                                tblimitswno6.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk46.Checked = list.IsSelected
                                            End If
                                        Case 7
                                            tblimitsw7.Value = list.Detail_topic
                                            If list.Number = 0
                                                tblimitswno7.Value = ""
                                            else
                                                tblimitswno7.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk47.Checked = list.IsSelected
                                            End If
                                        Case 8
                                            tblimitsw8.Value = list.Detail_topic
                                            If list.Number = 0
                                                tblimitswno8.Value = ""
                                            else
                                                tblimitswno8.Value = CType(list.Number, String)
                                            End If

                                            If list.IsSelected = True Then
                                                chk48.Checked = list.IsSelected
                                            End If
                                    End Select


                            End Select
                            

                        Next

                        Dim queryfile As IEnumerable(Of TB_FILE_ATTACH) = db.TB_FILE_ATTACHes.where(Function (f) f.MC_NO.Equals(Mcno))


                        'file download 
                        If queryfile IsNot Nothing Then

                            For Each list In queryfile
                                Select list.FILE_ATTACH_NO_GROUP
                                    'Front mc
                                    Case 1
                                        lnkdownload1.Visible = True
                                        lbmcfront.Visible = True
                                        lbmcfront.Text = list.FILE_ATTACH_NAME
                                    'Back mc
                                    Case 2
                                        lnkdownload2.Visible = True
                                        lbmcback.Visible = True
                                        lbmcback.Text = list.FILE_ATTACH_NAME
                                    'Layout file
                                    Case 3
                                        lnkdownload3.Visible = True
                                        lbmsglayout.Visible = True
                                        lbmsglayout.Text = list.FILE_ATTACH_NAME
                                End Select
                                
                            Next
                            
                        Else
                            lnkdownload1.Visible = False
                            lbmcfront.Visible = False
                        End If

                        Dim queryDetail2P As IEnumerable(Of TB_EQUIPMENT_DETAIL) = db.TB_EQUIPMENT_DETAILs.Where(Function(p) p.MC_NO.Equals(Mcno))

                        If queryDetail2P IsNot Nothing Then

                            For Each p In queryDetail2P

                                tb_mcname.Value = p.MC_NAME
                                tb_mcno.Value = p.MC_NUMBER
                                tb_organize.Value = p.DIVISION + "/ " + p.DEPARTMENT + "/ " + p.SECTION
                                tb_building.Value = p.BUILDING
                                tb_floor.Value = p.FLOOR
                                tb_process.Value = p.PROCESS

                            Next

                        End If

                        GetDetailOrganize


                    Else

                        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Nodata()", True)

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

            else

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Nodata()", True)


        End If
        
        
    End Sub

    Private Sub GetDetailOrganize()

        'Dim opno As String = CType(Session("opnologin"), String)
        Dim opnocookie As HttpCookie = Request.Cookies("opno")
        Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
        Dim query As String 
        query = "Select * From hrms.v_empmail WHERE CODEMPID = " & "'" & opno & "'"

        Using con As New OracleConnection(_conStrDbhrms)
            Try
                Using cmd As New OracleCommand(query)
                Using sda As New OracleDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)

                        Dim dt As DataTable = ds.Tables(0)

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


                               

                            Next
                            '_stampname = n1 + n2
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

    
End Class