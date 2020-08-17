Public Class CheckStatus
    Inherits System.Web.UI.Page
    Protected Property Mcno() As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        Else 
            Getdata
        End If
       
    End Sub
     Protected Sub Getdata()
        
        Mcno = Request.QueryString("checkmcno")
        
        Using db As New DBRISTMCDataContext()
            Try
                'select condition
                Dim getdata = From d In db.TB_MACHINE_DATAs
                        Where d.MC_NO = Mcno
                        Select d

                If getdata.Any()

                    For Each l In getdata
                        
                        lbmcno.Text = l.MC_NO
                        TextBox1.Text = l.STATUS_NAME
                        'lbstatus.Text = "Status :" & l.STATUS_NAME
                    Next

                Else

                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Nodata()", True)

                End If
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