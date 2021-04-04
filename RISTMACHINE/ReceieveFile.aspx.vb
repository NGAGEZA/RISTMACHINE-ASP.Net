Option Strict On
Option Explicit On

Imports System.Web.Script.Serialization

Public Class ReceieveFile
    Inherits Page

    Private Class CustomResponse
        Public Property Url As String
    End Class

    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
       ' Response.Clear()
        Response.ContentType = "application/json"
        Dim postedFilefront As HttpPostedFile = Request.Files("upfront")
        Dim postedFileback As HttpPostedFile = Request.Files("upback")
        Dim postedFilelayout As HttpPostedFile = Request.Files("uplayout")

        Dim postedFileErs As HttpPostedFile = Request.Files("upfileers")

        Dim postedFilebefore As HttpPostedFile = Request.Files("upfilebefore")

        If postedFilefront Isnot Nothing Then

            Try
                Dim path As String = Server.MapPath("upload\Front\")

                For i = 0 To Request.Files.Count - 1
                    Dim g As Guid
                    g = Guid.NewGuid()
                    Dim file = Request.Files(i)
                    path += g.ToString() & "-" + file.FileName
                    Dim extension As String = file.ContentType
                    file.SaveAs(path)
                    'Done
                    Dim json = Newtonsoft.Json.JsonConvert.SerializeObject(New customResponse With {.Url = "upload\Front\" & g.ToString() & "-" + file.FileName})

                    Response.Write(json)

                    'Create a Cookie with a suitable Key.
                    Dim uploadCookie As New HttpCookie("namefile1")

                    'Set the Cookie value.
                    uploadCookie.Values("namefile1") = g.ToString() & "-" + file.FileName

                    'Set the Expiry date.
                    uploadCookie.Expires = Date.Now.AddHours(1)

                    'Add the Cookie to Browser.
                    Response.Cookies.Add(uploadCookie)



                Next




            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(ex)


                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)

            End Try

            Response.[End]()

        End If
        'If postedFilefront IsNot Nothing Then
        '    If Request.Files.Count > 0 Then
        '        Dim path As String = Server.MapPath("upload\Front\")

        '        For i As Integer = 0 To Request.Files.Count - 1
        '            Dim file = Request.Files(i)
        '            path += file.FileName

        '            Try
        '                file.SaveAs(path)
        '            Catch ex As HttpException
        '                Dim serializer = New JavaScriptSerializer()
        '                Dim jsonError As String = serializer.Serialize(New With {
        '                                                                  .[error] = "Error on sending files"
        '                                                                  })
        '                Response.Write(jsonError)
        '            End Try
        '        Next
        '    End If
        'End If


        If postedFileback Isnot Nothing Then

            Try
                Dim path As String = Server.MapPath("upload\Back\")

                For i = 0 To Request.Files.Count - 1
                    Dim g As Guid
                    g = Guid.NewGuid()
                    Dim file = Request.Files(i)
                    path += g.ToString() & "-" + file.FileName
                    Dim extension As String = file.ContentType
                    file.SaveAs(path)
                    'Done
                    Dim json = Newtonsoft.Json.JsonConvert.SerializeObject(New customResponse With {.Url = "upload\Back\" & g.ToString() & "-" + file.FileName})
                   
                    Response.Write(json)

                    'Create a Cookie with a suitable Key.
                    Dim uploadCookie As New HttpCookie("namefile2")

                    'Set the Cookie value.
                    uploadCookie.Values("namefile2") = g.ToString() & "-" + file.FileName

                    'Set the Expiry date.
                    uploadCookie.Expires = Date.Now.AddHours(1)

                    'Add the Cookie to Browser.
                    Response.Cookies.Add(uploadCookie)

                   
                    
                Next
                
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(ex)


                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
               
            End Try
            
            Response.[End]()
       
        End If

        If postedFilelayout Isnot Nothing Then

            Try
                Dim path As String = Server.MapPath("upload\")

                For i = 0 To Request.Files.Count - 1
                    Dim g As Guid
                    g = Guid.NewGuid()
                    Dim file = Request.Files(i)
                    path += g.ToString() & "-" + file.FileName
                    Dim extension As String = file.ContentType
                    file.SaveAs(path)
                    'Done
                    Dim json = Newtonsoft.Json.JsonConvert.SerializeObject(New customResponse With {.Url = "upload\" & g.ToString() & "-" + file.FileName})
                   
                    Response.Write(json)

                    'Create a Cookie with a suitable Key.
                    Dim uploadCookie As New HttpCookie("namefile3")

                    'Set the Cookie value.
                    uploadCookie.Values("namefile3") = g.ToString() & "-" + file.FileName

                    'Set the Expiry date.
                    uploadCookie.Expires = Date.Now.AddHours(1)

                    'Add the Cookie to Browser.
                    Response.Cookies.Add(uploadCookie)

                   
                    
                Next
                
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(ex)


                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
               
            End Try
            
            Response.[End]()
           
        End If

        If postedFileErs Isnot Nothing Then

            Try
                Dim path As String = Server.MapPath("upload\Ers\")

                For i = 0 To Request.Files.Count - 1
                    Dim g As Guid
                    g = Guid.NewGuid()
                    Dim file = Request.Files(i)
                    path += g.ToString() & "-" + file.FileName
                    Dim extension As String = file.ContentType
                    file.SaveAs(path)
                    'Done
                    Dim json = Newtonsoft.Json.JsonConvert.SerializeObject(New customResponse With {.Url = "upload\Ers\" & g.ToString() & "-" + file.FileName})
                   
                    Response.Write(json)

                    'Create a Cookie with a suitable Key.
                    Dim uploadCookie As New HttpCookie("fileErs")

                    'Set the Cookie value.
                    uploadCookie.Values("fileErs") = g.ToString() & "-" + file.FileName

                    'Set the Expiry date.
                    uploadCookie.Expires = DateTime.Now.AddHours(1)

                    'Add the Cookie to Browser.
                    Response.Cookies.Add(uploadCookie)

                   
                    
                Next
                
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(ex)


                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
               
            End Try
            
            Response.[End]()
           
        End If

        If postedFilebefore Isnot Nothing Then

            Try
                Dim path As String = Server.MapPath("upload\")

                For i = 0 To Request.Files.Count - 1
                    Dim g As Guid
                    g = Guid.NewGuid()
                    Dim file = Request.Files(i)
                    path += g.ToString() & "-" + file.FileName
                    Dim extension As String = file.ContentType
                    file.SaveAs(path)
                    'Done
                    Dim json = Newtonsoft.Json.JsonConvert.SerializeObject(New customResponse With {.Url = "upload\" & g.ToString() & "-" + file.FileName})
                   
                    Response.Write(json)

                    'Create a Cookie with a suitable Key.
                    Dim uploadCookie As New HttpCookie("filebefore")

                    'Set the Cookie value.
                    uploadCookie.Values("filebefore") = g.ToString() & "-" + file.FileName

                    'Set the Expiry date.
                    uploadCookie.Expires = DateTime.Now.AddHours(1)

                    'Add the Cookie to Browser.
                    Response.Cookies.Add(uploadCookie)

                   
                    
                Next
                
            Catch ex As Exception
                dim errorSend = New ExceptionLogging()
                errorSend.SendErrorTomail(ex)
                'Write Error to Log.txt
                ExceptionLogging.LogError(ex)
                Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(ex)


                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
               
            End Try
            
            Response.[End]()
           
        End If
    End Sub

End Class