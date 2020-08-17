Imports System.IO
Imports System.Web
Imports System.Web.Services
Imports System.Web.Script.Serialization

Public Class Handler1
    Implements System.Web.IHttpHandler

    'Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest

    '    context.Response.ContentType = "text/plain"
    '    context.Response.Write("Hello World!")

    'End Sub
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        If context.Request.Files.Count > 0 Then
            Dim files As HttpFileCollection = context.Request.Files
            For i As Integer = 0 To files.Count - 1
                Dim file As HttpPostedFile = files(i)
                Dim fname As String
                If HttpContext.Current.Request.Browser.Browser.ToUpper() = "IE" OrElse HttpContext.Current.Request.Browser.Browser.ToUpper() = "INTERNETEXPLORER" Then
                    Dim testfiles As String() = file.FileName.Split(New Char() {"\"c})
                    fname = testfiles(testfiles.Length - 1)
                Else
                    fname = file.FileName
                End If
                fname = Path.Combine(context.Server.MapPath("~/upload/"), fname)
                file.SaveAs(fname)
            Next
        End If

        context.Response.ContentType = "text/plan"
        context.Response.Write("File Uploaded Successfully!")
    End Sub
    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class