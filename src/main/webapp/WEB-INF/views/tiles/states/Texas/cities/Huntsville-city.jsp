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
		            <li><a href="/states/Texas"><i class="fa fa-dashboard"></i> Texas</a></li>
		            <li><a href="/states/Texas/cities-Texas"><i class="fa fa-dashboard"></i> cities</a></li>
            <li class="active">Huntsville city</li>
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
				<h3 class="panel-title"><span itemprop="about">The ratio of Male to Female population in Huntsville city (2013 Census Estimates)</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-lg-4">		
			<p>	Total population : <span class="label label-primary">39675</span>
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
									<td>61.3</td>
								</tr>
								<tr>
									<td>Total population - Female</td>								
									<td>38.7</td>
								</tr>						
							
							</tbody>
						</table>
					</div>							
			</div>
			<div class="col-lg-4">		
			<p>18 years and over: <span class="label label-primary">34190</span>
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
									<td>63.3</td>
								</tr>
								<tr>
									<td>18 years and over  Female</td>								
									<td>36.7</td>
								</tr>											
								
							</tbody>
						</table>
					</div>							
			</div>
			<div class="col-lg-4">			
			<p>65 years and over: <span class="label label-primary">2888</span>
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
									<td>42.4</td>
								</tr>
								<tr>
									<td>65 years and over  Female</td>								
									<td>57.6</td>
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
				<h3 class="panel-title"><span itemprop="about">Age details for Huntsville city (2013 Census Estimates) </h3>
			</div>	
			<div id="agesection" class="panel-body">
			<div class = "col-lg-4">		
			<p>Median age (years): <span class="label label-primary">29.2 years</span>
			<p>18 years and over: <span class="label label-primary">86.2%</span>
			<p>21 years and over: <span class="label label-primary">71.3%</span>
			<p>62 years and over: <span class="label label-primary">8.7%</span>
			<p>65 years and over: <span class="label label-primary">7.3%</span>								
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
				<h3 class="panel-title"><span itemprop="about">Race Data for Huntsville city (2013 Census Estimates)</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population : <span class="label label-primary">39675</span>	
			<p>	One race : <span class="label label-primary">99.6 %</span>	
			<p>	Two or more races : <span class="label label-primary">0.4 %</span>								
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
									<td>68.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">Black or African American</td>
									<td></td>
									<td>28.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">American Indian and Alaska Native</td>
									<td></td>
									<td>0.3</td>
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
									<td>1.7</td>
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
									<td>1.4</td>
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
				<h3 class="panel-title"><span itemprop="about">Hispanic or Latino and Race - Huntsville city (2013 Census Estimates)</h3>
			</div>
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population: <span class="label label-primary">39675</span></p>
			<div>			
			<p>Hispanic or Latino (of any race): <span class="label label-primary">20.3 %</span></p>
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
			<p>Not Hispanic or Latino: <span class="label label-primary">79.7 %</span></p>
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
									<td>49.5</td>
								</tr>
								<tr>
									<td><span itemprop="about">Black or African American alone</td>									
									<td>28</td>
								</tr>
								<tr>
									<td><span itemprop="about">American Indian and Alaska Native alone</td>								
									<td>0.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Asian alone</td>								
									<td>1.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Native Hawaiian and Other Pacific Islander alone</td>								
									<td>0</td>
								</tr>
								<tr>
									<td><span itemprop="about">Some other race alone</td>								
									<td>0</td>
								</tr>
							</tbody>
						</table>
					</div>						
			</div>
			
			<div>			
			<p>Two or more races: <span class="label label-primary">0.2 %</span></p>
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
									<td>0</td>
								</tr>
								<tr>
									<td><span itemprop="about">Two races excluding Some other race, and Three or more races</td>									
									<td>0.2</td>
								</tr>
								
							</tbody>
						</table>
					</div>						
			</div>
			
			
			</div>
		</div>
		
		</div>
		</div><div itemscope itemtype="http://schema.org/Dataset">
