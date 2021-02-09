Option Strict On
Option Explicit On

Public Class ViewApprove
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()

        Else
            

        End If
    End Sub

End Class