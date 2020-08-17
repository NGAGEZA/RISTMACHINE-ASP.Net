Option Strict On
Option Explicit On

Imports System.Drawing
Imports System.IO
Imports System.Security.Cryptography
Imports Oracle.DataAccess.Client

Public Class AdminSetFlowSafety
    Inherits System.Web.UI.Page
    Protected Property StampSubCom() As String
    Protected Property StampSfOfficer() As String
    Protected Property StampSfMgr() As String
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
                gvflow.DataSource = From f In db.TB_FLOW_SAFETies
                                    Select New With {f.ID, f.MCESUBCOM_OP, f.MCESUBCOM_EMAIL, f.SAFETYOFF_OP, f.SAFETYOFF_EMAIL, f.SAFETYMGR_OP, f.SAFETYMGR_EMAIL, f.CREATE_DATE}
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
                txtSearch.CssClass = "search_textbox form-control input-sm text-center"
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
                'Dim getrating = (From t In db.TB_FLOW_SAFETies Where t.REQUEST_OP = txtopnorequest.Value.Trim()
                '        Order By t.RATING Descending
                '        Select t).FirstOrDefault()


                'Dim getrate As Integer

                'If getrating Is Nothing
                '    getrate = 1
                'Else 
                '    getrate = CInt(getrating.RATING + 1)

                'End If

                Dim flowset As New TB_FLOW_SAFETY() With {
                    .MCESUBCOM_OP = txtopnosubcom.Value.Trim,
                    .MCESUBCOM_EMAIL = tbemailsubcom.Value.Trim,
                    .MCESUBCOM_STAMP = StampSubCom,
                    .SAFETYOFF_OP = txtopnosfofficer.Value.Trim,
                    .SAFETYOFF_EMAIL = tbemailsfofficer.Value.Trim,
                    .SAFETYOFF_STAMP = StampSfOfficer,
                    .SAFETYMGR_OP = txtopnosfmgr.Value.Trim,
                    .SAFETYMGR_EMAIL = tbemailsfmgr.Value.Trim,
                    .SAFETYMGR_STAMP = StampSfMgr,
                    .CREATE_DATE = DateTime.Now
                    }
                db.TB_FLOW_SAFETies.InsertOnSubmit(flowset)
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
                 Dim ID As Integer
        
                ID = CInt(Request.QueryString("ID"))
                Dim f As TB_FLOW_SAFETY = (From u In db.TB_FLOW_SAFETies Where u.ID = ID Select u).FirstOrDefault()
                f.MCESUBCOM_OP = txtopnosubcom.Value.Trim
                f.MCESUBCOM_EMAIL = tbemailsubcom.Value.Trim
                f.SAFETYOFF_OP = txtopnosfofficer.Value.Trim
                f.SAFETYOFF_EMAIL = tbemailsfofficer.Value.Trim
                f.SAFETYMGR_OP = txtopnosfmgr.Value.Trim
                f.SAFETYMGR_EMAIL = tbemailsfmgr.Value.Trim
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
            Dim getdata = From d In db.TB_FLOW_SAFETies
                          Where d.ID = ID
                          Select d

            If getdata.Any()

                For Each f In getdata
                    txtopnosubcom.Value = f.MCESUBCOM_OP
                    tbemailsubcom.Value = f.MCESUBCOM_EMAIL
                    txtopnosfofficer.Value = f.SAFETYMGR_OP
                    tbemailsfofficer.Value = f.SAFETYOFF_EMAIL
                    txtopnosfmgr.Value = f.SAFETYMGR_OP
                    tbemailsfmgr.Value = f.SAFETYOFF_EMAIL
                   

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
    Protected Sub GetSubComDetail()

        Dim opnosubcom As String = txtopnosubcom.Value.Trim()
        Dim query As String = String.Empty
        query = "SELECT NAMEMPE,EMAIL from hrms.V_EMPMAIL WHERE CODEMPID = " & "'" & opnosubcom & "'"
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
                                                If Mid(opnosubcom, 1, 1) = "J" Then
                                                    n1 = Mid(np(1), 1, 1).ToUpper() + ". "
                                                    n2 = spname(1).ToUpper()
                                                Else
                                                    n1 = np(1).ToUpper() + " "
                                                    n2 = Mid(spname(1), 1, 1).ToUpper() + "."
                                                End If

                                            Case 3
                                                'for japan user
                                                If Mid(opnosubcom, 1, 1) = "J" Then
                                                    n1 = Mid(spname(1), 1, 1).ToUpper() + ". "
                                                    n2 = spname(2).ToUpper()
                                                Else
                                                    n1 = spname(1).ToUpper() + " "
                                                    n2 = Mid(spname(2), 1, 1).ToUpper() + "."
                                                End If
                                        End Select


                                    End If
                                    If dr.IsNull("EMAIL") = True Then
                                        tbemailsubcom.Value = tbemailsubcom.Value.Trim()
                                    Else
                                        tbemailsubcom.Value = dr("EMAIL").ToString()
                                    End If

                                Next
                                StampSubCom = n1 + n2
                                'check email sect mgr no data show alert

                                If tbemailsubcom.Value.Trim() = "" Then
                                    'show alet modal focus textbox email sect mgr
                                    tbemailsubcom.Disabled = False
                                    lbmsgmodalsubcom.Text = "Please insert Email. SubCom"
                                    lbmsgmodalsubcom.ForeColor = Color.Red
                                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                                    Exit Sub
                                Else
                                    'lbmsgmodalsect.Text = ""
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

    Protected Sub GetsafetyOfficerDetail()

        Dim opnosfofficer As String = txtopnosfofficer.Value.Trim()
        Dim query As String = String.Empty
        query = "SELECT NAMEMPE,EMAIL from hrms.V_EMPMAIL WHERE CODEMPID = " & "'" & opnosfofficer & "'"
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
                                                If Mid(opnosfofficer, 1, 1) = "J" Then
                                                    n1 = Mid(np(1), 1, 1).ToUpper() + ". "
                                                    n2 = spname(1).ToUpper()
                                                Else
                                                    n1 = np(1).ToUpper() + " "
                                                    n2 = Mid(spname(1), 1, 1).ToUpper() + "."
                                                End If

                                            Case 3
                                                'for japan user
                                                If Mid(opnosfofficer, 1, 1) = "J" Then
                                                    n1 = Mid(spname(1), 1, 1).ToUpper() + ". "
                                                    n2 = spname(2).ToUpper()
                                                Else
                                                    n1 = spname(1).ToUpper() + " "
                                                    n2 = Mid(spname(2), 1, 1).ToUpper() + "."
                                                End If
                                        End Select


                                    End If
                                    If dr.IsNull("EMAIL") = True Then
                                        tbemailsfofficer.Value = tbemailsfofficer.Value.Trim()
                                    Else
                                        tbemailsfofficer.Value = dr("EMAIL").ToString()
                                    End If

                                Next
                                StampSfOfficer = n1 + n2
                                'check email sect mgr no data show alert

                                If tbemailsfofficer.Value.Trim() = "" Then
                                    'show alet modal focus textbox email sect mgr
                                    tbemailsfofficer.Disabled = False
                                    lbmsgmodalsfofficer.Text = "Please insert Email. Safety Officer"
                                    lbmsgmodalsfofficer.ForeColor = Color.Red
                                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                                    Exit Sub
                                Else
                                    'lbmsgmodalsect.Text = ""
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
    Protected Sub GetsafetymgrDetail()

        Dim opnosfmgr As String = txtopnosfmgr.Value.Trim()
        Dim query As String = String.Empty
        query = "SELECT NAMEMPE,EMAIL from hrms.V_EMPMAIL WHERE CODEMPID = " & "'" & opnosfmgr & "'"
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
                                                If Mid(opnosfmgr, 1, 1) = "J" Then
                                                    n1 = Mid(np(1), 1, 1).ToUpper() + ". "
                                                    n2 = spname(1).ToUpper()
                                                Else
                                                    n1 = np(1).ToUpper() + " "
                                                    n2 = Mid(spname(1), 1, 1).ToUpper() + "."
                                                End If

                                            Case 3
                                                'for japan user
                                                If Mid(opnosfmgr, 1, 1) = "J" Then
                                                    n1 = Mid(spname(1), 1, 1).ToUpper() + ". "
                                                    n2 = spname(2).ToUpper()
                                                Else
                                                    n1 = spname(1).ToUpper() + " "
                                                    n2 = Mid(spname(2), 1, 1).ToUpper() + "."
                                                End If
                                        End Select


                                    End If
                                    If dr.IsNull("EMAIL") = True Then
                                        tbemailsfmgr.Value = tbemailsfmgr.Value.Trim()
                                    Else
                                        tbemailsfmgr.Value = dr("EMAIL").ToString()
                                    End If

                                Next
                                StampSfMgr = n1 + n2
                                'check email sect mgr no data show alert

                                If tbemailsfmgr.Value.Trim() = "" Then
                                    'show alet modal focus textbox email sect mgr
                                    tbemailsfmgr.Disabled = False
                                    lbmsgmodalsfmgr.Text = "Please insert Email. Safety MGR."
                                    lbmsgmodalsfmgr.ForeColor = Color.Red
                                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                                    Exit Sub
                                Else
                                    'lbmsgmodalsect.Text = ""
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
                GetSubComDetail
                GetsafetyOfficerDetail
                GetsafetymgrDetail
                if tbemailsubcom.Value.Trim = "" Then
                    'show alet modal focus textbox email sect mgr
                    tbemailsubcom.Disabled = False
                    'tbemailsubcom.Focus
                    lbmsgmodalsubcom.Text = "Please Insert Email. Sub-Com"
                    lbmsgmodalsubcom.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub

                End If
                If tbemailsfofficer.Value.Trim = "" Then
                    'show alet modal focus textbox email dept mgr
                    tbemailsfofficer.Disabled = False
                    'tbemailsfofficer.Focus
                    lbmsgmodalsfofficer.Text = "Please insert Email. Safety Officer"
                    lbmsgmodalsfofficer.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub
                End If
                If tbemailsfmgr.Value.Trim = "" Then
                    'show alet modal focus textbox email div mgr
                    tbemailsfmgr.Disabled = False
                    'tbemailsfmgr.Focus
                    lbmsgmodalsfmgr.Text = "Please insert Email. Safety Mgr."
                    lbmsgmodalsfmgr.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub
                End If
                'insert data to sql
                Insert()

            Case "UPDATE"
                GetSubComDetail
                GetsafetyOfficerDetail
                GetsafetymgrDetail
                if tbemailsubcom.Value.Trim = "" Then
                    'show alet modal focus textbox email sect mgr
                    tbemailsubcom.Disabled = False
                    'tbemailsubcom.Focus
                    lbmsgmodalsubcom.Text = "Please Insert Email. Sub-Com"
                    lbmsgmodalsubcom.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub

                End If
                If tbemailsfofficer.Value.Trim = "" Then
                    'show alet modal focus textbox email dept mgr
                    tbemailsfofficer.Disabled = False
                    'tbemailsfofficer.Focus
                    lbmsgmodalsfofficer.Text = "Please insert Email. Safety Officer"
                    lbmsgmodalsfofficer.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub
                End If
                If tbemailsfmgr.Value.Trim = "" Then
                    'show alet modal focus textbox email div mgr
                    tbemailsfmgr.Disabled = False
                    'tbemailsfmgr.Focus
                    lbmsgmodalsfmgr.Text = "Please insert Email. Safety Mgr."
                    lbmsgmodalsfmgr.ForeColor = Color.Red
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModaledit()", True)
                    Exit Sub
                End If
                Update()
        End Select
    End Sub
End Class