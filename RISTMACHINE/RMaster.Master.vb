Public Class RMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'show IP
        Dim ipaddress As String
        ipaddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If ipaddress = "" Or ipaddress Is Nothing Then
            ipaddress = Request.ServerVariables("REMOTE_ADDR")
        End If
      

      

        'Create a Cookie with a suitable Key.
        Dim ipCookie As New HttpCookie("ip")

        'Set the Cookie value.
        ipCookie.Values("ip") = ipaddress

        'Set the Expiry date.
        ipCookie.Expires = DateTime.Now.AddHours(1)

        'Add the Cookie to Browser.
        Response.Cookies.Add(ipCookie)
    End Sub

End Class