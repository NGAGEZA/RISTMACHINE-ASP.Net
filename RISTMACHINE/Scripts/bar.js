﻿$(function () {

    //get the bar chart canvas
    var ctx = $("#bar-chartcanvas");

    //bar chart data
    var data = {
        labels: ["match1", "match2", "match3", "match4", "match5"],
        datasets: [
            {
                label: "TeamA Score",
                data: [10, 50, 25, 70, 40],
                backgroundColor: [
                    "rgba(10,20,30,0.3)",
                    "rgba(10,20,30,0.3)",
                    "rgba(10,20,30,0.3)",
                    "rgba(10,20,30,0.3)",
                    "rgba(10,20,30,0.3)"
                ],
                borderColor: [
                    "rgba(10,20,30,1)",
                    "rgba(10,20,30,1)",
                    "rgba(10,20,30,1)",
                    "rgba(10,20,30,1)",
                    "rgba(10,20,30,1)"
                ],
                borderWidth: 1
            },
            {
                label: "TeamB Score",
                data: [20, 35, 40, 60, 50],
                backgroundColor: [
                    "rgba(50,150,200,0.3)",
                    "rgba(50,150,200,0.3)",
                    "rgba(50,150,200,0.3)",
                    "rgba(50,150,200,0.3)",
                    "rgba(50,150,200,0.3)"
                ],
                borderColor: [
                    "rgba(50,150,200,1)",
                    "rgba(50,150,200,1)",
                    "rgba(50,150,200,1)",
                    "rgba(50,150,200,1)",
                    "rgba(50,150,200,1)"
                ],
                borderWidth: 1
            }
        ]
    };

    //options
    var options = {
        responsive: true,
        title: {
            display: true,
            position: "top",
            text: "Bar Graph",
            fontSize: 18,
            fontColor: "#111"
        },
        legend: {
            display: true,
            position: "bottom",
            labels: {
                fontColor: "#333",
                fontSize: 16
            }
        },
        scales: {
            yAxes: [{
                ticks: {
                    min: 0
                }
            }]
        }
    };

    //create Chart class object
    var chart = new Chart(ctx, {
        type: "bar",
        data: data,
        options: options
    });
});