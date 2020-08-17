Option Strict On
Option Explicit On
Public Class AdminSetPermission
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        Else

            If Not Me.IsPostBack Then
                BindGrid
                GetDataGridview
            End If
           

        End If
    End Sub
    Private Sub BindGrid()
        Using db As New DBRISTMCDataContext()
            Try
                gvlistuser.DataSource = From r In db.Users
                    Select New With {r.UserId, r.OperatorNo, r.Username, r.Email, r.CreatedDate, r.LastLoginDate, r.Permission}
                gvlistuser.DataBind()
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
    Protected Sub gvlistuser_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim row As GridViewRow = New GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal)
        Try
            For i As Integer = 0 To gvlistuser.Columns.Count - 1
                Dim cell As TableHeaderCell = New TableHeaderCell()
                Dim txtSearch As TextBox = New TextBox()
                txtSearch.Attributes("placeholder") = gvlistuser.Columns(i).HeaderText
                txtSearch.CssClass = "search_textbox form-control input-sm text-center"
                cell.Controls.Add(txtSearch)
                row.Controls.Add(cell)
            Next
            If gvlistuser.HeaderRow IsNot Nothing
                gvlistuser.HeaderRow.Parent.Controls.AddAt(1, row)
            End If
        Catch ex As Exception
            Dim message As String = String.Format("Message: {0}\n\n", ex.Message)
            message &= String.Format("StackTrace: {0}\n\n", ex.StackTrace.Replace(Environment.NewLine, String.Empty))
            message &= String.Format("Source: {0}\n\n", ex.Source.Replace(Environment.NewLine, String.Empty))
            message &= String.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, String.Empty))

            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert(""" & message & """);", True)
        Finally
            'db.Dispose()
        End Try
        

    End Sub

    Protected Sub GetData()
        Dim ID As Integer
      
        ID = CInt(Request.QueryString("ID"))
       
        Using db As New DBRISTMCDataContext()
            Try
                'select condition
                Dim getdata = From d In db.Users
                        Where CInt(d.OperatorNo) = ID
                        Select d

                If getdata.Any()

                    For Each f In getdata
                        txtopno.Value = f.OperatorNo
                        
                   

                    Next
               
                Else

                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "Nodata()", True)

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
    Protected Sub Update()
        Using db As New DBRISTMCDataContext()
            Try
                Dim ID As Integer
        
                ID = CInt(Request.QueryString("ID"))
                Dim f As User = (From u In db.Users Where CInt(u.OperatorNo) = ID Select u).FirstOrDefault()
                f.Permission = permission.Value
               
                db.SubmitChanges()
                db.Dispose()
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "UpdateComplete()", True)
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
        BindGrid()
    End Sub
   
    Protected Sub GetDataGridview
        If Not String.IsNullOrEmpty(Request.QueryString("ID")) Then

            
            GetData
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "openModalsetpermission()", True)
           


        End If
    End Sub
End Class