Option Strict On
Option Explicit On

Imports System.IO
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
                MakeTable()
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
                                                                                              .Approve = "<button type='button' class='btn btn-sm btn-primary'>Approve</button>",
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
        Catch ex As Exception

            dim errorSend = New ExceptionLogging()
            errorSend.SendErrorTomail(ex)
            'Write Error to Log.txt
            ExceptionLogging.LogError(ex)

        Finally
          
        End Try
       
        Return cipherText
    End Function

End Class