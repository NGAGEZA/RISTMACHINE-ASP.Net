Imports System.Data.SqlClient
Imports System.Web.Services

Public Class Graph
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    <WebMethod()>
    Public Shared Function GetChart(country As String) As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConstrNoth").ConnectionString
        Using con As New SqlConnection(constr)
            Dim query As String = String.Format("select shipcity, count(orderid) from orders where shipcountry = '{0}' group by shipcity", country)
            Using cmd As New SqlCommand()
                cmd.CommandText = query
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    Dim sb As New StringBuilder()
                    sb.Append("[")
                    While sdr.Read()
                        sb.Append("{")
                        System.Threading.Thread.Sleep(50)
                        Dim color As String = [String].Format("#{0:X6}", New Random().Next(&H1000000))
                        sb.Append(String.Format("text :'{0}', value:{1}, color: '{2}'", sdr(0), sdr(1), color))
                        sb.Append("},")
                    End While
                    sb = sb.Remove(sb.Length - 1, 1)
                    sb.Append("]")
                    con.Close()
                    Return sb.ToString()
                End Using
            End Using
        End Using
    End Function
End Class