<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script>
window.onload = function () {

var dataPoints = [];
var test = [];

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	exportEnabled: true,
	title: {
		text: "Netflix Stock Price in 2016"
	},
	subtitles: [{
		text: "Weekly Averages"
	}],
	axisX: {
		interval: 1,
		valueFormatString: "mm"
	},
	axisY: {
		includeZero: false,
		prefix: "",
		title: "Price"
	},
	toolTip: {
		content: "Date: {z}<br /><strong>Price:</strong><br />시초가: {y[0]}, 종가: {y[3]}<br />고가: {y[1]}, 저가: {y[2]}"
	},
	data: [{
		type: "candlestick",
		yValueFormatString: "##0원",
		dataPoints: dataPoints
	}]
});

$.get("resources/testmin.csv", getDataPointsFromCSV);

function getDataPointsFromCSV(csv) {
	
	var csvLines = points = [];
	csvLines = csv.split(/[\r?\n|\r|\n]+/);
	for (var i = 1; i < csvLines.length; i++) {
		if (csvLines[i].length > 0) {
			points = csvLines[i].split(",");
			dataPoints.push({
				x: new Date(
					parseInt(points[0].substring(0,4)),
					parseInt(points[0].substring(4,6)),
					parseInt(points[0].substring(6,8)),
					parseInt(points[1].substring(0,2)),
					parseInt(points[1].substring(2,4))
				
				),
				y: [
					parseFloat(points[2]),
					parseFloat(points[3]),
					parseFloat(points[4]),
					parseFloat(points[5])
				],
				z: points[0].substring(0,4)+'-'+points[0].substring(4,6)+'-'+points[0].substring(6,8)+" "+points[1].substring(0,2)+":"+points[1].substring(2,4)
			});
		}
	}
	chart.render();
}

}
</script>
</head>
<body>
<div id="chartContainer"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
</body>
</html>