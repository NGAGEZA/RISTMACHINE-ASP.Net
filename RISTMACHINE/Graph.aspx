<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/RMaster.Master" CodeBehind="Graph.aspx.vb" Inherits="RISTMACHINE.Graph" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--ChartJS Script--%>
    <script src="Scripts/Chart.js"></script>
    <script src="Scripts/excanvas.js"></script>
    <script src="Scripts/jquery.min.js"></script>

    <script type="text/javascript">
        $(function () {
            LoadChart();
            $("[id*=ddlCountries]").bind("change", function () {
                LoadChart();
            });
            $("[id*=rblChartType] input").bind("click", function () {
                LoadChart();
            });
        });
        function LoadChart() {
            var chartType = parseInt($("[id*=rblChartType] input:checked").val());
            $.ajax({
                type: "POST",
                url: "Graph.aspx/GetChart",
                data: "{country: '" + $("[id*=ddlCountries]").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    $("#dvChart").html("");
                    $("#dvLegend").html("");
                    var data = eval(r.d);
                    var el = document.createElement('canvas');
                    $("#dvChart")[0].appendChild(el);
 
                    //Fix for IE 8
                    if ($.browser.msie && $.browser.version == "8.0") {
                        G_vmlCanvasManager.initElement(el);
                    }
                    var ctx = el.getContext('2d');
                    var userStrengthsChart;
                    switch (chartType) {
                    case 1:
                        userStrengthsChart = new Chart(ctx).Pie(data);
                        break;
                    case 2:
                        userStrengthsChart = new Chart(ctx).Doughnut(data);
                        break;
                    }
                    for (var i = 0; i < data.length; i++) {
                        var div = $("<div />");
                        div.css("margin-bottom", "10px");
                        div.html("<span style = 'display:inline-block;height:10px;width:10px;background-color:" + data[i].color + "'></span> " + data[i].text);
                        $("#dvLegend").append(div);
                    }
                },
                failure: function (response) {
                    alert('There was an error.');
                }
            });
        }
    </script>
    <script>
        var ctx = document.getElementById("#myChart");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                datasets: [{
                    label: '# of Votes',
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                }
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    Country:
                    <asp:DropDownList ID="ddlCountries" runat="server">
                        <asp:ListItem Text="USA" Value="USA" />
                        <asp:ListItem Text="Germany" Value="Germany" />
                        <asp:ListItem Text="France" Value="France" />
                        <asp:ListItem Text="Brazil" Value="Brazil" />
                    </asp:DropDownList>
         
                    <asp:RadioButtonList ID="rblChartType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Pie" Value="1" Selected="True" />
                        <asp:ListItem Text="Doughnut" Value="2" />
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="dvChart">
                    </div>
                </td>
                <td>
                    <div id="dvLegend">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <canvas id="myChart" width="400" height="400"></canvas>
    </div>
</asp:Content>
