 <aside class="main-sidebar">
  <section class="sidebar">         
          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header">Demographic and Social data</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="active"><a href="#agesection"><i class="fa fa-pie-chart"></i> <span>Sex and Age</span></a></li>
            <li><a href="#racesection"><i class="fa fa-pie-chart"></i> <span>Race</span></a></li>
            <li><a href="#hispanicorlatino"><i class="fa fa-pie-chart"></i> <span>Hispanic or Latino</span></a></li>
            <li><a href="#householdsbytype"><i class="fa fa-pie-chart"></i> <span>Households by Type</span></a></li>
            <li><a href="#relationship"><i class="fa fa-pie-chart"></i> <span>Relationship</span></a></li>
            <li><a href="#maritalstatus"><i class="fa fa-pie-chart"></i> <span>Maritial Status</span></a></li>
            <li><a href="#fertility"><i class="fa fa-pie-chart"></i> <span>Fertility</span></a></li>
            <li><a href="#grandparents"><i class="fa fa-pie-chart"></i> <span>Grandparents</span></a></li>
            <li><a href="#schoolenrollment"><i class="fa fa-pie-chart"></i> <span>School Enrollment</span></a></li>
            <li><a href="#educationalatt"><i class="fa fa-pie-chart"></i> <span>Educational Attainment</span></a></li>
            <li><a href="#veterans"><i class="fa fa-pie-chart"></i> <span>Veteran Status</span></a></li>
            <li><a href="#birthplace"><i class="fa fa-pie-chart"></i> <span>Place of Birth</span></a></li>
            <li><a href="#citizenship"><i class="fa fa-pie-chart"></i> <span>US Citizenship Status</span></a></li>
            <li><a href="#language"><i class="fa fa-pie-chart"></i> <span>Language Spoken at Home</span></a></li>
            <li><a href="#ancestry"><i class="fa fa-pie-chart"></i> <span>Ancestry</span></a></li>
            <li><a href="#computers"><i class="fa fa-pie-chart"></i> <span>Computer and Internet Usage</span></a></li>            
           </ul><!-- /.sidebar-menu -->
        </section>
 </aside>

<div class="content-wrapper">
        <!-- Content Header (Page header) -->
       
   


        <!-- Main content -->
        <section class="content">
<div class="row">
         <section class="content-header">  
	  <div class="row">         
          <ol class="breadcrumb">
		            <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
		            <li><a href="/states"><i class="fa fa-dashboard"></i> states</a></li>
		            <li><a href="/states/Puerto-Rico"><i class="fa fa-dashboard"></i> Puerto Rico</a></li>
		            <li><a href="/states/Puerto-Rico/cities-Puerto-Rico"><i class="fa fa-dashboard"></i> cities</a></li>
            <li class="active">Guayama zona urbana</li>
          </ol>
        </section>
 </div>
                            		<script src="${pageContext.request.contextPath}/js/icharts-min.js"></script> 
 <script>
  $(document).ready(function() 
          {   
			
	  var re= ${fipcode};	  
	  var dat ;
	  $.ajax({
			url : '${pageContext.request.contextPath}/charts',
			type : "GET",			
			headers: {
		        'resource':re
			},
			dataType : "json",
			contentType : "application/json",
				success: function(data){     
	             var obj= JSON.parse(JSON.stringify(data));           
	             var temp = obj.idToJsonMap; 
	            for (var key in temp) {
   			 	drawchart(key,temp[key]);
				}
	              
	             }
		});
			        	 
        	 
 });
</script>

