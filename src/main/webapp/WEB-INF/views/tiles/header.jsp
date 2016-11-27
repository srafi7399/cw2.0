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
        <script type="text/javascript">
		var CONTEXT_ROOT = '<%= request.getContextPath() %>';
		</script>
        <nav class="navbar navbar-static-top" role="navigation">
        
         <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
        
             <div class="row">
		
						<div>
							<ul class="nav navbar-nav">
								<li class=""><a href=${CONTEXT_ROOT}>Home</a></li>	
								<li class=""><a href="${requestScope['javax.servlet.forward.request_uri']}states">States Data</a></li>	
							
								 <li class="dropdown">
                <a href="http://censtat.com/states/Arkansas#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Metros Data <span class="caret"></span></a>
                <ul class="dropdown-menu">                 
                  										
					
				<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Alabama/metros-Alabama">Alabama</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Alaska/metros-Alaska">Alaska</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Arizona/metros-Arizona">Arizona</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Arkansas/metros-Arkansas">Arkansas</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/California/metros-California">California</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Colorado/metros-Colorado">Colorado</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Connecticut/metros-Connecticut">Connecticut</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Delaware/metros-Delaware">Delaware</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/District-of-Columbia/metros-District-of-Columbia">District of Columbia</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Florida/metros-Florida">Florida</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Georgia/metros-Georgia">Georgia</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Hawaii/metros-Hawaii">Hawaii</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Idaho/metros-Idaho">Idaho</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Illinois/metros-Illinois">Illinois</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Indiana/metros-Indiana">Indiana</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Iowa/metros-Iowa">Iowa</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Kansas/metros-Kansas">Kansas</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Kentucky/metros-Kentucky">Kentucky</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Louisiana/metros-Louisiana">Louisiana</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Maine/metros-Maine">Maine</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Maryland/metros-Maryland">Maryland</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Massachusetts/metros-Massachusetts">Massachusetts</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Michigan/metros-Michigan">Michigan</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Minnesota/metros-Minnesota">Minnesota</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Mississippi/metros-Mississippi">Mississippi</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Missouri/metros-Missouri">Missouri</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Montana/metros-Montana">Montana</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Nebraska/metros-Nebraska">Nebraska</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Nevada/metros-Nevada">Nevada</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/New-Hampshire/metros-New-Hampshire">New Hampshire</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/New-Jersey/metros-New-Jersey">New Jersey</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/New-Mexico/metros-New-Mexico">New Mexico</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/New-York/metros-New-York">New York</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/North-Carolina/metros-North-Carolina">North Carolina</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/North-Dakota/metros-North-Dakota">North Dakota</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Ohio/metros-Ohio">Ohio</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Oklahoma/metros-Oklahoma">Oklahoma</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Oregon/metros-Oregon">Oregon</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Pennsylvania/metros-Pennsylvania">Pennsylvania</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Rhode-Island/metros-Rhode-Island">Rhode Island</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/South-Carolina/metros-South-Carolina">South Carolina</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/South-Dakota/metros-South-Dakota">South Dakota</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Tennessee/metros-Tennessee">Tennessee</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Texas/metros-Texas">Texas</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Utah/metros-Utah">Utah</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Vermont/metros-Vermont">Vermont</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Virginia/metros-Virginia">Virginia</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Washington/metros-Washington">Washington</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/West-Virginia/metros-West-Virginia">West Virginia</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Wisconsin/metros-Wisconsin">Wisconsin</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Wyoming/metros-Wyoming">Wyoming</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}states/Puerto-Rico/metros-Puerto-Rico">Puerto Rico</a></li>
					 <li role="separator" class="divider"></li>
					         
                 
                </ul>
              </li>		
								
								
								 <li class="dropdown">
                <a href="http://censtat.com/states/Arkansas#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cities Data <span class="caret"></span></a>
                <ul class="dropdown-menu">    
					
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Alabama/cities-Alabama">Alabama</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Alaska/cities-Alaska">Alaska</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Arizona/cities-Arizona">Arizona</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Arkansas/cities-Arkansas">Arkansas</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/California/cities-California">California</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Colorado/cities-Colorado">Colorado</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Connecticut/cities-Connecticut">Connecticut</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Delaware/cities-Delaware">Delaware</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/District-of-Columbia/cities-District-of-Columbia">District of Columbia</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Florida/cities-Florida">Florida</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Georgia/cities-Georgia">Georgia</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Hawaii/cities-Hawaii">Hawaii</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Idaho/cities-Idaho">Idaho</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Illinois/cities-Illinois">Illinois</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Indiana/cities-Indiana">Indiana</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Iowa/cities-Iowa">Iowa</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Kansas/cities-Kansas">Kansas</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Kentucky/cities-Kentucky">Kentucky</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Louisiana/cities-Louisiana">Louisiana</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Maine/cities-Maine">Maine</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Maryland/cities-Maryland">Maryland</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Massachusetts/cities-Massachusetts">Massachusetts</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Michigan/cities-Michigan">Michigan</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Minnesota/cities-Minnesota">Minnesota</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Mississippi/cities-Mississippi">Mississippi</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Missouri/cities-Missouri">Missouri</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Montana/cities-Montana">Montana</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Nebraska/cities-Nebraska">Nebraska</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Nevada/cities-Nevada">Nevada</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/New-Hampshire/cities-New-Hampshire">New Hampshire</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/New-Jersey/cities-New-Jersey">New Jersey</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/New-Mexico/cities-New-Mexico">New Mexico</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/New-York/cities-New-York">New York</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/North-Carolina/cities-North-Carolina">North Carolina</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/North-Dakota/cities-North-Dakota">North Dakota</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Ohio/cities-Ohio">Ohio</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Oklahoma/cities-Oklahoma">Oklahoma</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Oregon/cities-Oregon">Oregon</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Pennsylvania/cities-Pennsylvania">Pennsylvania</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Rhode-Island/cities-Rhode-Island">Rhode Island</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/South-Carolina/cities-South-Carolina">South Carolina</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/South-Dakota/cities-South-Dakota">South Dakota</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Tennessee/cities-Tennessee">Tennessee</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Texas/cities-Texas">Texas</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Utah/cities-Utah">Utah</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Vermont/cities-Vermont">Vermont</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Virginia/cities-Virginia">Virginia</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Washington/cities-Washington">Washington</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/West-Virginia/cities-West-Virginia">West Virginia</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Wisconsin/cities-Wisconsin">Wisconsin</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Wyoming/cities-Wyoming">Wyoming</a></li>
						<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Puerto-Rico/cities-Puerto-Rico">Puerto Rico</a></li>
					 <li role="separator" class="divider"></li>
                </ul>
              </li>		
								
							
								 <li class="dropdown">
                <a href="http://censtat.com/states/Arkansas#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Counties Data <span class="caret"></span></a>
                <ul class="dropdown-menu">                  

					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Alabama/counties-Alabama">Alabama</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Alaska/counties-Alaska">Alaska</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Arizona/counties-Arizona">Arizona</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Arkansas/counties-Arkansas">Arkansas</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/California/counties-California">California</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Colorado/counties-Colorado">Colorado</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Connecticut/counties-Connecticut">Connecticut</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Delaware/counties-Delaware">Delaware</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/District-of-Columbia/counties-District-of-Columbia">District of Columbia</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Florida/counties-Florida">Florida</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Georgia/counties-Georgia">Georgia</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Hawaii/counties-Hawaii">Hawaii</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Idaho/counties-Idaho">Idaho</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Illinois/counties-Illinois">Illinois</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Indiana/counties-Indiana">Indiana</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Iowa/counties-Iowa">Iowa</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Kansas/counties-Kansas">Kansas</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Kentucky/counties-Kentucky">Kentucky</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Louisiana/counties-Louisiana">Louisiana</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Maine/counties-Maine">Maine</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Maryland/counties-Maryland">Maryland</a></li>
					<li><a href="/states/Massachusetts/counties-Massachusetts">Massachusetts</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Michigan/counties-Michigan">Michigan</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Minnesota/counties-Minnesota">Minnesota</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Mississippi/counties-Mississippi">Mississippi</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Missouri/counties-Missouri">Missouri</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Montana/counties-Montana">Montana</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Nebraska/counties-Nebraska">Nebraska</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Nevada/counties-Nevada">Nevada</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/New-Hampshire/counties-New-Hampshire">New Hampshire</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/New-Jersey/counties-New-Jersey">New Jersey</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/New-Mexico/counties-New-Mexico">New Mexico</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/New-York/counties-New-York">New York</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/North-Carolina/counties-North-Carolina">North Carolina</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/North-Dakota/counties-North-Dakota">North Dakota</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Ohio/counties-Ohio">Ohio</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Oklahoma/counties-Oklahoma">Oklahoma</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Oregon/counties-Oregon">Oregon</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Pennsylvania/counties-Pennsylvania">Pennsylvania</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Rhode-Island/counties-Rhode-Island">Rhode Island</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/South-Carolina/counties-South-Carolina">South Carolina</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/South-Dakota/counties-South-Dakota">South Dakota</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Tennessee/counties-Tennessee">Tennessee</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Texas/counties-Texas">Texas</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Utah/counties-Utah">Utah</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Vermont/counties-Vermont">Vermont</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Virginia/counties-Virginia">Virginia</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Washington/counties-Washington">Washington</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/West-Virginia/counties-West-Virginia">West Virginia</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Wisconsin/counties-Wisconsin">Wisconsin</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Wyoming/counties-Wyoming">Wyoming</a></li>
					<li><a href="${requestScope['javax.servlet.forward.request_uri']}/states/Puerto-Rico/counties-Puerto-Rico">Puerto Rico</a></li>                 
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
	  
	