<div id = "householdsbytype" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Households by type in <span itemprop="spatial">Huntsville city (2013 Census Estimates)</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-6">		
			<p>	<span itemprop="about">Total Households in Huntsville city : <span class="label label-primary">10083</span>
			<p>	<span itemprop="about">Households with one or more people under 18 years  : <span class="label label-primary">30.8%</span>
			<p>	<span itemprop="about">Households with one or more people 65 years and over  : <span class="label label-primary">18.4%</span>
			<p>	<span itemprop="about">Average household size in Huntsville city : <span class="label label-primary">2.31</span>
			<p>	<span itemprop="about">Average family size in Huntsville city : <span class="label label-primary">2.84</span>	
			</p>
			<div id="name_fam_vs_nonfam_hos" style="min-width: 175px; height: 250px; max-width: 300px;"></div>						
			
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Household Type</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Family households (families)</td>								
									<td>55.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Nonfamily households</td>								
									<td>44.7</td>
								</tr>													
								
							</tbody>
						</table>
					</div>					
		</div>
		
		<div class = "col-xs-6">
		<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Family Households by type</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Married Couple family</td>								
									<td>32.5</td>
								</tr>
								<tr>
									<td><span itemprop="about">Male Household- No Wife Present</td>								
									<td>3.5</td>
								</tr>
								<tr>
									<td><span itemprop="about">Female Household-No Husband Present</td>								
									<td>19.4</td>
								</tr>														
								
							</tbody>
						</table>
					</div>		
					
		<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Nonfamily households</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Householder living alone</td>								
									<td>29.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">65 years and over</td>								
									<td>7.9</td>
								</tr>													
								
							</tbody>
						</table>
					</div>		
					</div>
					
					
					</div>
					</div>
					
					</div>
					
		
			<div itemscope itemtype="http://schema.org/Dataset">
<div id = "relationship" class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Relationship in <span itemprop="spatial">Huntsville city households (2013 Census Estimates)</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Population in households : <span class="label label-primary">23293</span></p>
									
			<div class="col-xs-12">	
			<div  class="panel-body">		
			<div id="name_relationship_by_type" style="min-width: 375px; height: 450px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Relationship by type</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Householder</td>								
									<td>43.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Spouse</td>								
									<td>13.5</td>
								</tr>
								<tr>
									<td><span itemprop="about">Child</td>								
									<td>26.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Other relatives</td>								
									<td>4.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">Nonrelatives</td>								
									<td>12.7</td>
								</tr>								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "maritalstatus" class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Marital Status in <span itemprop="spatial">Huntsville city (2013 Census Estimates)</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Population of Males 15 years and over : <span class="label label-primary">21962</span>
			<p> Population of Females 15 years and over: <span class="label label-primary">12925</span>		
			
			<div class="col-xs-6">	
			<div  class="panel-body">		
			<div id="name_maritial_status_male" style="min-width: 250px; height: 350px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Maritial Status of Males</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Never married</td>								
									<td>50.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">Now married, except separated</td>								
									<td>30.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">Separated</td>								
									<td>2.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">Widowed</td>								
									<td>1.9</td>
								</tr>
								<tr>
									<td><span itemprop="about">Divorced</td>								
									<td>14.3</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			<div class="col-xs-6">	
			<div  class="panel-body">					
			<div id="name_maritial_status_female" style="min-width: 250px; height: 350px; max-width: 500px;"></div>	
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Maritial Status of females</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Never married</td>								
									<td>52.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Now married, except separated</td>								
									<td>29.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Separated</td>								
									<td>1.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">Widowed</td>								
									<td>7.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">Divorced</td>								
									<td>9.7</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>	
				</div>						
			</div>
			</div>
			</div>	
					
		</div>
		
		</div>
		
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">	
<div id = "fertility" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Fertility Data for Women in <span itemprop="spatial">Huntsville city (2013 Census Estimates)</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	<span itemprop="about">Number of women 15 to 50 years old who had a birth in the past 12 months : <span class="label label-primary">N</span></p>
			<p>	<span itemprop="about">Unmarried women (widowed, divorced, and never married) : <span class="label label-primary">N %</span></p>
		
						
			<div class="col-xs-12">	
			<div  class="panel-body">					
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Fertility</th>								
									<th style="width: 10%">Per 1000 Women</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Per 1,000 unmarried women</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Per 1,000 women 15 to 50 years old</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Per 1,000 women 15 to 19 years old</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Per 1,000 women 20 to 34 years old</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Per 1,000 women 35 to 50 years old</td>								
									<td>N</td>
								</tr>								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "grandparents" class="panel panel-default">
	
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Grandparents responsible for own Grandchildren in <span itemprop="spatial">Huntsville city (2013 Census Estimates) </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	<span itemprop="about">Number of grandparents living with own grandchildren under 18 years : <span class="label label-primary">N</span></p>
			<p>	<span itemprop="about">Grandparents responsible for grandchildren : <span class="label label-primary">N %</span></p>
			<p>	<span itemprop="about">Number of grandparents responsible for own grandchildren under 18 years : <span class="label label-primary">N </span></p>
			<p>	<span itemprop="about">Percentage of female grandparents responsible for own grandchildren under 18 years : <span class="label label-primary">N %</span></p>
			<p>	<span itemprop="about">Percentage of male grandparents responsible for own grandchildren under 18 years : <span class="label label-primary">N %</span></p>
									
			<div class="col-xs-12">	
			<div  class="panel-body">					
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Years responsible for Grandchildren</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Less than 1 year</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">1 or 2 years</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">3 or 4 years</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">5 or more years</td>								
									<td>N</td>
								</tr>													
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
	<div id = "schoolenrollment" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">School Enrollment in <span itemprop="spatial">Huntsville city (2013 Census Estimates) </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Population 3 years and over enrolled in school : <span class="label label-primary">13681</span></p>
						
			<div class="col-xs-12">	
			<div  class="panel-body">		
			<div id="name_school_enrollment_by_grade" style="min-width: 375px; height: 450px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">School Enrollment</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Nursery school, preschool</td>								
									<td>2.6</td>
								</tr>
								<tr>
									<td><span itemprop="about">Kindergarten</td>								
									<td>3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Elementary school (grades 1-8)</td>								
									<td>17.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">High School (grades 9-12)</td>								
									<td>11.4</td>
								</tr>
								<tr>
									<td><span itemprop="about">College or graduate school</td>								
									<td>65.5</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "educationalatt" class="panel panel-default">
	
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Educational Attainment in <span itemprop="spatial">Huntsville city (2013 Census Estimates)</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Population 25 years and over : <span class="label label-primary">23349</span></p>
			<p>	Percent high school graduate or higher : <span class="label label-primary">78 %</span></p>
			<p>	Percent bachelors degree or higher : <span class="label label-primary">15.8 %</span></p>
						
			<div class="col-xs-12">	
			<div  class="panel-body">		
			<div id="name_educational_attainment_levels" style="min-width: 375px; height: 450px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Educational Attainment levels</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Less than 9th grade</td>								
									<td>7.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">9th to 12th grade, no diploma</td>								
									<td>14.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">High school graduate (includes equivalency)</td>								
									<td>34.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">Some college, no degree</td>								
									<td>24.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Associates degree</td>								
									<td>3.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">Bachelors degree</td>								
									<td>10.5</td>
								</tr>
								<tr>
									<td><span itemprop="about">Graduate or professional degree</td>								
									<td>5.2</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		
		</div>
		
		

					
		<div itemscope itemtype="http://schema.org/Dataset">	
