/**
 * JS File to 
 */
var chartView='PopEstimatesAll';
var chartName='United States';
 /*  $(document).ready(function () {
	loadPopulationData("United States");
	
	
});    
   */
   var nameofCommenter;
   var emailOfCommenter;
   var comments;  
 
  
	function loadPopulationData(nameofchart) {
		chartName=nameofchart;
		$.ajax({
			url : 'population',
			type : "GET",
			data : {
				name : nameofchart
			},
			headers: {
		        'typeofchart':chartView,
		        'nameofchart':chartName,
		          },
			dataType : "json",
			contentType : "application/json"
		}).success(function(data) {
			
			var typeOfChartToDisplay='bar';
			var processed_json ;
			var categoriesD ;		
			var seriesFinal = new Array();
			var chartTitle;
			var dataArray = new Array();
			dataArray=JSON.stringify(data);			
		
			if(nameofchart=='All Regions')
				{
				typeOfChartToDisplay='column';
				}
			
			$.each(data, function(idx, obj) {
				
				$(obj).each(function(key, value){
		            		            
		            if (chartView=='PopEstimatesAll') {
		            	
		            	 var seriesData = {
		 				        name: '',
		 				        data: []
		 			 };
						chartTitle='Population Estimates for '+nameofchart	
						categoriesD= new Array();
						processed_json= new Array();
						
						processed_json.push(obj.POPESTIMATE2010);
						categoriesD.push("2010");
						processed_json.push(obj.POPESTIMATE2011);
						categoriesD.push("2011");
						processed_json.push(obj.POPESTIMATE2012);
						categoriesD.push("2012");
						processed_json.push(obj.POPESTIMATE2013);
						categoriesD.push("2013");
						processed_json.push(obj.POPESTIMATE2014);
						categoriesD.push("2014");
						seriesData.name=value.NAME;
						seriesData.data=processed_json; 
						seriesFinal.push(seriesData);
						
										   
					}
		            else if (chartView=='PopEstimatesNum') {
						chartTitle='Numeric Change in population for '+nameofchart
						 var seriesData = {
						        name: '',
						        data: []
					 };
						
						categoriesD= new Array();
						processed_json= new Array();
						processed_json.push(obj.NPOPCHG_2010);
						categoriesD.push("2010");
						processed_json.push(obj.NPOPCHG_2011);
						categoriesD.push("2011");
						processed_json.push(obj.NPOPCHG_2012);
						categoriesD.push("2012");
						processed_json.push(obj.NPOPCHG_2013);
						categoriesD.push("2013");
						processed_json.push(obj.NPOPCHG_2014);
						categoriesD.push("2014");
						seriesData.name=value.NAME;
						seriesData.data=processed_json;
						seriesFinal.push(seriesData);
						
					}
					else if (chartView=='PopEstimatesPer')
						{
						chartTitle='Percentage change in Population for '+nameofchart
						 var seriesData = {
						        name: '',
						        data: []
					 };
						
						categoriesD= new Array();
						processed_json= new Array();
						processed_json.push(obj.PPOPCHG_2010);
						categoriesD.push("2010");
						processed_json.push(obj.PPOPCHG_2011);
						categoriesD.push("2011");
						processed_json.push(obj.PPOPCHG_2012);
						categoriesD.push("2012");
						processed_json.push(obj.PPOPCHG_2013);
						categoriesD.push("2013");
						processed_json.push(obj.PPOPCHG_2014);
						categoriesD.push("2014");
						seriesData.name=value.NAME;
						seriesData.data=processed_json;
						seriesFinal.push(seriesData);
						
						}
				});			
							
			});
			
			
			$('#ActualPane').highcharts({
		        chart: {
		            type: typeOfChartToDisplay
		        },
		        title: {
		            text: chartTitle
		        },
		        subtitle: {
		            text: 'Source:- US Govt Census'
		        },
		        xAxis: {		        	
		        		categories:categoriesD                    
                },
                
		        yAxis: {
		         
		            title: {
		                text: 'Population'
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:12px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0,		                
		            },
		        series: {
	                colorByPoint: true,
	                dataLabels: {
	                    enabled: true,
	                    inside:true
	                }
	            }
		        	
		        },		        
                series:seriesFinal,
		    });
			
			
			
			 
		})

	}