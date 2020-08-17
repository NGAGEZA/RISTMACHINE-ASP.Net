Option Strict On
Option Explicit On

Imports System.Drawing
Imports System.IO
Imports System.Security.Cryptography
Imports Oracle.DataAccess.Client

Public Class AdminSetFlow
    Inherits System.Web.UI.Page
    Protected Property StampSectMgr() As String
    Protected Property StampDeptMgr() As String
    Protected Property StampDivMgr() As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        Else

            BindGrid
            If Not String.IsNullOrEmpty(Request.QueryString("ID")) Then

                If lnksave.Text <> "UPDATE"
                    GetDataForedit
                    lnksave.Text = "UPDATE"
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                End If


            End If

        End If
    End Sub
    Private Sub BindGrid()
        Using db As New DBRISTMCDataContext()
            Try
                gvflow.DataSource = From f In db.TB_FLOW_REQUESTs
                    Select New With {f.ID, f.REQUEST_OP, f.SECT_MGR_OP, f.SECT_MGR_EMAIL, f.DEPT_MGR_OP, f.DEPT_MGR_EMAIL, f.DIV_MGR_OP, f.DIV_MGR_EMAIL,
                        f.RATING, f.CREATE_DATE}
                gvflow.DataBind()
            Catch ex As Exception

                Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
                message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
           
        End Using
    End Sub
    Protected Sub gvflow_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim row As GridViewRow = New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal)
        Try
            For i As Integer = 0 To gvflow.Columns.Count - 1
                Dim cell As TableHeaderCell = New TableHeaderCell()
                Dim txtSearch As TextBox = New TextBox()
                txtSearch.Attributes("placeholder") = gvflow.Columns(i).HeaderText
                txtSearch.CssClass = "search_textbox form-control input-sm"
                cell.Controls.Add(txtSearch)
                row.Controls.Add(cell)
            Next
            If gvflow.HeaderRow IsNot Nothing
                gvflow.HeaderRow.Parent.Controls.AddAt(1, row)
            End If
        Catch ex As Exception
            Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
            message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
            message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
            message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
        Finally
            'db.Dispose()
        End Try
        

    End Sub
    Protected Sub Insert()
        Using db As New DBRISTMCDataContext()
           Try
                    '//function get last record rating
                Dim getrating = (From t In db.TB_FLOW_REQUESTs Where t.REQUEST_OP = txtopnorequest.Value.Trim()
                        Order By t.RATING Descending
                        Select t).FirstOrDefault()

            
                Dim getrate As Integer
           
                If getrating Is Nothing
                    getrate = 1
                Else 
                    getrate = CInt(getrating.RATING + 1)

                End If

                Dim flowset As New TB_FLOW_REQUEST() With {
                    .REQUEST_OP = txtopnorequest.Value,
                    .SECT_MGR_OP = txtopnosectmgr.Value,
                    .SECT_MGR_EMAIL = tbemailsectmgr.Value,
                    .SECT_MGR_STAMP = StampSectMgr,
                    .DEPT_MGR_OP = txtopnodeptmgr.Value,
                    .DEPT_MGR_EMAIL = tbemaildeptmgr.Value,
                    .DEPT_MGR_STAMP = StampDeptMgr,
                    .DIV_MGR_OP = txtopnodivmgr.Value,
                    .DIV_MGR_EMAIL = tbemaildivmgr.Value,
                    .DIV_MGR_STAMP = StampDivMgr,
                    .RATING = getrate,
                    .CREATE_DATE = DateTime.Now
                    }
                db.TB_FLOW_REQUESTs.InsertOnSubmit(flowset)
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "InsertComplete()", True)
           Catch ex As Exception
                Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
                message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
            
        End Using
        BindGrid()
    End Sub

    Protected Sub Update()
        Using db As New DBRISTMCDataContext()
            Try
                
                Dim f As TB_FLOW_REQUEST = (From u In db.TB_FLOW_REQUESTs Where u.REQUEST_OP = txtopnorequest.Value Select u).FirstOrDefault()
                f.SECT_MGR_OP = txtopnosectmgr.Value
                f.SECT_MGR_EMAIL = tbemailsectmgr.Value
                f.DEPT_MGR_OP = txtopnodeptmgr.Value
                f.DEPT_MGR_EMAIL = tbemaildeptmgr.Value
                f.DIV_MGR_OP = txtopnodivmgr.Value
                f.DIV_MGR_EMAIL = tbemaildivmgr.Value
                f.UPDATE_DATE = DateTime.Now
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "UpdateComplete()", True)
            Catch ex As Exception
                Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
                message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
        End Using
        BindGrid()
    End Sub
    Protected Sub GetDataForedit()
        Dim ID As Integer
        'mcno = Decrypt(HttpUtility.UrlDecode(Request.QueryString("rmcno")))
        ID = CInt(Request.QueryString("ID"))
        lbmodalhead.Text = "Edit"
        Using db As New DBRISTMCDataContext()
            Try
                  'select condition
            Dim getdata = From d In db.TB_FLOW_REQUESTs
                          Where d.ID = ID
                          Select d

            If getdata.Any()

                For Each f In getdata
                    txtopnorequest.Value = f.REQUEST_OP
                    txtopnosectmgr.Value = f.SECT_MGR_OP
                    tbemailsectmgr.Value = f.SECT_MGR_EMAIL
                    txtopnodeptmgr.Value = f.DEPT_MGR_OP
                    tbemaildeptmgr.Value = f.DEPT_MGR_EMAIL
                    txtopnodivmgr.Value = f.DIV_MGR_OP
                    tbemaildivmgr.Value = f.DIV_MGR_EMAIL

                Next
               
            Else

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Nodata()", True)

            End If
            Catch ex As Exception
                Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
                message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try
          

        End Using
    End Sub



    Private Function Encrypt(clearText As String) As String
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
    Private Function Decrypt(cipherText As String) As String
        Dim EncryptionKey As String = "RISTMC18NOVSYS"
        'If cipherText Is Nothing 
        '    Exit Function
        'Else 
        cipherText = cipherText.Replace(" ", "+")
        'End If

        Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D, _
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
    Protected Sub GetSectMgrDetail()

        Dim opnosectmgr As String = txtopnosectmgr.Value.Trim()
        Dim query As String = String.Empty
        query = "SELECT NAMEMPE,EMAIL from hrms.V_EMPMAIL WHERE CODEMPID = " & "'" & opnosectmgr & "'"
        Dim conStrDbhrms As String = ConfigurationManager.ConnectionStrings("CONN_HRMS").ConnectionString
        Using con As New OracleConnection(conStrDbhrms)
            Try
                Using cmd As New OracleCommand(query)
                Using sda As New OracleDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)

                        Dim dt As New DataTable()
                        Dim fullname As String = String.Empty
                        Dim n1 As String = String.Empty
                        Dim n2 As String = String.Empty
                        dt = ds.Tables(0)

                        If dt.Rows.Count <> 0 Then

                            For Each dr As DataRow In dt.Rows

                               
                                If dr.IsNull("NAMEMPE") = True Then

                                    fullname = "-"
                                Else
                                    fullname = dr("NAMEMPE").ToString.Trim.ToUpper
                                    Dim spname As String() = fullname.Split(New Char() {" "c})
                                    Select Case spname.Length
                                        Case 2
                                            Dim n As String = String.Empty
                                            n = spname(0).ToUpper() + " "
                                            Dim np As String() = n.Split(New Char() {"."c})
                                            'for japan user
                                            If Mid(opnosectmgr,1,1) = "J" Then
                                                n1 = mid(np(1),1,1).ToUpper() + ". "
                                                n2 = spname(1).ToUpper()
                                            Else 
                                                n1 = np(1).ToUpper() + " "
                                                n2 = Mid(spname(1), 1, 1).ToUpper() + "."
                                            End If

                                        Case 3
                                            'for japan user
                                            if Mid(opnosectmgr,1,1) = "J" Then
                                                n1 = mid(spname(1),1,1).ToUpper() + ". "
                                                n2 = spname(2).ToUpper()
                                            Else
                                                n1 = spname(1).ToUpper() + " "
                                                n2 = Mid(spname(2), 1, 1).ToUpper() + "."
                                            End If
                                    End Select


                                End If
                                 If dr.IsNull("EMAIL") = True Then  
                                    tbemailsectmgr.Value = tbemailsectmgr.Value.Trim()
                                    else
                                    tbemailsectmgr.Value = dr("EMAIL").ToString()
                                 End If

                            Next
                            StampSectMgr = n1 + n2
                            'check email sect mgr no data show alert
                            
                            If tbemailsectmgr.Value.Trim() = "" Then
                                'show alet modal focus textbox email sect mgr
                                tbemailsectmgr.Disabled = False
                                lbmsgmodalsect.Text = "Please insert Email. Sect.Mgr"
                                lbmsgmodalsect.ForeColor = Color.Red
                                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                                Exit Sub
                            Else
                                lbmsgmodalsect.Text = ""
                            End If
                            
                        Else
                            
                           ' Exit Sub
                        End If

                    End Using
                End Using
            End Using
            Catch ex As Exception
                Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
                message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                'db.Dispose()
            End Try
            
        End Using

    End Sub
    Protected Sub GetDeptMgrDetail()

        Dim opnodeptmgr As String = txtopnodeptmgr.Value.Trim()
        Dim query As String = String.Empty
        query = "SELECT NAMEMPE,EMAIL from hrms.V_EMPMAIL WHERE CODEMPID = " & "'" & opnodeptmgr & "'"
        Dim conStrDbhrms As String = ConfigurationManager.ConnectionStrings("CONN_HRMS").ConnectionString
        Using con As New OracleConnection(conStrDbhrms)
            Try
                Using cmd As New OracleCommand(query)
                    Using sda As New OracleDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)

                        Dim dt As New DataTable()
                        Dim fullname As String = String.Empty
                        Dim n1 As String = String.Empty
                        Dim n2 As String = String.Empty
                        dt = ds.Tables(0)

                        If dt.Rows.Count <> 0 Then

                            For Each dr As DataRow In dt.Rows

                               
                                If dr.IsNull("NAMEMPE") = True Then

                                    fullname = "-"
                                Else
                                    fullname = dr("NAMEMPE").ToString.Trim.ToUpper
                                    Dim spname As String() = fullname.Split(New Char() {" "c})
                                    Select Case spname.Length
                                        Case 2
                                            Dim n As String = String.Empty
                                            n = spname(0).ToUpper() + " "
                                            Dim np As String() = n.Split(New Char() {"."c})

                                            'for japan user
                                            If Mid(opnodeptmgr,1,1) = "J" Then
                                                n1 = mid(np(1),1,1).ToUpper() + ". "
                                                n2 = spname(1).ToUpper()
                                            Else 
                                                n1 = np(1).ToUpper() + " "
                                                n2 = Mid(spname(1), 1, 1).ToUpper() + "."
                                            End If
                                           
                                        Case 3
                                            'for japan user
                                            if Mid(opnodeptmgr,1,1) = "J" Then
                                                n1 = mid(spname(1),1,1).ToUpper() + ". "
                                                n2 = spname(2).ToUpper()
                                            Else
                                                n1 = spname(1).ToUpper() + " "
                                                n2 = Mid(spname(2), 1, 1).ToUpper() + "."
                                            End If
                                          
                                    End Select


                                End If
                                 If dr.IsNull("EMAIL") = True Then  
                                    tbemaildeptmgr.Value = tbemaildeptmgr.Value.Trim()
                                    
                                    else
                                    tbemaildeptmgr.Value = dr("EMAIL").ToString()
                                 End If

                            Next
                            StampDeptMgr = n1 + n2
                            'check email dept mgr no data show alert
                            If tbemaildeptmgr.Value.Trim() = "" Then
                                'show alet modal focus textbox email dept mgr
                                tbemaildeptmgr.Disabled = False
                                lbmsgmodaldept.Text = "Please insert Email. Dept.Mgr"
                                lbmsgmodaldept.ForeColor = Color.Red
                                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                                Exit Sub
                            Else
                                lbmsgmodaldept.Text = ""
                            End If
                            
                        Else
                            
                           ' Exit Sub
                        End If

                    End Using
                End Using
            End Using
            Catch ex As Exception
                Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
                message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                'db.Dispose()
            End Try
            
        End Using

    End Sub
    Protected Sub GetDivMgrDetail()

        Dim opnodivmgr As String = txtopnodivmgr.Value.Trim()
        Dim query As String = String.Empty
        query = "SELECT NAMEMPE,EMAIL from hrms.V_EMPMAIL WHERE CODEMPID = " & "'" & opnodivmgr & "'"
        Dim conStrDbhrms As String = ConfigurationManager.ConnectionStrings("CONN_HRMS").ConnectionString
        Using con As New OracleConnection(conStrDbhrms)
            Try
                Using cmd As New OracleCommand(query)
                Using sda As New OracleDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)

                        Dim dt As New DataTable()
                        Dim fullname As String = String.Empty
                        Dim n1 As String = String.Empty
                        Dim n2 As String = String.Empty
                        dt = ds.Tables(0)

                        If dt.Rows.Count <> 0 Then

                            For Each dr As DataRow In dt.Rows

                               
                                If dr.IsNull("NAMEMPE") = True Then

                                    fullname = "-"
                                Else
                                    fullname = dr("NAMEMPE").ToString.Trim.ToUpper
                                    Dim spname As String() = fullname.Split(New Char() {" "c})
                                    Select Case spname.Length
                                        Case 2
                                            Dim n As String = String.Empty
                                            n = spname(0).ToUpper() + " "
                                            Dim np As String() = n.Split(New Char() {"."c})
                                            'for japan user
                                            If Mid(opnodivmgr,1,1) = "J" Then
                                                    n1 = mid(np(1),1,1).ToUpper() + ". "
                                                    n2 = spname(1).ToUpper()
                                                Else 
                                                    n1 = np(1).ToUpper() + " "
                                                    n2 = Mid(spname(1), 1, 1).ToUpper() + "."
                                            End If
                                            

                                        Case 3
                                            'for japan user
                                            if Mid(opnodivmgr,1,1) = "J" Then
                                                    n1 = mid(spname(1),1,1).ToUpper() + ". "
                                                    n2 = spname(2).ToUpper()
                                                Else
                                                    n1 = spname(1).ToUpper() + " "
                                                    n2 = Mid(spname(2), 1, 1).ToUpper() + "."
                                            End If
                                            


                                            

                                    End Select

                                   
                                End If
                                 If dr.IsNull("EMAIL") = True Then  
                                    tbemaildivmgr.Value = tbemaildivmgr.Value.Trim()
                                    
                                    else
                                    tbemaildivmgr.Value = dr("EMAIL").ToString()
                                 End If

                            Next
                            StampDivMgr = n1 + n2
                            'check email div mgr no data show alert
                            If tbemaildivmgr.Value.Trim() = "" Then
                                'show alet modal focus textbox email div mgr
                                tbemaildivmgr.Disabled = False
                                lbmsgmodaldiv.Text = "Please insert Email. Div.Mgr"
                                lbmsgmodaldiv.ForeColor = Color.Red
                                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                                Exit Sub
                            Else 
                                lbmsgmodaldiv.Text = ""
                            End If
                            
                        Else
                            
                           ' Exit Sub
                        End If

                    End Using
                End Using
            End Using
            Catch ex As Exception
                Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
                message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                'db.Dispose()
            End Try
            
        End Using

    End Sub
    Protected Sub Callfunction()
        Select Case lnksave.Text
            Case "SAVE"
                GetSectMgrDetail
                GetDeptMgrDetail
                GetDivMgrDetail
                if tbemailsectmgr.Value = "" Then
                    'show alet modal focus textbox email sect mgr
                    tbemailsectmgr.Disabled = False
                    lbmsgmodalsect.Text = "Please insert Email. Sect.Mgr"
                    lbmsgmodalsect.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub

                End If
                If tbemaildeptmgr.Value = "" Then
                    'show alet modal focus textbox email dept mgr
                    tbemaildeptmgr.Disabled = False
                    lbmsgmodaldept.Text = "Please insert Email. Dept.Mgr"
                    lbmsgmodaldept.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub
                End If
                If tbemaildivmgr.Value = "" Then
                    'show alet modal focus textbox email div mgr
                    tbemaildivmgr.Disabled = False
                    lbmsgmodaldiv.Text = "Please insert Email. Div.Mgr"
                    lbmsgmodaldiv.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub
                End If
                'insert data to sql
                Insert()

            Case "UPDATE"
                Update()
        End Select
    End Sub
End Class