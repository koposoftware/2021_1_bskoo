<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>테스트</title>

<link rel="stylesheet" href="./common.css">
<head>
<script src="./jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.min.js"></script>
<script
	src="https://raw.githubusercontent.com/google/palette.js/master/palette.js"></script>

<script>
	var ctx = document.getElementById("myChart");
	var myData = [ 12, 19, 3, 5, 2, 3 ];
	var myChart = new Chart(ctx,
			{
				type : 'pie',
				data : {
					labels : [ "First", "Second", "Third", "Fourth", "Fifth",
							"Sixth" ],
					datasets : [ {
						label : '# of Votes',
						data : myData,
						backgroundColor : palette('tol', myData.length).map(
								function(hex) {
									return '#' + hex;
								})
					} ]
				}
			});
</script>


</head>
<body>
	<canvas id="myChart" width="400" height="400"></canvas>
</body>

</html>






