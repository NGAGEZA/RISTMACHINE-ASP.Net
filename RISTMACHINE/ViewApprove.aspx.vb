Option Strict On
Option Explicit On

Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports System.Reflection
Imports System.Security.Cryptography


Public Class ViewApprove
    
    Inherits Page
    Private Property Mcno() As String

    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()

        Else

            'get data for review data from email request
            'If Not String.IsNullOrEmpty(Mcno) Then

            '    MakeTable

            '    Exit Sub
            'End If

            'get data for review data from email request
            If Not String.IsNullOrEmpty(Request.QueryString("rmcno")) Then
                Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("rmcno")))
                MakeTable()
                Exit Sub
            End If

            'get data for Sect.mgr preview approve
            If Not String.IsNullOrEmpty(Request.QueryString("smcno")) Then
                Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("smcno")))

                If CheckStatus(Mcno) = 1 Then
                    MakeTable()
                Else
                    lbmsg.Text = "No data approve."
                End If

                Exit Sub
            End If

            

        End If
    End Sub

    Private Shared Function LinqResultToDataTable(Of T)(linqlist As IEnumerable(Of T)) As DataTable
        Dim dt = New DataTable()
        Dim columns As PropertyInfo() = Nothing
        If linqlist Is Nothing Then Return dt

        For Each record As T In linqlist

            If columns Is Nothing Then
                columns = (record.[GetType]()).GetProperties()

                For Each getProperty As PropertyInfo In columns
                    Dim colType As Type = getProperty.PropertyType

                    If (colType.IsGenericType) AndAlso (colType.GetGenericTypeDefinition() = GetType(Nullable(Of))) Then
                        colType = colType.GetGenericArguments()(0)
                    End If

                    dt.Columns.Add(New DataColumn(getProperty.Name, colType))
                Next
            End If

            Dim dr As DataRow = dt.NewRow()

            For Each pinfo As PropertyInfo In columns
                dr(pinfo.Name) = If(pinfo.GetValue(record, Nothing), DBNull.Value)
            Next

            dt.Rows.Add(dr)
        Next

        Return dt
    End Function

    Private Shared Function CountAttfilePageTwo(mcno As String) As Integer
        Dim countfile As Integer
        Using db As New  DBRISTMCDataContext
            
            Try
               ' Mcno = Request.QueryString("emcno")
                Dim getfilecount  = db.TB_FILE_ATTACHes.Count(Function(x) x.MC_NO = mcno)

                countfile = getfilecount
               
            
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
               
            Finally
                
                db.Dispose()
            End Try
                
        End Using
        Return countfile
    End Function
    Private Shared Function CountAttfilePageThree(mcno As String) As Integer
        Dim countfile As Integer
        Using db As New  DBRISTMCDataContext
            
            Try
                ' Mcno = Request.QueryString("emcno")
                Dim getfilecount  = db.TB_MACHINE_TOOL_CHECK_P3s.Count(Function (x) x.MC_NO = mcno And x.DOCUMENT_ATTACH_NAME <> "")

                countfile = getfilecount
               
            
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
               

            Finally
                
                db.Dispose()
            End Try
                
        End Using
        Return countfile
    End Function
    Private Shared Function CountAttfilePageOne(mcno As String) As Integer
        Dim countfile As Integer
        Using db As New  DBRISTMCDataContext
            
            Try
                ' Mcno = Request.QueryString("emcno")
                Dim getfilecount  = db.TB_MACHINE_DATAs.Count(Function (x) x.MC_NO = mcno And x.DOCUMENT_ATTACH_NAME <> "")

                countfile = getfilecount
               
            
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
               

            Finally
                
                db.Dispose()
            End Try
                
        End Using
        Return countfile
    End Function



    Private Sub MakeTable()
        Using db As New DBRISTMCDataContext
            Try
                'Dim opnocookie As HttpCookie = Request.Cookies("opno")
                'mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("rmcno")))
                'Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")

                'For Test
                'mcno = "MC-065"

                Dim getdata = db.TB_MACHINE_DATAs.Where(Function(x) x.MC_NO = Mcno).Select(Function(x) New With {.No = 0,
                                                                                              .OpnoAdd = x.OPNO_ADD,
                                                                                              .Mcno = x.MC_NO,
                                                                                              .PageOne = "",
                                                                                              .PageTwo = "",
                                                                                              .PageThree = "",
                                                                                              .Approve = "<a href=" + "JavaScript:callapprove();" + " class='btn btn-sm btn-primary'> Approve</a>",
                                                                                              .Reject = "<button type='button' class='btn btn-sm btn-danger'>Reject</button>"}).ToList()
                'Column No.
                Dim numrow = 0
                For Each item In getdata.Where(Function(c) c.No = 0)
                    numrow += 1
                    item.No = numrow
                Next
                'Page 1 PDF + ERS
                For Each itemAtt In getdata.Where(Function(c) c.Mcno <> "")

                    If CountAttfilePageOne(itemAtt.Mcno) <> 0 Then
                        
                            itemAtt.PageOne = "<a href="+"JavaScript:newPopup('/RISTMACHINE/GetReport.aspx?pmcno=" + itemAtt.Mcno.Trim() + "&pageno=1');"+" class='btn btn-sm btn-info'><i class='fa fa-file-pdf-o'></i> Page 1 <span class='badge'>"+ countAttfilePageOne(itemAtt.Mcno).ToString() +"</span></a>" + " <a href="+"JavaScript:newPopup('/RISTMACHINE/GetReport.aspx?ersmcno=" + itemAtt.Mcno.Trim() + "');"+" class='btn btn-sm btn-info'> <i class='fa fa-file-pdf-o'></i> ERS</a>"
                        Else
                            itemAtt.PageOne = "<a href="+"JavaScript:newPopup('/RISTMACHINE/GetReport.aspx?pmcno=" + itemAtt.Mcno.Trim() + "&pageno=1');"+" class='btn btn-sm btn-info'><i class='fa fa-file-pdf-o'></i> Page 1</a>"
                    End If
                 Next

                'Page 2
                For Each itemAtt  In getdata.Where(Function(c) c.Mcno <> "")
                    If CountAttfilePageTwo(itemAtt.Mcno) <> 0  Then
                        itemAtt.PageTwo = "<a href="+"JavaScript:newPopup('/RISTMACHINE/GetReport.aspx?pmcno=" + itemAtt.Mcno.Trim() + "&pageno=2');"+" class='btn btn-sm btn-info'><i class='fa fa-file-pdf-o'></i> Page 2 <span class='badge'>"+ countAttfilePageTwo(itemAtt.Mcno).ToString() +"</span></a>"
                        else
                            itemAtt.PageTwo = "<a href="+"JavaScript:newPopup('/RISTMACHINE/GetReport.aspx?pmcno=" + itemAtt.Mcno.Trim() + "&pageno=2');"+" class='btn btn-sm btn-info'><i class='fa fa-file-pdf-o'></i> Page 2</a>"

                    End If
                Next

                'Page 3
                For Each itemAtt  In getdata.Where(Function(c) c.Mcno <> "")
                    If CountAttfilePageThree(itemAtt.Mcno) <> 0  Then
                        itemAtt.PageThree = "<a href="+"JavaScript:newPopup('/RISTMACHINE/GetReport.aspx?pmcno=" + itemAtt.Mcno.Trim() + "&pageno=3');"+" class='btn btn-sm btn-info'><i class='fa fa-file-pdf-o'></i> Page 3 <span class='badge'>"+ countAttfilePageThree(itemAtt.Mcno).ToString() +"</span></a>" + " <a href="+"JavaScript:newPopup('/RISTMACHINE/GetReport.aspx?att3mcno=" + itemAtt.Mcno.Trim() + "');"+" class='btn btn-sm btn-info'> <i class='fa fa-file-pdf-o'></i> Atch.</a>"
                    else
                        itemAtt.PageThree = "<a href="+"JavaScript:newPopup('/RISTMACHINE/GetReport.aspx?pmcno=" + itemAtt.Mcno.Trim() + "&pageno=3');"+" class='btn btn-sm btn-info'><i class='fa fa-file-pdf-o'></i> Page 3</a>"

                    End If
                Next

                If getdata.Count() <> 0 Then

                  

                    Dim dt As DataTable
                    dt = LinqResultToDataTable(getdata)

                    Dim sb = New StringBuilder()

                    'Table start.
                    sb.Append("<table class='table table-condensed'>")
                    'Table head.
                    sb.Append("<thead>
                        <tr class='active'>
                            <th><i class='fa fa-hashtag' aria-hidden='true'></i> NO.</th>
                            <th><i class='fa fa-user-circle-o' aria-hidden='true'></i> OPNO.</th>
                            <th><i class='fa fa-bars' aria-hidden='true'></i> MCNO.</th>
                            <th><i class='fa fa-file-pdf-o' aria-hidden='true'></i> Page-1.</th>
                            <th><i class='fa fa-file-pdf-o' aria-hidden='true'></i> Page-2.</th>
                            <th><i class='fa fa-file-pdf-o' aria-hidden='true'></i> Page-3.</th>
                            <th><i class='fa fa-check' aria-hidden='true'></i> APPROVE.</th>
                            <th><i class='fa fa-times' aria-hidden='true'></i> REJECT.</th>
                        </tr>
                  </thead>")
                    'Head end.

                    sb.Append("<tbody>")
                    'Add row
                    For Each row As DataRow In dt.Rows
                        sb.Append("<tr>")
                        For Each column As DataColumn In dt.Columns
                           
                            sb.Append("<td>" + row(column.ColumnName).ToString() + "</td>")
                            
                        Next
                        sb.Append("</tr>")
                    Next
                    sb.Append("</tbody>")

                    'Table end.
                    sb.Append("</table>")
                    ltTable.Text = sb.ToString

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
    Private Shared Function Decrypt(cipherText As String) As String
        Try
            Const encryptionKey As String = "RISTMC18NOVSYS"
            'If cipherText Is Nothing 
            '    Exit Function
            'Else 
            cipherText = cipherText.Replace(" ", "+")
            'End If

            Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
            Using encryptor As Aes = Aes.Create()
                Dim pdb As New Rfc2898DeriveBytes(encryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D,
                                                                             &H65, &H64, &H76, &H65, &H64, &H65,
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
        Catch ex As Exception

            Dim errorSend = New ExceptionLogging()
            errorSend.SendErrorTomail(ex)
            'Write Error to Log.txt
            ExceptionLogging.LogError(ex)

        Finally

        End Try

        Return cipherText
    End Function
    Protected Sub CallfunctionApprove()

        'get data for Sect.mgr  approve
        If Not String.IsNullOrEmpty(Request.QueryString("smcno")) Then
            Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("smcno")))
            ApproveSectmgr()
            Exit Sub
        End If

        'get data for Dept.mgr preview approve
        If Not String.IsNullOrEmpty(Request.QueryString("dmcno")) Then
            Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("dmcno")))
            ApproveDeptmgr()
            Exit Sub
        End If

        'get data for Div.mgr preview approve
        If Not String.IsNullOrEmpty(Request.QueryString("dimcno")) Then
            Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("dimcno")))
            ApproveDivmgr()
            Exit Sub
        End If

        'get data for Sub-Com preview approve
        If Not String.IsNullOrEmpty(Request.QueryString("scmcno")) Then
            Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("scmcno")))
            ApproveSubCom()
            Exit Sub
        End If

        'get data for Safety Officer preview approve
        If Not String.IsNullOrEmpty(Request.QueryString("sfmcno")) Then
            Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("sfmcno")))
            ApproveSafetyOfficer()
            Exit Sub
        End If

        'get data for Safety Mgr preview approve
        If Not String.IsNullOrEmpty(Request.QueryString("sfmgrmcno")) Then
            Mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("sfmgrmcno")))
            ApproveSafetyMgr()
            Exit Sub
        End If



    End Sub

    Private Shared Function CheckStatus(mcno As String) As Integer

        'Dim dt As Date
        'If Date.TryParse(value, dt) Then

        '    Return value
        'End If
        Dim statusid As Integer
        Using db As New DBRISTMCDataContext

            Try
                ' Mcno = Request.QueryString("emcno")
                Dim getstatus = db.TB_MACHINE_TOOL_CHECK_P3s.Where(Function(x) x.MC_NO = mcno).ToList()

                For Each g In getstatus
                    statusid = CInt(g.STATUS_ID)
                Next


            Catch ex As Exception
                Dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)

            Finally

                db.Dispose()
            End Try

        End Using


        Return statusid
    End Function
    Private Shared Function Encrypt(clearText As String) As String
        Const encryptionKey = "RISTMC18NOVSYS"
        Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(encryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D,
                                                                         &H65, &H64, &H76, &H65, &H64, &H65,
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
    Private Sub BindGridForMgr()
        Using db As New DBRISTMCDataContext()
            Try
                'Mcno = Request.QueryString("ep3mcno")

                gvmailapprove.DataSource = db.TB_MACHINE_DATAs.
                    Where(Function(m) m.MC_NO = Mcno).
                    Select(Function(m) New With {m.MC_NO, m.MAKER, m.COUNTRY, m.SUPPLIER, m.PROVIDER, m.TEL,
                              m.DIVISION, m.DEPARTMENT, m.SECTION, m.REGISTER_DATE, m.TYPE_MC, m.STATUS_NAME})
                gvmailapprove.DataBind()
            Catch ex As Exception
                Dim errorSend = New ExceptionLogging()
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


    Private Sub SendEmailToDeptMgr()
        Dim emaildeptEnc As String
        Dim emaildept As String
        Dim opnodept As String
        Dim deptmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try

                Dim opreq As String

                Dim reqno = db.TB_MACHINE_DATAs.Where(Function(c) c.MC_NO = Mcno).Select(Function(x) New With {.OpnoAdd = x.OPNO_ADD}).ToList()

                For Each x In reqno
                    opreq = x.OpnoAdd
                Next



                Dim d = db.TB_FLOW_REQUESTs.Where(Function(c) c.REQUEST_OP = opreq).ToList()


                For Each e In d
                    opnodept = e.DEPT_MGR_STAMP
                    emaildept = e.DEPT_MGR_EMAIL
                    emaildeptEnc = HttpUtility.UrlEncode(Encrypt(e.DEPT_MGR_EMAIL))

                    BindGridForMgr()

                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emaildept)
                            mm.Subject = "Machine Register No. " & Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Dept.Mgr Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/ViewApprove.aspx?dmcno={1}&demail={2}'>Click</a> <br /><br />
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
                Dim errorSend = New ExceptionLogging()
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

    Private Sub SendEmailToDivMgr()
        Dim emaildivEnc As String
        Dim emaildiv As String
        Dim opnodiv As String
        Dim divmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try
                'searchflow step for divmgr with req opno
                Dim opreq As String
                Dim reqno = db.TB_MACHINE_DATAs.Where(Function(c) c.MC_NO = Mcno).Select(Function(x) New With {.OpnoAdd = x.OPNO_ADD}).ToList()

                For Each x In reqno
                    opreq = x.OpnoAdd
                Next

                Dim d = db.TB_FLOW_REQUESTs.Where(Function(c) c.REQUEST_OP = opreq).ToList()

                For Each e In d
                    opnodiv = e.DIV_MGR_OP
                    emaildiv = e.DIV_MGR_EMAIL
                    emaildivEnc = HttpUtility.UrlEncode(Encrypt(e.DIV_MGR_EMAIL))

                    BindGridForMgr
                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emaildiv)
                            mm.Subject = "Machine Register No. " & Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Division Manager Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/ViewApprove.aspx?dimcno={1}&diemail={2}'>Click</a> <br /><br />
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
                Dim errorSend = New ExceptionLogging()
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

    Private Sub SendEmailToSubCom()
        Dim emailSubcomEnc As String
        Dim emailSubcom As String
        Dim opnoSubcom As String
        Dim subcommcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try


                Dim d = db.TB_FLOW_SAFETies.ToList()

                For Each e In d
                    opnoSubcom = e.MCESUBCOM_OP
                    emailSubcom = e.MCESUBCOM_EMAIL
                    emailSubcomEnc = HttpUtility.UrlEncode(Encrypt(e.MCESUBCOM_EMAIL))

                    BindGridForMgr()

                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emailSubcom)
                            mm.Subject = "Machine Register No. " & Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Sub-Com Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/ViewApprove.aspx?scmcno={1}&scemail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnoSubcom, subcommcno, emailSubcomEnc)
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
                Dim errorSend = New ExceptionLogging()
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

    Private Sub SendEmailToSafetyOfficer()
        Dim emailSfofficerEnc As String
        Dim emailSfofficer As String
        Dim opnoSfofficer As String
        Dim sfofficermcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try


                Dim d = db.TB_FLOW_SAFETies.ToList()

                For Each e In d
                    opnoSfofficer = e.SAFETYOFF_OP
                    emailSfofficer = e.SAFETYOFF_EMAIL
                    emailSfofficerEnc = HttpUtility.UrlEncode(Encrypt(e.SAFETYOFF_EMAIL))

                    BindGridForMgr()

                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emailSfofficer)
                            mm.Subject = "Machine Register No. " & Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Safety Officer Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/ViewApprove.aspx?sfmcno={1}&sfemail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnoSfofficer, sfofficermcno, emailSfofficerEnc)
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
                Dim errorSend = New ExceptionLogging()
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

    Private Sub SendEmailToSafetyMgr()
        Dim emailSfmgrEnc As String
        Dim emailSfmgr As String
        Dim opnoSfmgr As String
        Dim sfmgrmcno As String = HttpUtility.UrlEncode(Encrypt(Mcno))
        Using db As New DBRISTMCDataContext()
            Try

                Dim d = db.TB_FLOW_SAFETies.ToList()
                'Dim d = From t In db.TB_FLOW_SAFETies Select t

                For Each e In d
                    opnoSfmgr = e.SAFETYMGR_OP
                    emailSfmgr = e.SAFETYMGR_EMAIL
                    emailSfmgrEnc = HttpUtility.UrlEncode(Encrypt(e.SAFETYMGR_EMAIL))

                    BindGridForMgr()

                    Using sw As New StringWriter()
                        Using hw As New HtmlTextWriter(sw)
                            gvmailapprove.RenderControl(hw)
                            Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", emailSfmgr)
                            mm.Subject = "Machine Register No. " & Mcno & ""
                            mm.Body = String.Format("Hi {0},<br /><br />
                                                    Machine register no. " & Mcno & "<br /><br />
                                                    Waiting for Safety Mgr. Approve
                                                    Please see details link <a href='http://10.29.1.86/RISTMACHINE/ViewApprove.aspx?sfmgrmcno={1}&sfmgremail={2}'>Click</a> <br /><br />
                                                    <hr />" & sw.ToString() & "<br /><br />
                                                    Thank You.", opnoSfmgr, sfmgrmcno, emailSfmgrEnc)
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
                Dim errorSend = New ExceptionLogging()
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

    '1-Section mgr Approve
    Private Sub ApproveSectmgr()
        Dim emailsect = Decrypt(HttpUtility.UrlDecode(Request.QueryString("semail")))
        Using db As New DBRISTMCDataContext
            Try
                'get op req from tb machine data
                Dim opnoreq As String = String.Empty

                Dim q = db.TB_MACHINE_DATAs.
                        Where(Function(t) t.MC_NO = Mcno).ToList()


                For Each o In q
                    opnoreq = o.OPNO_ADD
                Next
                'get flow sectmgr approve
                Dim sectmgrname As String
                Dim sect = db.TB_FLOW_REQUESTs.
                Where(Function(f) f.REQUEST_OP = opnoreq And f.SECT_MGR_EMAIL = emailsect)


                For Each a In sect
                    sectmgrname = a.SECT_MGR_STAMP
                Next

                Dim s As TB_MACHINE_DATA = db.TB_MACHINE_DATAs.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                s.SECT_MGR_NAME_APPROVE = sectmgrname
                s.SECT_MGR_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 2
                s.STATUS_NAME = "@Sect.Mgr Approved"

                Dim x As TB_MACHINE_TOOL_CHECK_P3 = db.TB_MACHINE_TOOL_CHECK_P3s.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                x.STATUS_ID = 2
                x.STATUS_NAME = "@Sect.Mgr Approved"

                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                Dim errorSend = New ExceptionLogging()
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

                Dim q = db.TB_MACHINE_DATAs.
                        Where(Function(t) t.MC_NO = Mcno).ToList()

                For Each o In q
                    opnoreq = o.OPNO_ADD
                Next
                'get flow deptmgr approve
                Dim deptmgrname As String

                Dim dept = db.TB_FLOW_REQUESTs.
                        Where(Function(f) f.REQUEST_OP = opnoreq And f.DEPT_MGR_EMAIL = emaildept)

                For Each a In dept
                    deptmgrname = a.DEPT_MGR_STAMP
                Next

                Dim s As TB_MACHINE_DATA = db.TB_MACHINE_DATAs.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                s.DEPT_MGR_NAME_APPROVE = deptmgrname
                s.DEPT_MGR_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 3
                s.STATUS_NAME = "@Dept.Mgr Approved"

                Dim x As TB_MACHINE_TOOL_CHECK_P3 = db.TB_MACHINE_TOOL_CHECK_P3s.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                x.STATUS_ID = 3
                x.STATUS_NAME = "@Dept.Mgr Approved"


                'Dim s As TB_MACHINE_DATA = (From u In db.TB_MACHINE_DATAs Where u.MC_NO = Mcno Select u).FirstOrDefault()
                's.DEPT_MGR_NAME_APPROVE = deptmgrname
                's.DEPT_MGR_APPROVE_DATE = DateTime.Now
                's.STATUS_ID = 3
                's.STATUS_NAME = "@Dept.Mgr Approved"

                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                Dim errorSend = New ExceptionLogging()
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
                SendEmailToDivMgr()
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

                Dim q = db.TB_MACHINE_DATAs.
                        Where(Function(t) t.MC_NO = Mcno).ToList()

                For Each o In q
                    opnoreq = o.OPNO_ADD
                Next
                'get flow deptmgr approve
                Dim divmgrname As String

                Dim div = db.TB_FLOW_REQUESTs.
                        Where(Function(f) f.REQUEST_OP = opnoreq And f.DIV_MGR_EMAIL = emaildiv)

                For Each a In div
                    divmgrname = a.DIV_MGR_STAMP
                Next

                'Dim s As TB_MACHINE_DATA = (From u In db.TB_MACHINE_DATAs Where u.MC_NO = Mcno Select u).FirstOrDefault()
                's.DIV_MGR_NAME_APPROVE = divmgrname
                's.DIV_MGR_APPROVE_DATE = DateTime.Now
                's.STATUS_ID = 4
                's.STATUS_NAME = "@Div.Mgr Approved"


                Dim s As TB_MACHINE_DATA = db.TB_MACHINE_DATAs.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                s.DIV_MGR_NAME_APPROVE = divmgrname
                s.DIV_MGR_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 4
                s.STATUS_NAME = "@Div.Mgr Approved"

                Dim x As TB_MACHINE_TOOL_CHECK_P3 = db.TB_MACHINE_TOOL_CHECK_P3s.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                x.STATUS_ID = 4
                x.STATUS_NAME = "@Div.Mgr Approved"

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
                Dim subcom = db.TB_FLOW_SAFETies.
                             Where(Function(f) f.MCESUBCOM_EMAIL = emailsubcom).ToList()


                For Each a In subcom
                    subcomname = a.MCESUBCOM_STAMP
                Next

                Dim s As TB_MACHINE_DATA = db.TB_MACHINE_DATAs.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                s.MCEQ_SUBCOM_NAME_APPROVE = subcomname
                s.MCEQ_SUBCOM_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 5
                s.STATUS_NAME = "@Sub-Com Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                Dim errorSend = New ExceptionLogging()
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

    '5-Safety-offer Approve
    Private Sub ApproveSafetyOfficer()
        Dim emailsfofficer = Decrypt(HttpUtility.UrlDecode(Request.QueryString("sfemail")))
        Using db As New DBRISTMCDataContext
            Try

                Dim sfname As String
                Dim safetyofficer = db.TB_FLOW_SAFETies.
                                    Where(Function(f) f.SAFETYOFF_EMAIL = emailsfofficer).ToList()


                For Each a In safetyofficer
                    sfname = a.SAFETYOFF_STAMP
                Next

                Dim s As TB_MACHINE_DATA = db.TB_MACHINE_DATAs.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                s.SAFETY_OFFICER_NAME_APPROVE = sfname
                s.SAFETY_OFFICER_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 6
                s.STATUS_NAME = "@Safety Officer Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                Dim errorSend = New ExceptionLogging()
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

    '6-Safety-mgr Approve
    Private Sub ApproveSafetyMgr()
        Dim emailsfmgr = Decrypt(HttpUtility.UrlDecode(Request.QueryString("sfmgremail")))
        Using db As New DBRISTMCDataContext
            Try

                Dim sfmgrname As String
                Dim safetymgr = db.TB_FLOW_SAFETies.
                                Where(Function(f) f.SAFETYMGR_EMAIL = emailsfmgr).ToList()


                For Each a In safetymgr
                    sfmgrname = a.SAFETYMGR_STAMP
                Next

                Dim s As TB_MACHINE_DATA = db.TB_MACHINE_DATAs.FirstOrDefault(Function(u) u.MC_NO = Mcno)
                s.SAFETY_MGR_NAME_APPROVE = sfmgrname
                s.SAFETY_MGR_APPROVE_DATE = DateTime.Now
                s.STATUS_ID = 7
                s.STATUS_NAME = "@Safety Mgr Approved"
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "mgrapprove()", True)
            Catch ex As Exception
                Dim errorSend = New ExceptionLogging()
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
                SendEmailToSafetyMgr()
            End Try
        End Using
    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        ' Verifies that the control is rendered
    End Sub

End Class