<div id = "veterans" class="panel panel-default">
	
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Veterans Status in <span itemprop="spatial">Huntsville city (2013 Census Estimates)</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	<span itemprop="about">Civilian population 18 years and over : <span class="label label-primary">34121</span></p>
			<p>	<span itemprop="about">Civilian Veterans : <span class="label label-primary">7.2 %</span></p>
			</div>	
			</div>		
	
					
		</div>	
		
		</div>

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "birthplace" class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Place of Birth data for <span itemprop="spatial">Huntsville city (2013 Census Estimates)</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-6">		
			<p>	Total Population in Huntsville city : <span class="label label-primary">39675</span>					
			</p>
			<div id="name_nat_vs_foreign" style="min-width: 175px; height: 250px; max-width: 300px;"></div>						
			
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Native Vs Foreign Born</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Native</td>								
									<td>90.7</td>
								</tr>
								<tr>
									<td><span itemprop="about">Foreign born </td>								
									<td>9.3</td>
								</tr>													
								
							</tbody>
						</table>
					</div>					
		</div>
		
		<div class = "col-xs-6">
		<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Native population breakdown</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Born in U.S- Same state of residence</td>								
									<td>72.6</td>
								</tr>
								<tr>
									<td><span itemprop="about">Born in U.S- different state of residence</td>								
									<td>17</td>
								</tr>
								<tr>
									<td><span itemprop="about">Born in Puerto Rico, U.S Island areas, or born abroad to American parent(s)</td>								
									<td>1.1</td>
								</tr>														
								
							</tbody>
						</table>
					</div>	
					</div>
					</div>
					</div>
					</div><div itemscope itemtype="http://schema.org/Dataset">
