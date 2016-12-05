<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>	
<tilesx:useAttribute name="current"/>

		
      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
          Censtat.com
          <span class="logo-mini"><b>A</b></span>
          
          <span class="logo-lg"><b>Admin</b></span>
        </a>

        <!-- Header Navbar -->
        <c:set var="context" value="${pageContext.request.contextPath}"> 
        <c:set var = "root"  value = "${context}/censite">
        <nav class="navbar navbar-static-top" role="navigation">
        
         <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
        
             <div class="row">
		
						<div>
							<ul class="nav navbar-nav">
								<li class=""><a href=${root}>Home</a></li>	
								<li class=""><a href="${root}/states">States Data</a></li>	
							
								 <li class="dropdown">
                <a href="http://censtat.com/states/Arkansas#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Metros Data <span class="caret"></span></a>
                <ul class="dropdown-menu">                 
                  										
					
				<li><a href="${root}/states/Alabama/metros-Alabama">Alabama</a></li>
					<li><a href="${root}/states/Alaska/metros-Alaska">Alaska</a></li>
					<li><a href="${root}/states/Arizona/metros-Arizona">Arizona</a></li>
					<li><a href="${root}/states/Arkansas/metros-Arkansas">Arkansas</a></li>
					<li><a href="${root}/states/California/metros-California">California</a></li>
					<li><a href="${root}/states/Colorado/metros-Colorado">Colorado</a></li>
					<li><a href="${root}/states/Connecticut/metros-Connecticut">Connecticut</a></li>
					<li><a href="${root}/states/Delaware/metros-Delaware">Delaware</a></li>
					<li><a href="${root}/states/District-of-Columbia/metros-District-of-Columbia">District of Columbia</a></li>
					<li><a href="${root}/states/Florida/metros-Florida">Florida</a></li>
					<li><a href="${root}/states/Georgia/metros-Georgia">Georgia</a></li>
					<li><a href="${root}/states/Hawaii/metros-Hawaii">Hawaii</a></li>
					<li><a href="${root}/states/Idaho/metros-Idaho">Idaho</a></li>
					<li><a href="${root}/states/Illinois/metros-Illinois">Illinois</a></li>
					<li><a href="${root}/states/Indiana/metros-Indiana">Indiana</a></li>
					<li><a href="${root}/states/Iowa/metros-Iowa">Iowa</a></li>
					<li><a href="${root}/states/Kansas/metros-Kansas">Kansas</a></li>
					<li><a href="${root}/states/Kentucky/metros-Kentucky">Kentucky</a></li>
					<li><a href="${root}/states/Louisiana/metros-Louisiana">Louisiana</a></li>
					<li><a href="${root}/states/Maine/metros-Maine">Maine</a></li>
					<li><a href="${root}/states/Maryland/metros-Maryland">Maryland</a></li>
					<li><a href="${root}/states/Massachusetts/metros-Massachusetts">Massachusetts</a></li>
					<li><a href="${root}/states/Michigan/metros-Michigan">Michigan</a></li>
					<li><a href="${root}/states/Minnesota/metros-Minnesota">Minnesota</a></li>
					<li><a href="${root}/states/Mississippi/metros-Mississippi">Mississippi</a></li>
					<li><a href="${root}/states/Missouri/metros-Missouri">Missouri</a></li>
					<li><a href="${root}/states/Montana/metros-Montana">Montana</a></li>
					<li><a href="${root}/states/Nebraska/metros-Nebraska">Nebraska</a></li>
					<li><a href="${root}/states/Nevada/metros-Nevada">Nevada</a></li>
					<li><a href="${root}/states/New-Hampshire/metros-New-Hampshire">New Hampshire</a></li>
					<li><a href="${root}/states/New-Jersey/metros-New-Jersey">New Jersey</a></li>
					<li><a href="${root}/states/New-Mexico/metros-New-Mexico">New Mexico</a></li>
					<li><a href="${root}/states/New-York/metros-New-York">New York</a></li>
					<li><a href="${root}/states/North-Carolina/metros-North-Carolina">North Carolina</a></li>
					<li><a href="${root}/states/North-Dakota/metros-North-Dakota">North Dakota</a></li>
					<li><a href="${root}/states/Ohio/metros-Ohio">Ohio</a></li>
					<li><a href="${root}/states/Oklahoma/metros-Oklahoma">Oklahoma</a></li>
					<li><a href="${root}/states/Oregon/metros-Oregon">Oregon</a></li>
					<li><a href="${root}/states/Pennsylvania/metros-Pennsylvania">Pennsylvania</a></li>
					<li><a href="${root}/states/Rhode-Island/metros-Rhode-Island">Rhode Island</a></li>
					<li><a href="${root}/states/South-Carolina/metros-South-Carolina">South Carolina</a></li>
					<li><a href="${root}/states/South-Dakota/metros-South-Dakota">South Dakota</a></li>
					<li><a href="${root}/states/Tennessee/metros-Tennessee">Tennessee</a></li>
					<li><a href="${root}/states/Texas/metros-Texas">Texas</a></li>
					<li><a href="${root}/states/Utah/metros-Utah">Utah</a></li>
					<li><a href="${root}/states/Vermont/metros-Vermont">Vermont</a></li>
					<li><a href="${root}/states/Virginia/metros-Virginia">Virginia</a></li>
					<li><a href="${root}/states/Washington/metros-Washington">Washington</a></li>
					<li><a href="${root}/states/West-Virginia/metros-West-Virginia">West Virginia</a></li>
					<li><a href="${root}/states/Wisconsin/metros-Wisconsin">Wisconsin</a></li>
					<li><a href="${root}/states/Wyoming/metros-Wyoming">Wyoming</a></li>
					<li><a href="${root}/states/Puerto-Rico/metros-Puerto-Rico">Puerto Rico</a></li>
					 <li role="separator" class="divider"></li>
					         
                 
                </ul>
              </li>		
								
								
								 <li class="dropdown">
                <a href="http://censtat.com/states/Arkansas#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cities Data <span class="caret"></span></a>
                <ul class="dropdown-menu">    
					
						<li><a href="${root}/states/Alabama/cities-Alabama">Alabama</a></li>
						<li><a href="${root}/states/Alaska/cities-Alaska">Alaska</a></li>
						<li><a href="${root}/states/Arizona/cities-Arizona">Arizona</a></li>
						<li><a href="${root}/states/Arkansas/cities-Arkansas">Arkansas</a></li>
						<li><a href="${root}/states/California/cities-California">California</a></li>
						<li><a href="${root}/states/Colorado/cities-Colorado">Colorado</a></li>
						<li><a href="${root}/states/Connecticut/cities-Connecticut">Connecticut</a></li>
						<li><a href="${root}/states/Delaware/cities-Delaware">Delaware</a></li>
						<li><a href="${root}/states/District-of-Columbia/cities-District-of-Columbia">District of Columbia</a></li>
						<li><a href="${root}/states/Florida/cities-Florida">Florida</a></li>
						<li><a href="${root}/states/Georgia/cities-Georgia">Georgia</a></li>
						<li><a href="${root}/states/Hawaii/cities-Hawaii">Hawaii</a></li>
						<li><a href="${root}/states/Idaho/cities-Idaho">Idaho</a></li>
						<li><a href="${root}/states/Illinois/cities-Illinois">Illinois</a></li>
						<li><a href="${root}/states/Indiana/cities-Indiana">Indiana</a></li>
						<li><a href="${root}/states/Iowa/cities-Iowa">Iowa</a></li>
						<li><a href="${root}/states/Kansas/cities-Kansas">Kansas</a></li>
						<li><a href="${root}/states/Kentucky/cities-Kentucky">Kentucky</a></li>
						<li><a href="${root}/states/Louisiana/cities-Louisiana">Louisiana</a></li>
						<li><a href="${root}/states/Maine/cities-Maine">Maine</a></li>
						<li><a href="${root}/states/Maryland/cities-Maryland">Maryland</a></li>
						<li><a href="${root}/states/Massachusetts/cities-Massachusetts">Massachusetts</a></li>
						<li><a href="${root}/states/Michigan/cities-Michigan">Michigan</a></li>
						<li><a href="${root}/states/Minnesota/cities-Minnesota">Minnesota</a></li>
						<li><a href="${root}/states/Mississippi/cities-Mississippi">Mississippi</a></li>
						<li><a href="${root}/states/Missouri/cities-Missouri">Missouri</a></li>
						<li><a href="${root}/states/Montana/cities-Montana">Montana</a></li>
						<li><a href="${root}/states/Nebraska/cities-Nebraska">Nebraska</a></li>
						<li><a href="${root}/states/Nevada/cities-Nevada">Nevada</a></li>
						<li><a href="${root}/states/New-Hampshire/cities-New-Hampshire">New Hampshire</a></li>
						<li><a href="${root}/states/New-Jersey/cities-New-Jersey">New Jersey</a></li>
						<li><a href="${root}/states/New-Mexico/cities-New-Mexico">New Mexico</a></li>
						<li><a href="${root}/states/New-York/cities-New-York">New York</a></li>
						<li><a href="${root}/states/North-Carolina/cities-North-Carolina">North Carolina</a></li>
						<li><a href="${root}/states/North-Dakota/cities-North-Dakota">North Dakota</a></li>
						<li><a href="${root}/states/Ohio/cities-Ohio">Ohio</a></li>
						<li><a href="${root}/states/Oklahoma/cities-Oklahoma">Oklahoma</a></li>
						<li><a href="${root}/states/Oregon/cities-Oregon">Oregon</a></li>
						<li><a href="${root}/states/Pennsylvania/cities-Pennsylvania">Pennsylvania</a></li>
						<li><a href="${root}/states/Rhode-Island/cities-Rhode-Island">Rhode Island</a></li>
						<li><a href="${root}/states/South-Carolina/cities-South-Carolina">South Carolina</a></li>
						<li><a href="${root}/states/South-Dakota/cities-South-Dakota">South Dakota</a></li>
						<li><a href="${root}/states/Tennessee/cities-Tennessee">Tennessee</a></li>
						<li><a href="${root}/states/Texas/cities-Texas">Texas</a></li>
						<li><a href="${root}/states/Utah/cities-Utah">Utah</a></li>
						<li><a href="${root}/states/Vermont/cities-Vermont">Vermont</a></li>
						<li><a href="${root}/states/Virginia/cities-Virginia">Virginia</a></li>
						<li><a href="${root}/states/Washington/cities-Washington">Washington</a></li>
						<li><a href="${root}/states/West-Virginia/cities-West-Virginia">West Virginia</a></li>
						<li><a href="${root}/states/Wisconsin/cities-Wisconsin">Wisconsin</a></li>
						<li><a href="${root}/states/Wyoming/cities-Wyoming">Wyoming</a></li>
						<li><a href="${root}/states/Puerto-Rico/cities-Puerto-Rico">Puerto Rico</a></li>
					 <li role="separator" class="divider"></li>
                </ul>
              </li>		
								
							
								 <li class="dropdown">
                <a href="http://censtat.com/states/Arkansas#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Counties Data <span class="caret"></span></a>
                <ul class="dropdown-menu">                  

					<li><a href="${root}/states/Alabama/counties-Alabama">Alabama</a></li>
					<li><a href="${root}/states/Alaska/counties-Alaska">Alaska</a></li>
					<li><a href="${root}/states/Arizona/counties-Arizona">Arizona</a></li>
					<li><a href="${root}/states/Arkansas/counties-Arkansas">Arkansas</a></li>
					<li><a href="${root}/states/California/counties-California">California</a></li>
					<li><a href="${root}/states/Colorado/counties-Colorado">Colorado</a></li>
					<li><a href="${root}/states/Connecticut/counties-Connecticut">Connecticut</a></li>
					<li><a href="${root}/states/Delaware/counties-Delaware">Delaware</a></li>
					<li><a href="${root}/states/District-of-Columbia/counties-District-of-Columbia">District of Columbia</a></li>
					<li><a href="${root}/states/Florida/counties-Florida">Florida</a></li>
					<li><a href="${root}/states/Georgia/counties-Georgia">Georgia</a></li>
					<li><a href="${root}/states/Hawaii/counties-Hawaii">Hawaii</a></li>
					<li><a href="${root}/states/Idaho/counties-Idaho">Idaho</a></li>
					<li><a href="${root}/states/Illinois/counties-Illinois">Illinois</a></li>
					<li><a href="${root}/states/Indiana/counties-Indiana">Indiana</a></li>
					<li><a href="${root}/states/Iowa/counties-Iowa">Iowa</a></li>
					<li><a href="${root}/states/Kansas/counties-Kansas">Kansas</a></li>
					<li><a href="${root}/states/Kentucky/counties-Kentucky">Kentucky</a></li>
					<li><a href="${root}/states/Louisiana/counties-Louisiana">Louisiana</a></li>
					<li><a href="${root}/states/Maine/counties-Maine">Maine</a></li>
					<li><a href="${root}/states/Maryland/counties-Maryland">Maryland</a></li>
					<li><a href="${root}/states/Massachusetts/counties-Massachusetts">Massachusetts</a></li>
					<li><a href="${root}/states/Michigan/counties-Michigan">Michigan</a></li>
					<li><a href="${root}/states/Minnesota/counties-Minnesota">Minnesota</a></li>
					<li><a href="${root}/states/Mississippi/counties-Mississippi">Mississippi</a></li>
					<li><a href="${root}/states/Missouri/counties-Missouri">Missouri</a></li>
					<li><a href="${root}/states/Montana/counties-Montana">Montana</a></li>
					<li><a href="${root}/states/Nebraska/counties-Nebraska">Nebraska</a></li>
					<li><a href="${root}/states/Nevada/counties-Nevada">Nevada</a></li>
					<li><a href="${root}/states/New-Hampshire/counties-New-Hampshire">New Hampshire</a></li>
					<li><a href="${root}/states/New-Jersey/counties-New-Jersey">New Jersey</a></li>
					<li><a href="${root}/states/New-Mexico/counties-New-Mexico">New Mexico</a></li>
					<li><a href="${root}/states/New-York/counties-New-York">New York</a></li>
					<li><a href="${root}/states/North-Carolina/counties-North-Carolina">North Carolina</a></li>
					<li><a href="${root}/states/North-Dakota/counties-North-Dakota">North Dakota</a></li>
					<li><a href="${root}/states/Ohio/counties-Ohio">Ohio</a></li>
					<li><a href="${root}/states/Oklahoma/counties-Oklahoma">Oklahoma</a></li>
					<li><a href="${root}/states/Oregon/counties-Oregon">Oregon</a></li>
					<li><a href="${root}/states/Pennsylvania/counties-Pennsylvania">Pennsylvania</a></li>
					<li><a href="${root}/states/Rhode-Island/counties-Rhode-Island">Rhode Island</a></li>
					<li><a href="${root}/states/South-Carolina/counties-South-Carolina">South Carolina</a></li>
					<li><a href="${root}/states/South-Dakota/counties-South-Dakota">South Dakota</a></li>
					<li><a href="${root}/states/Tennessee/counties-Tennessee">Tennessee</a></li>
					<li><a href="${root}/states/Texas/counties-Texas">Texas</a></li>
					<li><a href="${root}/states/Utah/counties-Utah">Utah</a></li>
					<li><a href="${root}/states/Vermont/counties-Vermont">Vermont</a></li>
					<li><a href="${root}/states/Virginia/counties-Virginia">Virginia</a></li>
					<li><a href="${root}/states/Washington/counties-Washington">Washington</a></li>
					<li><a href="${root}/states/West-Virginia/counties-West-Virginia">West Virginia</a></li>
					<li><a href="${root}/states/Wisconsin/counties-Wisconsin">Wisconsin</a></li>
					<li><a href="${root}/states/Wyoming/counties-Wyoming">Wyoming</a></li>
					<li><a href="${root}/states/Puerto-Rico/counties-Puerto-Rico">Puerto Rico</a></li>                 
                  <li role="separator" class="divider"></li>
                  
                </ul>
              </li>	
              
              		<li class=""><a href="http://censtat.com/content">US Population 2010-2014</a></li>
							
							</ul>
							
						</div>
					
			</div>
         
        </nav>
      </header>

	<script>	
		$(document).ready(function() {	
			console.log(document.title);
			if (document.title === 'Unites States Population 2010-2014') {
				console.log("Loading....Data");
				loadPopulationData("United States");
			}

		});
	</script>
	  
	

