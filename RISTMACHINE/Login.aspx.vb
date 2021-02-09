Option Strict On
Option Explicit On

Public Class Login
    Inherits Page

    Private Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Page.User.Identity.IsAuthenticated Then
            Response.Redirect(FormsAuthentication.DefaultUrl)
        End If
    End Sub
    Private Sub Login_Init(sender As Object, e As EventArgs) Handles Me.Init
        Form.DefaultButton = btnlogin.FindControl("btnlogin").UniqueID
    End Sub

    Protected Sub Validate_User
        Dim opno As String = Request.Form("operatorno")
        Dim password As String = Request.Form("yourpassword")

        'Create a Cookie with a suitable Key.
        Dim opnoCookie As New HttpCookie("opno")

        'Set the Cookie value.
        opnoCookie.Values("opno") = opno

        'Set the Expiry date.
        opnoCookie.Expires = DateTime.Now.AddHours(1)

        'Add the Cookie to Browser.
        Response.Cookies.Add(opnoCookie)

        Using db As New DBRISTMCDataContext()

            Try


                Dim result As IEnumerable(Of Validate_UserResult) = db.Validate_User(opno, password)

                For Each o In result
                    If o.UserId Isnot Nothing
                        'get username from db
                        Dim name As String = String.Empty
                        Dim checkname As IEnumerable(Of User) = db.Users.Where(Function(u) u.OperatorNo = opno).ToList()
                      
                        'Dim checkname = From tbuser in db.Users
                        '                Where tbuser.OperatorNo = opno
                        '                Select tbuser

                        For Each n In checkname
                            name = n.Username

                        Next

                        If Not String.IsNullOrEmpty(Request.QueryString("ReturnUrl")) Then
                            FormsAuthentication.SetAuthCookie(name, True)
                            Response.Redirect(Request.QueryString("ReturnUrl"))
                        Else
                            FormsAuthentication.RedirectFromLoginPage(name, True)
                        End If

                    End If
                Next
               
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "LoginNotComplete()", True)
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