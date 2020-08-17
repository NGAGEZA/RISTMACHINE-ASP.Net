Public Class WebForm3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    '    Dim db As New DBRISTMCDataContext
       
    'GridView1.DataSource = db.GetUser
    'GridView1.DataBind()

    End Sub
    'Protected Sub submitValidate(ByVal sender As Object, ByVal e As EventArgs)
    '    Dim contactName As String = Request.Form("fullName1")
    '    Dim email As String = Request.Form("email1")
    '    System.Diagnostics.Debug.Write("test", email)
    'End Sub

    Protected Sub Call_Server(ByVal sender As Object, ByVal e As EventArgs)
        Response.Write("Calling Server Side Event")
    End Sub

End Class