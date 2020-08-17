Imports System.Data.SqlClient
Imports System.Web.Script.Services
Imports System.Web.Services

Public Class Autocomplete
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function GetMaker(ByVal prefix As String) As String()
        Dim maker As List(Of String) = New List(Of String)()

        Using conn As SqlConnection = New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConMC").ConnectionString
            Using cmd As SqlCommand = New SqlCommand()
                cmd.CommandText = "select MAKER_NAME, ID from M_MAKER where " & "MAKER_NAME like @SearchText + '%'"
                cmd.Parameters.AddWithValue("@SearchText", prefix)
                cmd.Connection = conn
                conn.Open()

                Using sdr As SqlDataReader = cmd.ExecuteReader()

                    While sdr.Read()
                        maker.Add(String.Format("{0}-{1}", sdr("MAKER_NAME"), sdr("ID")))
                    End While

                End Using

                conn.Close()
            End Using

            Return maker.ToArray()
        End Using
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function GetCountry(ByVal prefix As String) As String()
        Dim country As List(Of String) = New List(Of String)()

        Using conn As SqlConnection = New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConMC").ConnectionString
            Using cmd As SqlCommand = New SqlCommand()
                cmd.CommandText = "select COUNTRY_NAME, ID from M_COUNTRY where " & "COUNTRY_NAME like @SearchText + '%'"
                cmd.Parameters.AddWithValue("@SearchText", prefix)
                cmd.Connection = conn
                conn.Open()

                Using sdr As SqlDataReader = cmd.ExecuteReader()

                    While sdr.Read()
                        country.Add(String.Format("{0}-{1}", sdr("COUNTRY_NAME"), sdr("ID")))
                    End While

                End Using

                conn.Close()
            End Using

            Return country.ToArray()
        End Using
    End Function

    <WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function GetSupplier(ByVal prefix As String) As String()
        Dim supplier As List(Of String) = New List(Of String)()

        Using conn As SqlConnection = New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConMC").ConnectionString
            Using cmd As SqlCommand = New SqlCommand()
                cmd.CommandText = "select SUPPLIER_NAME, ID from M_SUPPLIER where " & "SUPPLIER_NAME like @SearchText + '%'"
                cmd.Parameters.AddWithValue("@SearchText", prefix)
                cmd.Connection = conn
                conn.Open()

                Using sdr As SqlDataReader = cmd.ExecuteReader()

                    While sdr.Read()
                        supplier.Add(String.Format("{0}-{1}", sdr("SUPPLIER_NAME"), sdr("ID")))
                    End While

                End Using

                conn.Close()
            End Using

            Return supplier.ToArray()
        End Using
    End Function
End Class