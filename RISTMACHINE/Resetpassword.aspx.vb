Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Net
Imports System.Net.Mail

Public Class Resetpassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SendEmail(sender As Object, e As EventArgs)
        Dim username As String = String.Empty
        Dim password As String = String.Empty

        Dim email as String = Request.Form("youremail")

       
        Using db As New DBRISTMCDataContext()

            Try
                Dim getpass = From tbuser in db.Users
                        Where tbuser.Email = email
                        Select tbuser

                For Each n In getpass
                    username = n.Username
                    password = n.Password

                Next

                If Not String.IsNullOrEmpty(password) Then
                    Dim mm As New MailMessage("RISTMCSYSTEM@rist.local", email)
                    mm.Subject = "Password Recovery"
                    mm.Body = String.Format("Hi {0},<br /><br />Your password is {1}<br /><br />Thank You.", username, password)
                    mm.IsBodyHtml = True
                    Dim smtp As New SmtpClient()
                    smtp.Host = "10.29.1.240"
                    smtp.EnableSsl = False
                    Dim networkCred As New NetworkCredential()
                    networkCred.UserName = "RISTMCSYSTEM@rist.local"
                    networkCred.Password = "Rist2018"
                    smtp.UseDefaultCredentials = True
                    smtp.Credentials = networkCred
                    smtp.Port = 25
                    smtp.Send(mm)
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "RecoverypasswordComplete()", True)
                    
                Else
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "RecoverypasswordNotComplete()", True)
                    
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
End Class