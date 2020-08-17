Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
'<System.Web.Script.Services.ScriptService()> _
'<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
'<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
'<ToolboxItem(False)> _
<System.Web.Script.Services.ScriptService()> _
Public Class EmployeeWebService
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function
    Public Class Employee
        Public Property Id As Integer
        Public Property Name As String
        Public Property Salary As Decimal
    End Class

    Private list As List(Of Employee) = New List(Of Employee)()

    Public Sub New()
        list.Add(New Employee With {
                    .Id = 1,
                    .Name = "Peter",
                    .Salary = 22000
                    })
        list.Add(New Employee With {
                    .Id = 2,
                    .Name = "Mark",
                    .Salary = 24000
                    })
        list.Add(New Employee With {
                    .Id = 3,
                    .Name = "James",
                    .Salary = 28000
                    })
        list.Add(New Employee With {
                    .Id = 4,
                    .Name = "Simon",
                    .Salary = 29000
                    })
        list.Add(New Employee With {
                    .Id = 5,
                    .Name = "David",
                    .Salary = 19000
                    })
    End Sub

    <WebMethod()> _
    Public Function GetAllEmployees() As List(Of Employee)
        Return list
    End Function

    <WebMethod()> _
    Public Function GetEmployeeDetails(ByVal employeeId As String) As Employee
        Dim empId As Integer = Int32.Parse(employeeId)
        Dim emp As Employee = list.Single(Function(e) e.Id = empId)
        Return emp
    End Function


End Class