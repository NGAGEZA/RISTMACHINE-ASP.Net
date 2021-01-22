Imports System.IO
Imports System.Net
Imports System.Net.Mail

Imports context = System.Web.HttpContext

Public Class ExceptionLogging
    'Public Module ExceptionLogging
    Private _errorlineNo, _errormsg, _errorLocation, _extype, _exurl, Frommail, _toMail,_password, _subj, _hostAdd, _emailHead, _emailSing As String

    Public Sub SendErrorTomail(exmail As Exception)
        Try
            Const newline = "<br/>"
            _errorlineNo = exmail.StackTrace.Substring(exmail.StackTrace.Length - 7, 7)
            _errormsg = exmail.[GetType]().Name.ToString()
            _extype = exmail.[GetType]().ToString()
            _exurl = Context.Current.Request.Url.ToString()
            _errorLocation = exmail.Message.ToString()
            _emailHead = "<b>Dear Mr.Wittaya,</b>" & "<br/>" & "An exception occurred in a Application Url" & " " & _exurl & " " & "With following Details" & "<br/>" & "<br/>"
            _emailSing = newline & "Thanks and Regards" & newline & "    " & "     " & "<b>App Dev. Wittaya S. </b>" & "</br>"
            _subj = "Exception occurred" & " " & "in Application" & " " & _exurl
            _hostAdd = ConfigurationManager.AppSettings("Host").ToString()
            Dim errortomail As String = _emailHead & "<b>Log Written Date: </b>" & " " + Date.Now.ToString() & newline & "<b>Error Line No :</b>" & " " + _errorlineNo & vbTab & vbLf & " " & newline & "<b>Error Message:</b>" & " " + _errormsg & newline & "<b>Exception Type:</b>" & " " + _extype & newline & "<b> Error Details :</b>" & " " + _errorLocation & newline & "<b>Error Page Url:</b>" & " " + _exurl & newline & newline & newline & newline + _emailSing

            Using mailMessage = New MailMessage()
                Frommail = ConfigurationManager.AppSettings("FromMail").ToString()
                _toMail = ConfigurationManager.AppSettings("ToMail").ToString()
                _password = ConfigurationManager.AppSettings("Password").ToString()
                mailMessage.From = New MailAddress(Frommail)
                mailMessage.Subject = _subj
                mailMessage.Body = errortomail
                mailMessage.IsBodyHtml = True
                Dim multiEmailId As String() = _toMail.Split(","c)

                For Each userEmails As String In multiEmailId
                    mailMessage.[To].Add(New MailAddress(userEmails))
                Next

                Dim smtp = New SmtpClient()  ' creating object of smptpclient  
                smtp.Host = _hostAdd              'host of emailaddress for example smtp.gmail.com etc  
                smtp.EnableSsl = False
                Dim networkCred = New NetworkCredential()
                networkCred.UserName = mailMessage.From.Address
                networkCred.Password = _password
                smtp.UseDefaultCredentials = True
                smtp.Credentials = networkCred
                smtp.Port = 25
                smtp.Send(mailMessage) 'sending Email  
            End Using

        Catch em As Exception
            em.ToString()
        End Try
    End Sub
    'End Module

    Public Shared Sub LogError(ex As Exception)
        Dim message As String = $"Time: {DateTime.Now:dd/MM/yyyy hh:mm:ss tt}"
        message += Environment.NewLine
        message += "-----------------------------------------------------------"
        message += Environment.NewLine
        message += $"Message: {ex.Message}"
        message += Environment.NewLine
        message += $"StackTrace: {ex.StackTrace}"
        message += Environment.NewLine
        message += $"Source: {ex.Source}"
        message += Environment.NewLine
        message += $"TargetSite: {ex.TargetSite}"
        message += Environment.NewLine
        message += "-----------------------------------------------------------"
        message += Environment.NewLine
        
        Dim path As String = context.Current.Server.MapPath("~/Error/ErrorLog.txt")

        Using writer = New StreamWriter(path, True)
            writer.WriteLine(message)
            writer.Close()
        End Using
    End Sub

End Class