<div id = "citizenship" class="panel panel-default">		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">U.S Citizenship Status for foreign born population in <span itemprop="spatial">Huntsville city (2013 Census Estimates)</h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Foreign born population : <span class="label label-primary">3678</span></p>
									
			<div class="col-xs-12">	
			<div  class="panel-body">		
			<div id="name_natural_us_citizen_vs_not_a_us_citizen" style="min-width: 250px; height: 350px; max-width: 500px;">
			</div>
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Foreign born population-Citizenship Status</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><span itemprop="about">Naturalized U.S citizen </td>								
									<td>19.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">Not a U.S citizen</td>								
									<td>80.9</td>
								</tr>
											
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>
		</div>
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "language" class="panel panel-default">
	
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Language spoken at home in <span itemprop="spatial">Huntsville city (2013 Census Estimates) </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-6">		
			<p>	Population 5 years and over in Huntsville city : <span class="label label-primary">N</span>					
			</p>
			<div id="name_lang_spoken_at_home_bdown" style="min-width: 175px; height: 250px; max-width: 300px;"></div>						
			
			<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">English vs Other Languages</th>								
									<th style="width: 10%">Estimate (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">English only</td>								
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">Language other than English</td>								
									<td>N</td>
								</tr>													
								
							</tbody>
						</table>
					</div>					
		</div>
		
		<div class = "col-xs-6">
		<p>	Breakdown of non English languages with data on English speaking ability	</p>
		<div class="table-responsive">
						<table
							class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Language Spoken</th>								
									<th style="width: 10%">Estimate (%)</th>
									<th style="width: 10%"><span itemprop="about">Can Speak English less than very well (%)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span itemprop="about">Spanish</td>								
									<td>N</td>
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about">European languages</td>								
									<td>N</td>
									<td>N</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Asian and Pacific Islander languages</td>								
									<td>N</td>
									<td>N</td>
								</tr>									
								<tr>
									<td><span itemprop="about">Other languages</td>								
									<td>N</td>
									<td>N</td>
								</tr>														
								
							</tbody>
						</table>
					</div>	
					</div>
					</div>
					</div>
</div><div itemscope itemtype="http://schema.org/Dataset">
<div id = "ancestry" class="panel panel-default">

			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Ancestry Data for population in <span itemprop="spatial">Huntsville city (2013 Census Estimates) </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total population : <span class="label label-primary">39675</span>		
			<div class="col-xs-12">	
			<div  class="panel-body">					
			<div class="table-responsive">
						<table	class="table table-condensed table-striped table-bordered table-hover no-margin">
							<thead>
								<tr>
									<th style="width: 10%"><span itemprop="about">Ancestry</th>								
									<th style="width: 10%">Estimate(%)</th>
								</tr>
							</thead>
							<tbody>

								
								
								<tr>
									<td><span itemprop="about">American</td>								
									<td>4.3</td>
								</tr>
								<tr>
									<td><span itemprop="about">Arab</td>								
									<td>0.2</td>
								</tr>
								<tr>
									<td><span itemprop="about">Czech</td>								
									<td>0.8</td>
								</tr>
								<tr>
									<td><span itemprop="about">Danish</td>								
									<td>0.1</td>
								</tr>
								<tr>
									<td><span itemprop="about">Dutch</td>								
									<td>0.9</td>
								</tr>
								<tr>
									<td><span itemprop="about"> English</td>								
									<td>10.7</td>
								</tr>
								<tr>
									<td><span itemprop="about"> French (except Basque)</td>								
									<td>3.3</td>
								</tr>
								<tr>
									<td><span itemprop="about"> French Canadian</td>								
									<td>0.3</td>
								</tr>
								<tr>
									<td><span itemprop="about"> German</td>								
									<td>11.4</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Greek</td>								
									<td>0.1</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Hungarian</td>								
									<td>0.2</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Irish</td>								
									<td>9</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Italian</td>								
									<td>2.7</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Lithuanian</td>								
									<td>0</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Norwegian</td>								
									<td>0.6</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Polish</td>								
									<td>0.7</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Portuguese</td>								
									<td>0.2</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Russian</td>								
									<td>0</td>
								</tr>
								<tr>
									<td><span itemprop="about"> Scotch-Irish</td>								
									<td>0.6</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Scottish</td>								
									<td>1</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Slovak</td>								
									<td>0</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Subsaharan African</td>								
									<td>1.3</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Swedish</td>								
									<td>0.2</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Swiss</td>								
									<td>0.2</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Ukrainian</td>								
									<td>0.2</td>
								</tr>
								
								<tr>
									<td><span itemprop="about"> Welsh</td>								
									<td>0.3</td>
								</tr>
								<tr>
									<td><span itemprop="about"> West Indian (excluding Hispanic origin groups)</td>								
									<td>0.1</td>
								</tr>
									
								
																		
								
							</tbody>
						</table>
					</div>		
				</div>
			</div>						
			
					
		</div>	

					
		</div>
		</div>	
		
		</div>
		

					
		<div itemscope itemtype="http://schema.org/Dataset">
<div id = "computers" class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title"><span itemprop="about">Computers and Internet use in <span itemprop="spatial">Huntsville city (2013 Census Estimates) </h3>
			</div>			
			<div  class="panel-body">
			<div class = "col-xs-12">		
			<p>	Total Households : <span class="label label-primary">(X)</span></p>
			<p>	<span itemprop="about">Households with a Computer : <span class="label label-primary">(X) </span></p>
			<p>	<span itemprop="about">Households with a broadband internet subscription : <span class="label label-primary">(X) </span></p>
			</div>	
			</div>		
	
					
		</div>	
</div>
					
		  </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

		
		