<div itemscope itemtype="http://schema.org/Dataset">				
		<div id = "sexsection" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">The ratio of Male to Female population in Guayama zona urbana (2013 Census Estimates)</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-lg-4">		
			<p>	Total population : <span class="label label-primary">23575</span>
			</p><div id="name_male_female_percentage" style="min-width: 175px; height: 250px; max-width: 300px;"></div>	
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Male vs Female Percentage</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>Total Population -Male</td>								
									<td>45.9</td>
								</tr>
								<tr>
									<td>Total population - Female</td>								
									<td>54.1</td>
								</tr>						
							
							</tbody>
						</table>
					</div>							
			</div>
			<div class="col-lg-4">		
			<p>18 years and over: <span class="label label-primary">16764</span>
			</p><div id="name_18_years_and_over_cdp" style="min-width: 175px; height: 250px; max-width: 300px;"></div>	
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">18 years and over</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>18 years and over  Male</td>								
									<td>42.7</td>
								</tr>
								<tr>
									<td>18 years and over  Female</td>								
									<td>57.3</td>
								</tr>											
								
							</tbody>
						</table>
					</div>							
			</div>
			<div class="col-lg-4">			
			<p>65 years and over: <span class="label label-primary">3280</span>
			</p>
			<div id="name_65_years_and_over_cdp" style="min-width: 175px; height: 250px; max-width: 300px;"></div>	
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">65 years and over</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td>65 years and over  Male</td>								
									<td>40.6</td>
								</tr>
								<tr>
									<td>65 years and over  Female</td>								
									<td>59.4</td>
								</tr>
												
								
							</tbody>
						</table>
					</div>							
			</div>
			</div>
			</div>
		
		<div>
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- below-sex-data-horizontal -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-3154845825068093"
     data-ad-slot="3578399368"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Age details for Guayama zona urbana (2013 Census Estimates) </h3>
			</div>	
			<div id="agesection" class="panel-body">
			<div class = "col-lg-4">		
			<p>Median age (years): <span class="label label-primary">33.8 years</span>
			<p>18 years and over: <span class="label label-primary">71.1%</span>
			<p>21 years and over: <span class="label label-primary">66.8%</span>
			<p>62 years and over: <span class="label label-primary">16.1%</span>
			<p>65 years and over: <span class="label label-primary">13.9%</span>								
			</div>
			<div class = "col-lg-8">				
			<div id="name_age_distribution" style="min-width: 250px; height: 350px; max-width: 600px;"></div>						
			</div>					
		</div>
		</div>
		
		</div>
					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id ="racesection" class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Race Data for Guayama zona urbana (2013 Census Estimates)</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population : <span class="label label-primary">23575</span>	
			<p>	One race : <span class="label label-primary">95.9 %</span>	
			<p>	Two or more races : <span class="label label-primary">4.1 %</span>								
			</div>
			<div >		
			<p><span class="label label-success"><span itemprop="about">One Race-Breakdown</span></p>
					<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Race</th>
									<th style="width: 10%"><span itemprop="about">Sub Race</th>
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">White</td>
									<td></td>
									<td>70.5</td>
								</tr>
								<tr>
									<td><span itemprop="about">Black or African American</td>
									<td></td>
									<td>12.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">American Indian and Alaska Native</td>
									<td></td>
									<td>0.7</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Cherokee tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Chippewa tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Navajo tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Sioux tribal grouping</td>
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Asian</td>
									<td></td>
									<td>0</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Asian Indian</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Chinese</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Filipino</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Japanese</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Korean</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Vietnamese</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Other Asian</td>
									<td>N</td>
								</tr>
								
								<tr>
									<td><span itemprop="about">Native Hawaiian and Other Pacific Islander</td>
									<td></td>
									<td>0</td>
								</tr>
								
								<tr>
									<td></td>
									<td><span itemprop="about">Native Hawaiian</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Guamanian or Chamorro</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Samoan</td>
									<td>N</td>
								</tr>
								<tr>
									<td></td>
									<td><span itemprop="about">Other Pacific Islander</td>
									<td>N</td>
								</tr>
								
								<tr>
									<td><span itemprop="about">Some other race</td>
									<td></td>
									<td>12.3</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>
					</div>


					<div>			
			<p><span class="label label-success">Two or More Races-Breakdown</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Race</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">White and Black or African American</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">White and American Indian and Alaska Native</td>									
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">White and Asian</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Black or African American and American Indian and Alaska Native</td>								
									<td>N</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
		
		</div>
					
		</div>
		</div><div itemscope itemtype="http://schema.org/Dataset">
<div id = "hispanicorlatino" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Hispanic or Latino and Race - Guayama zona urbana (2013 Census Estimates)</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population: <span class="label label-primary">23575</span></p>
			<div>			
			<p>Hispanic or Latino (of any race): <span class="label label-primary">100 %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Hispanic or Latino (of any race)</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Mexican</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Puerto Rican</td>									
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Cuban</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Other Hispanic or Latino</td>								
									<td>N</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
			
			<div>			
			<p>Not Hispanic or Latino: <span class="label label-primary">0 %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Not Hispanic or Latino</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">White alone</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Black or African American alone</td>									
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">American Indian and Alaska Native alone</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Asian alone</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Native Hawaiian and Other Pacific Islander alone</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Some other race alone</td>								
									<td>N</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
			
			<div>			
			<p>Two or more races: <span class="label label-primary">N %</span></p>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%">Two or more races</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Two races including Some other race</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Two races excluding Some other race, and Three or more races</td>									
									<td>N</td>
								</tr>
								
							</tbody>
						</table>
					</div>						
			</div>
			
			
			</div>
		</div>
		
		</div>
		</div>  </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

		
		