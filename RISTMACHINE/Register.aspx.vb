Option Strict On
Option Explicit On
Public Class Register
    Inherits System.Web.UI.Page
   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    
    Protected Sub Insert(sender As Object, e As EventArgs)
        
        Dim opno As String = Request.Form("operatorno")
        Dim name as String = Request.Form("yourname")
        Dim password As String = Request.Form("yourpassword")
        Dim confirmpassword as String = Request.Form("confirmPassword")
        Dim email As String = Request.Form("youremail")

        'Response.Write(password)

        Using db As New DBRISTMCDataContext()
            
             Dim checkopno = From tbuser in db.Users
                        Where tbuser.OperatorNo = opno
                        Select tbuser

            If checkopno.Count() = 1
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alertexistsopno();", True)
                Exit Sub
            End If

                'For Each o In opno
                '    If o.OperatorNo.Length <> 0
                '        Response.Write("Username exists.")
                '        txtopno.Focus()
                '        Exit Sub
                '    End If
                'Next

            Dim checkemail = From tbuser in db.Users
                        Where tbuser.Email = email
                        Select tbuser
            if checkemail.Count() = 1
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alertexistsemail();", True)
                'txtyouremail.Focus()
                Exit Sub
            End If

                'For Each oe In email
                '    If oe.Email.Length <> 0
                '        Response.Write("Email exists.")
                '        txtyouremail.Focus()
                '        Exit Sub
                '    End If
                'Next
            Try
                db.Insert_User(opno,name, password,email)
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "RegisterComplete()", True)
                'FormsAuthentication.RedirectFromLoginPage(opno, True)

            Catch ex As Exception
                Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
                message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
                message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
            Finally
                db.Dispose()
            End Try


            'Dim result As IEnumerable(Of Insert_UserResult) = db.Insert_User(txtopno.Value,txtyourname.Value,txtyourpassword.Value,txtyouremail.Value)


        End Using
        '    Dim quser As New Insert_UserResult() With { _
        '            . = txtopno.Value, _
        '            . = txtyourname.Value, _
        '            .Password = txtyourpassword.Value, _
        '            .Email = txtyouremail.Value
        '            }
        '    db.Users.InsertOnSubmit(quser)
        '    Try
        '        db.SubmitChanges()
        '    Catch ex As Exception

        '    End Try

        'End Using

    End Sub


End Class