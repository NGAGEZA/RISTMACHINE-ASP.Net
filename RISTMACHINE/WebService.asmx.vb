Imports System.Web.Services
Imports System.ComponentModel
Imports System.Data.SqlClient
Imports System.Web.Script.Services

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WebService
    Inherits Services.WebService

    Public Class TrafficSourceData
        Public Property Label As String
        Public Property Value As String
        Public Property Color As String
        Public Property Hightlight As String
    End Class

    Public Class Cars
        Public CarName As String
        Public CarRating As String
        Public CarYear As String
    End Class

    <WebMethod>
    Public Function GetListOfCars(ByVal aData As List(Of String)) As List(Of Cars)
        Dim dr As SqlDataReader
        Dim carList As List(Of Cars) = New List(Of Cars)()
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConstrNoth").ConnectionString
        Using con As SqlConnection = New SqlConnection(constr)

            Using cmd As SqlCommand = New SqlCommand()
                Dim query As String = String.Format("select ShipCity, OrderID AS Total from orders where shipcountry = 'Brazil' group by shipcity")
                cmd.CommandText = query
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                'cmd.Parameters.AddWithValue("@makeYear", aData(0))
                con.Open()
                dr = cmd.ExecuteReader(CommandBehavior.CloseConnection)

                If dr.HasRows Then

                    While dr.Read()
                        Dim carname As String = dr("shipcity").ToString()
                        Dim carrating As String = dr("Total").ToString()
                        'Dim makingyear As String = dr("carYear").ToString()
                        carList.Add(New Cars With {
                                       .CarName = carname,
                                       .CarRating = carrating
                                       })
                    End While
                End If
            End Using
        End Using

        Return carList
    End Function
    <WebMethod>
    Public Function GetTrafficSourceData(ByVal gData As List(Of String)) As List(Of TrafficSourceData)
        Dim t As List(Of TrafficSourceData) = New List(Of TrafficSourceData)()
        Dim arrColor As String() = New String() {"#231F20", "#FFC200", "#F44937", "#16F27E", "#FC9775", "#5A69A6"}

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConstrNoth").ConnectionString
        '    Using con As SqlConnection = New SqlConnection(constr)
        Using cn As SqlConnection = New SqlConnection(constr)
            Dim myQuery As String = "SELECT ShipCity, COUNT(OrderID) AS Total from Orders where ShipCountry=@year GROUP BY ShipCity, ShipCountry"
            Dim cmd As SqlCommand = New SqlCommand()
            cmd.CommandText = myQuery
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@year", gData(0))
            'cmd.Parameters.AddWithValue("@month", gData(1))
            cmd.Connection = cn
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            If dr.HasRows Then
                Dim counter As Integer = 0

                While dr.Read()
                    Dim tsData As TrafficSourceData = New TrafficSourceData()
                    tsData.Value = dr("Total").ToString()
                    tsData.Label = dr("ShipCity").ToString()
                    tsData.Color = arrColor(counter)
                    t.Add(tsData)
                    counter += 1
                End While
            End If
        End Using

        Return t
    End Function
    <WebMethod()>
    Public Shared Function GetChart(country As String) As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConstrN").ConnectionString
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