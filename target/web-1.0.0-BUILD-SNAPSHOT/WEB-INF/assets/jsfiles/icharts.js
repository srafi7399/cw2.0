function drawchart(chartid, jsonstring) {
	var obj = JSON.parse(jsonstring);
	// Build the chart
	new Highcharts.Chart(
			{
				chart : {
					renderTo : chartid,
					plotBackgroundColor : null,
					plotBorderWidth : null,
					plotShadow : false

				},
				title : {
					text : obj.chartTitle
				},
				tooltip : {
					pointFormat : '<b>{point.percentage:.1f}%</b>'
				},
				plotOptions : {
					pie : {
						allowPointSelect : true,
						cursor : 'pointer',
						showInLegend : obj.plotOptions.showInLegend,
						dataLabels : {
							enabled : obj.plotOptions.dataLabels.enabled,
							format : '<b>{point.name}</b>: {point.percentage:.1f} %',
							style : {
								color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
										|| 'black'
							},
							connectorColor : 'silver'
						}
					}
				},
				series : [ {
					type : 'pie',
					name : obj.series.name,
					data : obj.series.data
				} ]

			});
};
        	

   