package com.censtat.data.tools;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import com.censtat.data.implementation.DataEntity;
import com.censtat.data.interfaces.DataEntityTypeInterface;
import com.censtat.db.connect.MongoApp;
import com.censtat.ui.charts.DataEntityViewFactory;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class CenstatPageGenTool {
	
	private static CenstatPageGenTool singleton = null;		
	private MongoApp app = null;
	GsonBuilder builder = new GsonBuilder();
	Gson gson = builder.create();
	private HashMap<DataEntity,BreadCrumbTemplate> bcTemplateMap = new HashMap<DataEntity,BreadCrumbTemplate>();
	
	/**
	 * 
	 */
	private CenstatPageGenTool()
	{
		app = new MongoApp();
		try {
			app.createConnection();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static CenstatPageGenTool getInstance() {
		if (singleton != null) {
			return singleton;
		} else {

			synchronized (CenstatPageGenTool.class) {
				if (singleton == null) {
					singleton = new CenstatPageGenTool();
					return singleton;
				}
			}

		}
		return null;
	}
	
	public void buildPages()
	{		
		this.generateBreadCrumb();
		
	}
	
	public void testDriveModuleVisitors() {
		DBCollection coll = MongoApp.db.getCollection("DataEntity");
		DBCursor cursor = coll.find(new BasicDBObject("state", "California"));	
		Iterator<DBObject> dbIter = cursor.iterator();
		AgeSexModuleVisitor agesex = new AgeSexModuleVisitor();
		RaceModuleVisitor race = new RaceModuleVisitor();
		HispanicModuleVisitor hispanic = new HispanicModuleVisitor();
		ModuleSectionsStartVisitor startSection = new ModuleSectionsStartVisitor();
		ModuleSectionStopVisitor stopSection = new ModuleSectionStopVisitor();
		FileWriter stateWriter = null;
		try {
			 stateWriter = new FileWriter("ModuleSections.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		while (dbIter.hasNext()) {
			BasicDBObject o = (BasicDBObject) dbIter.next();
			DataEntity entity = gson.fromJson(JSON.serialize(o),
					DataEntity.class);
			startSection.visit(entity, stateWriter);
			agesex.visit(entity, stateWriter);
			race.visit(entity, stateWriter);
			hispanic.visit(entity, stateWriter);
			stopSection.visit(entity, stateWriter);
			try {
				stateWriter.flush();
				stateWriter.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	}
		
		
	
	

	
	/**
	 * This method generates link files to navigate to all the states
	 * All the Counties,Cities,Metros and Micros within each one of these states.
	 */
	
	private void generateBreadCrumb() {
		int loopCount=0;
		
		MVCControllerCodeTemplate mvcCodeTemplate = new MVCControllerCodeTemplate();
		EntityHolderTemplate stateTemplate = new EntityHolderTemplate();	
		HashMap<File,EntityHolderTemplate> forMetros = new HashMap<File,EntityHolderTemplate>();
		HashMap<File,EntityHolderTemplate> forMicros = new HashMap<File,EntityHolderTemplate>();
		HashMap<File,EntityHolderTemplate> forCounties = new HashMap<File,EntityHolderTemplate>();
		HashMap<File,EntityHolderTemplate> forCities= new HashMap<File,EntityHolderTemplate>();
		HashMap<String,File> forMetroFile = new HashMap<String,File>();
		HashMap<String,File> forMicroFile = new HashMap<String,File>();
		HashMap<String,File> forCountiesFile = new HashMap<String,File>();
		HashMap<String,File> forCitiesFile = new HashMap<String,File>();		
		File metroHolderFile = null;
		File microHolderFile = null;
		File citiesHolderFile = null;
		File countiesHolderFile = null;
		HashMap<DataEntity,String> metrosToAdd = new HashMap<DataEntity,String>();
		HashMap<DataEntity,String> microsToAdd = new HashMap<DataEntity,String>();
		HashMap<DataEntity,String> citiesToAdd = new HashMap<DataEntity,String>();
		HashMap<DataEntity,String> countiesToAdd = new HashMap<DataEntity,String>();
		
		String targetDir = System.getProperty("user.dir")
				+File.separator+"src"
				+File.separator+"main"
				+File.separator+"webapp"
				+File.separator+"WEB-INF"
				+File.separator+"views"
				+File.separator+"tiles"
				+File.separator+"states";
		CenPageCreationContext.getInstance().setCurrentWorkingDirectory(targetDir);		
		String tilesDir = System.getProperty("user.dir")
				+File.separator+"src"
				+File.separator+"main"
				+File.separator+"webapp"
				+File.separator+"WEB-INF"
				+File.separator+"views"
				+File.separator+"tiles";
		
		FileWriter writer = null;
		File fileToFlush = null;
		File stateFileToFlush = null;
		DBCollection coll = MongoApp.db.getCollection("DataEntity");
		DBCursor cursor = coll.find();
		//DBCursor cursor = coll.find(new BasicDBObject("state", "California"));
		System.out.println("The size of the Cursor is ----->"+cursor.size());
		Iterator<DBObject> dbIter = cursor.iterator();
		
		while (dbIter.hasNext()) {
			loopCount=loopCount + 1;
			String stateLink = null;
			BasicDBObject o = (BasicDBObject) dbIter.next();
			DataEntity entity = gson.fromJson(JSON.serialize(o),
					DataEntity.class);
		//	System.out.println(" Entity is "+entity.getName());
			BreadCrumbTemplate template = new BreadCrumbTemplate();
			
			template.addLink("Home", "/");			
			template.addLink("states", "/states");
			
			stateLink = "/states/" + this.getLinkName(entity.getState());
			File stateDir = new File(targetDir);			
			if (!stateDir.exists()) {
				stateDir.mkdir();
				// Put a states.jsp file here so it can link to all the states.
				File statesHolder = new File(tilesDir+File.separator+"states.jsp");
				stateFileToFlush = statesHolder;

				stateTemplate.addLink("Home", "/");
				stateTemplate.setActive("states");
				/*FIX ME --- CODE Needs to be REFACTORED */
				try {
					if(statesHolder.exists()) {
						statesHolder.delete();
					}
					statesHolder.createNewFile();
					// stateFileToFlush=statesHolder;
					mvcCodeTemplate.addLink("/states", "states",null,null);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			if (!entity.getDataEntityType().equals(
					DataEntityTypeInterface.STATE_TYPE)) {
				template.addLink(entity.getState(), stateLink);
				
			}
			if (entity.getDataEntityType().equals(
					DataEntityTypeInterface.STATE_TYPE)) {
		//		System.out.println(" Processing State Entity "+entity.getName());
				StatePageTemplate statePageTemplate = new StatePageTemplate();
				statePageTemplate.addLink("Home", "/");				
				statePageTemplate.addLink("states", "/states");		
				statePageTemplate.setActive(entity.getName());
				//statePageTemplate.addEntity(entity, null);
				statePageTemplate.addMetroLink("/states" + "/"+
						this.getLinkName(entity.getName())+"/"+"metros-"+this.getLinkName(entity.getName()));
				statePageTemplate.addMicroLink("/states"  + "/"+
						this.getLinkName(entity.getName())+"/"+"micros-"+this.getLinkName(entity.getName()));
				statePageTemplate.addCitiesLink("/states"  + "/"+
						this.getLinkName(entity.getName())+"/"+"cities-"+this.getLinkName(entity.getName()));
				statePageTemplate.addCountiesLink("/states"  + "/"+
						this.getLinkName(entity.getName())+"/"+"counties-"+this.getLinkName(entity.getName()));				
				stateTemplate.addEntity(entity,stateLink);				
				File stateFile = new File(stateDir.getPath() + File.separator
						+ this.getLinkName(entity.getName()).concat(".jsp"));
				
				
				
				metroHolderFile = new File(stateDir.getPath() + File.separator 
						+this.getLinkName(entity.getName())+File.separator+"metros-"+this.getLinkName(entity.getName()).concat(".jsp"));
				forMetroFile.put(entity.getState(),metroHolderFile);			
				EntityHolderTemplate metrosH = new EntityHolderTemplate();				
				metrosH.addLink("Home", "/");	
				metrosH.addLink("states", "/states");	
				metrosH.addLink(entity.getName(), "/states/"+this.getLinkName(entity.getName()));	
				metrosH.setActive("metros-"+this.getLinkName(entity.getName()));				
				forMetros.put(metroHolderFile, metrosH);
				mvcCodeTemplate.addLink("/states/"+this.getLinkName(entity.getName())+"/"+"metros-"+this.getLinkName(entity.getName()), "metros_"+this.getProperName(entity.getName()),null,null);
				
				microHolderFile = new File(stateDir.getPath() + File.separator 
						+this.getLinkName(entity.getName())+File.separator+"micros-"+this.getLinkName(entity.getName()).concat(".jsp"));
				forMicroFile.put(entity.getState(),microHolderFile);
				EntityHolderTemplate microsH = new EntityHolderTemplate();				
				microsH.addLink("Home", "/");	
				microsH.addLink("states", "/states");	
				microsH.addLink(entity.getName(), "/states/"+this.getLinkName(entity.getName()));	
				microsH.setActive("micros-"+this.getLinkName(entity.getName()));	
				
				forMicros.put(microHolderFile, microsH);		
				mvcCodeTemplate.addLink("/states/"+this.getLinkName(entity.getName())+"/"+"micros-"+this.getLinkName(entity.getName()), "micros_"+this.getProperName(entity.getName()),null,null);
				
				
				
				
				citiesHolderFile = new File(stateDir.getPath() + File.separator 
						+this.getLinkName(entity.getName())+File.separator+"cities-"+this.getLinkName(entity.getName()).concat(".jsp"));
				forCitiesFile.put(entity.getState(),citiesHolderFile);
				EntityHolderTemplate citiesH = new EntityHolderTemplate();				
				citiesH.addLink("Home", "/");	
				citiesH.addLink("states", "/states");	
				citiesH.addLink(entity.getName(), "/states/"+this.getLinkName(entity.getName()));	
				citiesH.setActive("cities-"+this.getLinkName(entity.getName()));						
				forCities.put(citiesHolderFile, citiesH);
				mvcCodeTemplate.addLink("/states/"+this.getLinkName(entity.getName())+"/"+"cities-"+this.getLinkName(entity.getName()), "cities_"+this.getProperName(entity.getName()),null,null);
				
								
				countiesHolderFile = new File(stateDir.getPath() + File.separator
						+this.getLinkName(entity.getName())+File.separator+"counties-"+this.getLinkName(entity.getName()).concat(".jsp"));
				forCountiesFile.put(entity.getState(),countiesHolderFile);
				EntityHolderTemplate countiesH = new EntityHolderTemplate();
				countiesH.addLink("Home", "/");	
				countiesH.addLink("states", "/states");	
				countiesH.addLink(entity.getName(), "/states/"+this.getLinkName(entity.getName()));	
				countiesH.setActive("counties-"+this.getLinkName(entity.getName()));			
				forCounties.put(countiesHolderFile, countiesH);	
				
				mvcCodeTemplate.addLink("/states/"+this.getLinkName(entity.getName())+"/"+"counties-"+this.getLinkName(entity.getName()), "counties_"+this.getProperName(entity.getName()),null,null);
				
				if (!stateFile.exists()) {
					try {
						stateFile.createNewFile();
						MustacheFactory statPageGen = new DefaultMustacheFactory();
						//Mustache mustache = statPageGen.compile("templates/statepage.tmpl");
						Mustache mustache = statPageGen.compile("templates"+File.separator+"statepage.tmpl");
						ModuleSectionsStartVisitor startSection = new ModuleSectionsStartVisitor();						
						FileWriter stateWriter = new FileWriter(stateFile);
						startSection.visit(entity, stateWriter);
						mustache.execute(stateWriter, statePageTemplate);
						stateWriter = DataModuleRef.getInstance().createModuleContent(entity, stateWriter);
						stateWriter.flush();
						stateWriter.close();																					
						
					} catch (IOException e) {					
						e.printStackTrace();
					}
				}
				
				String link = "/states/"+this.getLinkName(entity.getName());					
				mvcCodeTemplate.addLink(link, this.getProperName(entity.getName()),entity.getFipCode(),entity.getName());
				//mvcCodeTemplate.setEntityName(entity.getName());
				
			} 
			else if (entity.getDataEntityType().equals(
					DataEntityTypeInterface.CITY_TYPE)) {
			//	System.out.println(" Processing City Entity "+entity.getName());
				File cityDir = new File(targetDir
									+ File.separator + this.getLinkName(entity.getState())
									+ File.separator+ "cities");
				if (!cityDir.exists()) {
					cityDir.mkdirs();
				}
				template.addLink("cities", stateLink + "/" + "cities-"+this.getLinkName(entity.getState()));
				template.setActive(entity.getName());
				File cityFile = new File(cityDir.getPath() + File.separator
						+ this.getLinkName(entity.getName()).concat(".jsp"));

				if (!cityFile.exists()) {
					try {
						cityFile.createNewFile();
						fileToFlush=cityFile;
					} catch (IOException e) {					
						e.printStackTrace();
					}
				}
				String link = "/states/"+this.getLinkName(entity.getState())+"/cities/"+this.getLinkName(entity.getName());
				String active = this.getLinkName(entity.getName());				
				mvcCodeTemplate.addLink(link, this.getProperName(entity.getState())+entity.getDataEntityType()+SpecialCharTool.cleanAndReturn(active),entity.getFipCode(),entity.getName());
				//mvcCodeTemplate.setEntityName(entity.getName());
				//Get the right metro file.
				if(forCitiesFile.get(entity.getState())!=null)
				{
					EntityHolderTemplate entTmpl= forCities.get(forCitiesFile.get(entity.getState()));
					entTmpl.addEntity(entity, link);
				}
				else
				{
					citiesToAdd.put(entity,link);
				}
				
				

			} else if (entity.getDataEntityType().equals(
					DataEntityTypeInterface.COUNTY_TYPE)) {
				//System.out.println(" Processing County Entity "+entity.getName());

				template.addLink("Counties", stateLink + "/" + "counties-"+this.getLinkName(entity.getState()));
				template.setActive(entity.getName());

				File countyDir = new File(targetDir
						+ File.separator + this.getLinkName(entity.getState())
						+ File.separator + "counties");
				if (!countyDir.exists()) {
					countyDir.mkdirs();
				}

				File countyFile = new File(countyDir.getPath() + File.separator
						+ this.getLinkName(entity.getName()).concat(".jsp"));

				if (!countyFile.exists()) {
					try {
						countyFile.createNewFile();
						fileToFlush=countyFile;
					} catch (IOException e) {						
						e.printStackTrace();
					}
				}
				String link = "/states/"+this.getLinkName(entity.getState())+"/counties/"+this.getLinkName(entity.getName());
				String active = this.getLinkName(entity.getName());				
				mvcCodeTemplate.addLink(link, this.getProperName(entity.getState())+entity.getDataEntityType()+SpecialCharTool.cleanAndReturn(active),entity.getFipCode(),entity.getName());
				//mvcCodeTemplate.setEntityName(entity.getName());
				
				if(forCountiesFile.get(entity.getState())!=null)
				{
					EntityHolderTemplate entTmpl= forCounties.get(forCountiesFile.get(entity.getState()));
					entTmpl.addEntity(entity, link);
				}
				else
				{
					countiesToAdd.put(entity,link);
				}
			
			} else if (entity.getDataEntityType().equals(
					DataEntityTypeInterface.METRO_TYPE)) {						
				//System.out.println("Processing Metro Entity "+entity.getName());
				template.addLink("Metros", stateLink + "/" + "metros-"+this.getLinkName(entity.getState()));
				template.setActive(entity.getName());
				
				File metroDir = new File(targetDir 
						+ File.separator + this.getLinkName(entity.getState())
						+ File.separator + "metros");
				if (!metroDir.exists()) {
					metroDir.mkdirs();
				}

				File metroFile = new File(metroDir.getPath() + File.separator
						+ this.getLinkName(entity.getName()).concat(".jsp"));

				if (!metroFile.exists()) {
					try {
						metroFile.createNewFile();
						fileToFlush=metroFile;
					} catch (IOException e) {						
						e.printStackTrace();
					}
				}
				
				String link = "/states/"+this.getLinkName(entity.getState())+"/metros/"+this.getLinkName(entity.getName());
				String active = this.getLinkName(entity.getName());				
				mvcCodeTemplate.addLink(link, this.getProperName(entity.getState())+entity.getDataEntityType()+SpecialCharTool.cleanAndReturn(active),entity.getFipCode(),entity.getName());
				//mvcCodeTemplate.setEntityName(entity.getName());

				
				if(forMetroFile.get(entity.getState())!=null)
				{
					EntityHolderTemplate entTmpl= forMetros.get(forMetroFile.get(entity.getState()));
					entTmpl.addEntity(entity, link);
				}
				else
				{
					metrosToAdd.put(entity,link);
				}
				
				
			} else if (entity.getDataEntityType().equals(
					DataEntityTypeInterface.MICRO_TYPE)) {				
				//System.out.println(" Processing Micro Entity "+entity.getName());
				template.addLink("Micros", stateLink + "/" + "micros-"+this.getLinkName(entity.getState()));
				template.setActive(entity.getName());
				
				File microDir = new File(targetDir
						+ File.separator + this.getLinkName(entity.getState())
						+ File.separator + "micros");
				if (!microDir.exists()) {
					microDir.mkdirs();
				}

				File microFile = new File(microDir.getPath() + File.separator
						+ this.getLinkName(entity.getName()).concat(".jsp"));

				if (!microFile.exists()) {
					try {
						microFile.createNewFile();
						fileToFlush=microFile;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				String link = "/states/"+this.getLinkName(entity.getState())+"/micros/"+this.getLinkName(entity.getName());
				String active = this.getLinkName(entity.getName());				
				mvcCodeTemplate.addLink(link, this.getProperName(entity.getState())+entity.getDataEntityType()+SpecialCharTool.cleanAndReturn(active),entity.getFipCode(),entity.getName());
				//mvcCodeTemplate.setEntityName(entity.getName());
				
				if(forMicroFile.get(entity.getState())!=null)
				{
					EntityHolderTemplate entTmpl= forMicros.get(forMicroFile.get(entity.getState()));
					entTmpl.addEntity(entity, link);
				}
				else
				{
					microsToAdd.put(entity,link);
				}
				
			}
			if(fileToFlush!=null)
			{
				//System.out.println("Flushing file "+fileToFlush.getName());
				ModuleSectionsStartVisitor startSection = new ModuleSectionsStartVisitor();
				MustacheFactory mf = new DefaultMustacheFactory();
			//	Mustache mustache = mf.compile("templates/breadcrumb.tmpl");
				Mustache mustache = mf.compile("templates"+File.separator+"breadcrumb.tmpl");			
				
				try {
					if(fileToFlush!=null)
					{
						writer = new FileWriter(fileToFlush);
						startSection.visit(entity, writer);
						mustache.execute(writer, template);
						writer = DataModuleRef.getInstance().createModuleContent(entity, writer);
						writer.flush();
						writer.close();
						/* FIX ME */
						//Need to remove generation of content all together and focus on Module content
					}
					fileToFlush=null;				
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			

		}
	//	System.out.println("Checking if Metros are not NULL");
		if (!metrosToAdd.isEmpty()) {
			Set<Map.Entry<DataEntity, String>> set = metrosToAdd.entrySet();
			for (Map.Entry<DataEntity, String> me : set) {
				DataEntity entity = me.getKey();
				String link = me.getValue();
				EntityHolderTemplate entTmpl = forMetros.get(forMetroFile
						.get(entity.getState()));
				entTmpl.addEntity(entity, link);
			}
		}
		if (!microsToAdd.isEmpty()) {
			Set<Map.Entry<DataEntity, String>> set = microsToAdd.entrySet();
			for (Map.Entry<DataEntity, String> me : set) {
				DataEntity entity = me.getKey();
				String link = me.getValue();
				EntityHolderTemplate entTmpl = forMicros.get(forMicroFile
						.get(entity.getState()));
				entTmpl.addEntity(entity, link);
			}
		}
		if(!countiesToAdd.isEmpty())
		{
			Set<Map.Entry<DataEntity, String>> set = countiesToAdd.entrySet();
			for (Map.Entry<DataEntity, String> me : set) {
				DataEntity entity = me.getKey();
				String link = me.getValue();
				EntityHolderTemplate entTmpl = forCounties.get(forCountiesFile
						.get(entity.getState()));
				entTmpl.addEntity(entity, link);
			}
		}
		if(!citiesToAdd.isEmpty())
		{
			Set<Map.Entry<DataEntity, String>> set = citiesToAdd.entrySet();
			for (Map.Entry<DataEntity, String> me : set) {
				DataEntity entity = me.getKey();
				String link = me.getValue();
				EntityHolderTemplate entTmpl = forCities.get(forCitiesFile
						.get(entity.getState()));
				entTmpl.addEntity(entity, link);
			}
		}		
		generateMVCControllerCode(mvcCodeTemplate);
		generateStatesHolderFile(stateTemplate,stateFileToFlush);	
		generateHolderFilesForStates(forMetroFile,forMetros);
		generateHolderFilesForStates(forMicroFile,forMicros);
		generateHolderFilesForStates(forCitiesFile,forCities);
		generateHolderFilesForStates(forCountiesFile,forCounties);	
		CenModulePageCreator.getInstance().createModulePages();
		generateTilesCode(mvcCodeTemplate);

	}
	
	
	
	private void generateHolderFilesForStates(HashMap<String, File> stateToFile,
			HashMap<File, EntityHolderTemplate> fileToHolder) {
		MustacheFactory mf = new DefaultMustacheFactory();
		if (stateToFile.size() != fileToHolder.size()) {
			System.out.println("BIG PROGLEM DETECTED CANNOT PROCEED");
			return;
		}
		Set<Map.Entry<String, File>> set = stateToFile.entrySet();
		for (Map.Entry<String, File> me : set) {		
			File fileToFlush = me.getValue();
			EntityHolderTemplate template = fileToHolder.get(fileToFlush);
			// Mustache mustache = mf.compile("templates/states.tmpl");
			Mustache mustache = null;
			if (CenBuildContext.getInstance().getCurrentBuildContext().equals(CenBuildContext.STAGE)) {
				mustache = mf.compile("templates" + File.separator + "states_stage.tmpl");
			} else if (CenBuildContext.getInstance().getCurrentBuildContext().equals(CenBuildContext.PROD)) {
				mustache = mf.compile("templates" + File.separator + "states.tmpl");
			} else if (CenBuildContext.getInstance().getCurrentBuildContext().equals(CenBuildContext.TEST)) {
				mustache = mf.compile("templates" + File.separator + "states.tmpl");
			}
			try {
				fileToFlush.createNewFile();
				FileWriter stateWriter = new FileWriter(fileToFlush);
				mustache.execute(stateWriter, template).flush();
				stateWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void generateStatesHolderFile(EntityHolderTemplate statetemplate, File fileToWrite)
	{
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = null;
		if (CenBuildContext.getInstance().getCurrentBuildContext().equals(CenBuildContext.STAGE)) {
			mustache = mf.compile("templates" + File.separator + "states_stage.tmpl");
		} else if (CenBuildContext.getInstance().getCurrentBuildContext().equals(CenBuildContext.PROD)) {
			mustache = mf.compile("templates" + File.separator + "states.tmpl");
		} else if (CenBuildContext.getInstance().getCurrentBuildContext().equals(CenBuildContext.TEST)) {
			mustache = mf.compile("templates" + File.separator + "states.tmpl");
		}
		try {
			FileWriter stateWriter = new FileWriter(fileToWrite);
			mustache.execute(stateWriter, statetemplate).flush();
			stateWriter.close();
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	
	
	
	
	
	
	private void generateMVCControllerCode(MVCControllerCodeTemplate template)
	{
				
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = mf.compile("templates"+File.separator+"mvccontrollercode.tmpl");
		//Mustache mustache = mf.compile("templates/mvccontrollercode.tmpl");
		
		//Mustache mustache2 = mf.compile("templates/tiletemplate.tmpl");
		try {
		
			FileWriter controller = new FileWriter("HomeController.java");			
			mustache.execute(controller, template).flush();
			//Now Add the Module Stuff		
			controller.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void generateTilesCode(MVCControllerCodeTemplate template) {
		String tilesDir = System.getProperty("user.dir")
				+File.separator+"src"
				+File.separator+"main"
				+File.separator+"webapp"
				+File.separator+"WEB-INF"
				+File.separator+"spring";
				
			MustacheFactory mf = new DefaultMustacheFactory();
			Mustache mustache2 = mf.compile("templates"+File.separator+"tiletemplate.tmpl");
			try {
			FileWriter tileWriter = new FileWriter(tilesDir+File.separator+"tiles.xml");			
			
			//Now Add the Module Stuff
			String[] sourceFiles = { "AgeSexController.java", "AncestryController.java", "CitizenshipController.java",
					"ComputerUsageController.java", "EducationalAttainmentController.java", "FertilityController.java",
					"GrandParentsController.java", "HispanicOrLatinoController.java", "HouseHoldsByTypeController.java",
					"LanguagesSpokenController.java", "MaritialStatusController.java", "PlaceOfBirthController.java",
					"RaceController.java", "RelationShipsController.java", "SchoolEnrollmentController.java",
					"VeteranStatusController.java" };

			for (int i = 0; i < sourceFiles.length; i++) {
				ModuleControllerCodeTemplate conTemp =	CenModulePageCreator.getInstance().getControllerForJavaFile(sourceFiles[i]);
				System.out.println("Received the Following Controller --->"+conTemp.getControllerName());				
				ArrayList<link> links = conTemp.links();
				Iterator<link> iter = links.iterator();
				while(iter.hasNext()) {
					link l = iter.next();
					template.addLinkWithTitle(l.linkName, l.linkValue, l.fipCode, l.entityName, "Sample");					
				}
			}
			mustache2.execute(tileWriter, template).flush();
			tileWriter.close();		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	public String getProperName(String entityName)
	{
	if(entityName.contains("-"))
		{
			StringTokenizer hyphenChecker = new StringTokenizer(entityName,"-");
			entityName = SpecialCharTool.getStringFromHyphen(hyphenChecker);
		}
		StringTokenizer tokens = new StringTokenizer(entityName);
		String newString = "";
		if (tokens.countTokens() == 1) {
			return entityName;

		} else {
			while (tokens.hasMoreElements()) {
				String toCleanToken = tokens.nextToken();
				//check if Token has hyphen
				StringTokenizer hyphenChecker = new StringTokenizer(toCleanToken,"-");
				if(hyphenChecker.countTokens()>1)
				{
					System.out.println("We have Some cleanup to do");
					toCleanToken=SpecialCharTool.getStringFromHyphen(hyphenChecker);
				}
				String cleaned = "";
				if(toCleanToken.equals("-"))
				{
					newString = newString.concat("_");	
				}
				else
				{
					cleaned = SpecialCharTool.cleanAndReturn(toCleanToken);
					newString = newString.concat(cleaned);
				}		
						
				if (tokens.hasMoreElements()) {
					newString = newString.concat("_");
				}

			}
		}
		if(newString.endsWith("_"))
		{
			newString = newString.substring(0, newString.lastIndexOf("_"));
		}
		return newString.trim();
		
	}
	private String getLinkName(String entityName)
	{
		/*if(entityName.contains("-"))
		{
			StringTokenizer hyphenChecker = new StringTokenizer(entityName,"-");
			entityName = SpecialCharTool.getStringFromHyphen(hyphenChecker);
		}*/
		StringTokenizer tokens = new StringTokenizer(entityName);
		String newString = "";
		if (tokens.countTokens() == 1) {
			return entityName;

		} else {
			while (tokens.hasMoreElements()) {
				String toCleanToken = tokens.nextToken();
				//check if Token has hyphen
				/*StringTokenizer hyphenChecker = new StringTokenizer(toCleanToken,"-");
				if(hyphenChecker.countTokens()>1)
				{
					System.out.println("We have Some cleanup to do");
					toCleanToken=SpecialCharTool.getStringFromHyphen(hyphenChecker);
				}*/
				String cleaned = "";
				if(toCleanToken.equals("-"))
				{
					newString = newString.concat("-");	
				}
				else
				{
					cleaned = SpecialCharTool.cleanAndReturn(toCleanToken);
					newString = newString.concat(cleaned);
				}		
						
				if (tokens.hasMoreElements()) {
					newString = newString.concat("-");
				}

			}
		}
		if(newString.endsWith("-"))
		{
			newString = newString.substring(0, newString.lastIndexOf("-"));
		}
		return newString.trim();
		
	}

	class BreadCrumbTemplate {
		ArrayList<link> links = new ArrayList<link>();
		private String activeLink = null;

		public List<link> links() {
			return links;
		}

		public void setActive(String active) {
			this.activeLink = active;
		}

		public String active() {
			return this.activeLink;
		}

		public void addLink(String name, String value) {
			link l = new link(name, value);
			this.links.add(l);
		}

		class link {
			String linkName = null;
			String linkValue = null;

			public link(String name, String value) {
				this.linkName = name;
				this.linkValue = value;
			}

		}

	}
	
	class EntityHolderTemplate extends BreadCrumbTemplate{		
		ArrayList<EntityObject> entities = new ArrayList<EntityObject>();
		
		public List<EntityObject> entities() {
			return this.entities;
		}
		
		
		public void addEntity(DataEntity entity, String link)
		{
			EntityObject object = new EntityObject(entity,link);
			entities.add(object);
		}
		class EntityObject{	
			private DataEntity entity = null;
			 String entityname = null;
			 String entitypopulation = null;
			 String avefamilysize = null;	
			 String entitylink = null;
			 String bachelorsorhigher = null;
			 String malepercent = null;
			 String femalepercent = null;
			 String medianage = null;
			 String hispanic = null;
			private KeyGenTemplateFile keyFile = new KeyGenTemplateFile();
			
			public EntityObject(DataEntity entity, String link)
			{
				this.entity=entity;
				this.keyFile.setKeyMap((HashMap<String,String>) entity.getItentifierKeys());	
				this.entityname = entity.getName();
				this.entitypopulation = keyFile.value_total_population();	
				this.bachelorsorhigher=keyFile.value_educational_attainment_per_bachelors_higher();
				this.malepercent=keyFile.value_total_population_male();
				this.femalepercent=keyFile.value_total_population_female();
				this.medianage=keyFile.value_median_age_in_years();
				this.hispanic=keyFile.value_hispanic_or_latino_any_race();
				this.avefamilysize=keyFile.value_ave_fam_size();
				this.entitylink=link;				
			}			
			
		}
		
		
	}
	
	
	class StatePageTemplate extends EntityHolderTemplate {
		String metroLink = null;
		String microLink = null;
		String citiesLink = null;
		String countiesLink = null;

		public void addMetroLink(String metroLink) {
			this.metroLink=metroLink;
		}
		public String metrolink()
		{
			return metroLink;
		}			

		public void addMicroLink(String microLink) {
			this.microLink=microLink;
		}
		
		public String microlink()
		{
			return microLink;
		}

		public void addCitiesLink(String citiesLink) {
			this.citiesLink=citiesLink;
		}
		
		public String citieslink()
		{
			return this.citiesLink;
		}

		public void addCountiesLink(String countiesLink) {
			this.countiesLink=countiesLink;
		}
		
		public String countieslink()
		{
			return this.countiesLink;
		}

	}
	
	
	class MVCControllerCodeTemplate {		
		ArrayList<link> links = new ArrayList<link>();
		String fipCode = null;	
		public ArrayList<link> links() {
			return links;
		}
		
			
		
		/**
		 * 
		 * @param linkName
		 * @param linkValue
		 * @param fip
		 * @param en
		 */
		public void addLink(String linkName, String linkValue, String fip,String en){
			link l = new link(linkName, linkValue,fip,en);
			this.links.add(l);
			
		}
		/**
		 * 
		 * @param linkName
		 * @param linkValue
		 * @param fip
		 * @param en
		 * @param title
		 */
		public void addLinkWithTitle(String linkName, String linkValue , String fip, String en, String title ) {
			link l = new link(linkName, linkValue,fip,en,title);
			this.links.add(l);
			
		}
		
	}


		class link {
			String linkName = null;
			String linkValue = null;
			String fipCode = null;
			String entityName = "";
			String title = "";

			public link(String name, String value, String fip, String en) {
				this.linkName = name;
				this.linkValue = value;
				this.fipCode = fip;
				this.entityName=en;
			}
			
			public link(String name, String value, String fip, String en,String title) {
				this.linkName = name;
				this.linkValue = value;
				this.fipCode = fip;
				this.entityName=en;
				this.title=title;
			}
			
			

		}
	
	class ModuleControllerCodeTemplate extends MVCControllerCodeTemplate {
		String controllerName = null;
		
		public ModuleControllerCodeTemplate(String controllerName) {
			this.controllerName=controllerName;
		}

		public void setControllerName(String controllerName) {
			this.controllerName = controllerName;
		}

		public String getControllerName() {
			return this.controllerName;
		}

		

	}
	
	
	/**
	 * The Main Method to Run the Program
	 * @param args
	 */
	public static void main(String[] args) {
		boolean shouldExit = true;
		if (args[0].equals(CenBuildContext.PROD)) {
			shouldExit=false;
			CenBuildContext.getInstance().setBuildContext(CenBuildContext.PROD);
		} else if (args[0].equals(CenBuildContext.STAGE)) {
			shouldExit=false;
			CenBuildContext.getInstance().setBuildContext(CenBuildContext.STAGE);
		} else if (args[0].equals(CenBuildContext.TEST)) {
			shouldExit=false;
			CenBuildContext.getInstance().setBuildContext(CenBuildContext.TEST);
		}
		if(shouldExit){
			System.exit(0);
		}
		System.out.println("Current Build Context---->"+CenBuildContext.getInstance().getCurrentBuildContext());
		CenstatPageGenTool tool = CenstatPageGenTool.getInstance();
		tool.buildPages();
		DataEntityViewFactory.getInstance().storeViewData();
	}

}
