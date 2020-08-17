Option Strict On
Option Explicit On

Public Class ReceieveFile
    Inherits Page
    Public Class CustomResponse
        Public Property Url As String
    End Class

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.Clear()
        Response.ContentType = "application/json"
        Dim postedFilefront As HttpPostedFile = Request.Files("upmcfront")
        Dim postedFileback As HttpPostedFile = Request.Files("upmcback")
        Dim postedFilelayout As HttpPostedFile = Request.Files("uplayout")

        If postedFilefront Isnot Nothing Then

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
                    Dim uploadCookie As New HttpCookie("namefile1")

                    'Set the Cookie value.
                    uploadCookie.Values("namefile1") = g.ToString() & "-" + file.FileName

                    'Set the Expiry date.
                    uploadCookie.Expires = DateTime.Now.AddHours(1)

                    'Add the Cookie to Browser.
                    Response.Cookies.Add(uploadCookie)

                   
                    
                Next
                
            Catch ex As Exception
                Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(ex)


                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
               
            End Try
            
            Response.[End]()
        'Else
        '    Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(New Exception("No Any Files."))
        '    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
        '    Response.End()
        End If

        If postedFileback Isnot Nothing Then

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
                    Dim uploadCookie As New HttpCookie("namefile2")

                    'Set the Cookie value.
                    uploadCookie.Values("namefile2") = g.ToString() & "-" + file.FileName

                    'Set the Expiry date.
                    uploadCookie.Expires = DateTime.Now.AddHours(1)

                    'Add the Cookie to Browser.
                    Response.Cookies.Add(uploadCookie)

                   
                    
                Next
                
            Catch ex As Exception
                Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(ex)


                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
               
            End Try
            
            Response.[End]()
        'Else
        '    Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(New Exception("No Any Files."))
        '    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
        '    Response.End()
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
                    uploadCookie.Expires = DateTime.Now.AddHours(1)

                    'Add the Cookie to Browser.
                    Response.Cookies.Add(uploadCookie)

                   
                    
                Next
                
            Catch ex As Exception
                Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(ex)


                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
               
            End Try
            
            Response.[End]()
            'Else
            '    Dim jsonError As String = Newtonsoft.Json.JsonConvert.SerializeObject(New Exception("No Any Files."))
            '    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & jsonError & """);", True)
            '    Response.End()
        End If
    End Sub

End Class