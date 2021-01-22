Option Strict On
Option Explicit On

Public Class Home
    Inherits Page

    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
            Else 
                'bind data
                If Not Me.IsPostBack Then
                    Getmcnoedit
                    Getmcnoprint
                    Getmcnostatus
                   ' CheckUserPermission
                End If
                
        End If
       
    End Sub

    Private Sub Getmcnoedit()

        Dim opnocookie As HttpCookie = Request.Cookies("opno")
        Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
        Using db As New DBRISTMCDataContext()
            editmcno.DataSource = From p In db.TB_MACHINE_DATAs
                                  Where p.OPNO_ADD = opno
                                  Order By p.MC_NO Descending
                             Select New With {p.ID, p.MC_NO}
            editmcno.DataTextField = "MC_NO"
            editmcno.DataValueField = "ID"
            editmcno.DataBind()
        End Using
    End Sub

    Private Sub Getmcnoprint()
        Dim opnocookie As HttpCookie = Request.Cookies("opno")
        Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
        Using db As New DBRISTMCDataContext()
            reportmcno.DataSource = From p In db.TB_MACHINE_DATAs
                Where p.OPNO_ADD = opno
                Order By p.MC_NO Descending
                Select New With {p.ID, p.MC_NO}
            reportmcno.DataTextField = "MC_NO"
            reportmcno.DataValueField = "ID"
            reportmcno.DataBind()
        End Using
    End Sub

    Private Sub Getmcnostatus()
        Dim opnocookie As HttpCookie = Request.Cookies("opno")
        Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
        Using db As New DBRISTMCDataContext()
            statusmcno.DataSource = From p In db.TB_MACHINE_DATAs
                Where p.OPNO_ADD = opno
                Order By p.MC_NO Descending
                Select New With {p.ID, p.MC_NO}
            statusmcno.DataTextField = "MC_NO"
            statusmcno.DataValueField = "ID"
            statusmcno.DataBind()
        End Using
    End Sub
    Protected Sub CheckUserPermission()
        Using db As New DBRISTMCDataContext()
            Try
                Dim opnocookie As HttpCookie = Request.Cookies("opno")
                Dim opno as String = If(opnocookie IsNot Nothing, opnocookie.Value.Split("="c)(1), "undefined")
                'Dim a = From tbuser In db.Users
                '        Where tbuser.OperatorNo = opno
                '        Select tbuser

                Dim a = db.Users.Where(Function(x) x.OperatorNo = opno).ToList()

                For Each x In a

                    If x.Permission IsNot Nothing Then
                        Select Case x.Permission.Trim()
                            Case "Admin"
                                Response.Redirect("AdminHome.aspx")
                            Case "User"
                                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alertpermission()", True)
                        End Select
                        Else 
                            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alertpermission()", True)

                    End If

                   
                Next

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

  
End Class