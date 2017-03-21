package com.censtat.data.tools;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import org.apache.commons.io.FileUtils;
import com.censtat.data.implementation.DataEntity;
import com.censtat.data.tools.CenstatPageGenTool.ModuleControllerCodeTemplate;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import com.censtat.data.interfaces.DataEntityTypeInterface;

/**
 * 
 * @author RafiS1
 *
 */
public class CenModulePageCreator {
	
	private ArrayList<CenModuleInfoObject> moduleInfoHolder = new ArrayList<CenModuleInfoObject>();

	public static final String MODULE_AGE_SEX_TYPE = "Age and Sex Relationships";
	public static final String MODULE_RACE_TYPE = "Races";
	public static final String MODULE_HISPANIC_LATINO = "Hispanic or Latino";
	public static final String MODULE_HOUSEHOLDS_BY_TYPE = "House Holds By Type";
	public static final String MODULE_RELATIONSHIP = "Relationships";
	public static final String MODULE_MARITIAL_STATUS = "Maritial Status ";
	public static final String MODULE_FERTILITY = "Fertility";
	public static final String MODULE_GRANDPARENTS = "Grand Parents";
	public static final String MODULE_SCHOOLENROLLMENT = "School Enrollment";
	public static final String MODULE_EDUCATIONALATTAINMENT = "Educational Attainment";
	public static final String MODULE_VETERAN_STATUS = "Veteran Status";
	public static final String MODULE_PLACEOFBIRTH = "Place Of Birth";
	public static final String MODULE_USCITIZENSHIP = "US Citizenship";
	public static final String MODULE_LANGUAGES_SPOKEN = "Languages Spoken";
	public static final String MODULE_ANCESTRY = "Ancestry";
	public static final String MODULE_COMPUTER_USAGE = "Computer Usage ";
	private ModuleControllerCodeTemplate forAgeSexController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("AgeSexController");
	private ModuleControllerCodeTemplate forAncestryController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("AncestryController");
	private ModuleControllerCodeTemplate forCitizenshipController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("CitizenshipController");
	private ModuleControllerCodeTemplate forComputerUsageController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("ComputerUsageController");
	private ModuleControllerCodeTemplate forEducationalAttainmentController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("EducationalAttainmentController");
	private ModuleControllerCodeTemplate forFertilityController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("FertilityController");
	private ModuleControllerCodeTemplate forGrandParentsController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("GrandParentsController");
	private ModuleControllerCodeTemplate forHispanicOrLatinoController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("HispanicOrLatinoController");
	private ModuleControllerCodeTemplate forHouseHoldsByTypeController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("HouseHoldsByTypeController");
	private ModuleControllerCodeTemplate forLanguagesSpokenController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("LanguagesSpokenController");
	private ModuleControllerCodeTemplate forMaritialStatusController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("MaritialStatusController");
	private ModuleControllerCodeTemplate forPlaceOfBirthController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("PlaceOfBirthController");
	private ModuleControllerCodeTemplate forRaceController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("RaceController");
	private ModuleControllerCodeTemplate forRelationShipsController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("RelationShipsController");
	private ModuleControllerCodeTemplate forSchoolEnrollmentController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("SchoolEnrollmentController");
	private ModuleControllerCodeTemplate forVeteranStatusController = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("VeteranStatusController");

	/* Singleton Instance */
	private static CenModulePageCreator singleton = null;

	/* Private Constructor */
	private CenModulePageCreator() {

	}

	/**
	 * Public method to return the Build Context
	 * 
	 * @return
	 */
	public static CenModulePageCreator getInstance() {
		if (singleton == null) {
			synchronized (CenModulePageCreator.class) {
				if (singleton == null) {
					singleton = new CenModulePageCreator();
				}
			}
		}
		return singleton;
	}
	
	/**
	 * 
	 * @param type
	 * @param fileName
	 * @param entity
	 */
	public void addModuleInfo(String type, String fileName, DataEntity entity){
		CenModuleInfoObject infoObject = new CenModuleInfoObject(type,fileName,entity);
		this.moduleInfoHolder.add(infoObject);
	}
	
	private String getPageName(String type) {
		if (type.equals(MODULE_AGE_SEX_TYPE)) {
			return "Age-Sex.jsp";
		} else if (type.equals(MODULE_RACE_TYPE)) {
			return "Race.jsp";
		} else if (type.equals(MODULE_ANCESTRY)) {
			return "Ancestry.jsp";
		} else if (type.equals(MODULE_COMPUTER_USAGE)) {
			return "Computer-Usage.jsp";
		} else if (type.equals(MODULE_EDUCATIONALATTAINMENT)) {
			return "Educational-Attainment.jsp";
		} else if (type.equals(MODULE_FERTILITY)) {
			return "Fertility.jsp";
		} else if (type.equals(MODULE_GRANDPARENTS)) {
			return "Grand-Parents.jsp";
		} else if (type.equals(MODULE_HISPANIC_LATINO)) {
			return "Hispanic-Latino.jsp";
		} else if (type.equals(MODULE_HOUSEHOLDS_BY_TYPE)) {
			return "HouseHolds-ByType.jsp";
		}else if(type.equals(MODULE_LANGUAGES_SPOKEN)){
			return "Languages-Spoken.jsp";
		}else if(type.equals(MODULE_MARITIAL_STATUS)){
			return "Maritial-Status.jsp";
		}else if(type.equals(MODULE_PLACEOFBIRTH)){
			return "Place-Of-Birth.jsp";
		}else if(type.equals(MODULE_RELATIONSHIP)){
			return "Relationships.jsp";
		}else if(type.equals(MODULE_SCHOOLENROLLMENT)){
			return "School-Enrollment.jsp";
		}else if(type.equals(MODULE_USCITIZENSHIP)){
			return "US-Citizenship.jsp";
		}else if(type.equals(MODULE_VETERAN_STATUS)){
			return "Veteran-Status.jsp";
		}
		return null;
	}
	
	public String getLinkName(String entityName)
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
	
	private String getTemplateFile(String type) {		
		if (type.equals(MODULE_AGE_SEX_TYPE)) {
			if (CenBuildContext.getInstance().getCurrentBuildContext().equals(CenBuildContext.STAGE)) {
			return "sexandage_stage.tmpl";
		}
			return "sexandage.tmpl";				
		}else if (type.equals(MODULE_RACE_TYPE)) {
			return "race.tmpl";
		} else if (type.equals(MODULE_ANCESTRY)) {
			return "ancestry.tmpl";
		} else if (type.equals(MODULE_COMPUTER_USAGE)) {
			return "computers.tmpl";
		} else if (type.equals(MODULE_EDUCATIONALATTAINMENT)) {
			return "educationalattainment.tmpl";
		} else if (type.equals(MODULE_FERTILITY)) {
			return "fertility.tmpl";
		} else if (type.equals(MODULE_GRANDPARENTS)) {
			return "grandparents.tmpl";
		} else if (type.equals(MODULE_HISPANIC_LATINO)) {
			return "hispanicorlatino.tmpl";
		} else if (type.equals(MODULE_HOUSEHOLDS_BY_TYPE)) {
			return "householdsbytype.tmpl";
		}else if(type.equals(MODULE_LANGUAGES_SPOKEN)){
			return "language.tmpl";
		}else if(type.equals(MODULE_MARITIAL_STATUS)){
			return "maritialstatus.tmpl";
		}else if(type.equals(MODULE_PLACEOFBIRTH)){
			return "birthplace.tmpl";
		}else if(type.equals(MODULE_RELATIONSHIP)){
			return "relationship.tmpl";
		}else if(type.equals(MODULE_SCHOOLENROLLMENT)){
			return "schoolenrollment.tmpl";
		}else if(type.equals(MODULE_USCITIZENSHIP)){
			return "citizenship.tmpl";
		}else if(type.equals(MODULE_VETERAN_STATUS))	{
			return "veterans.tmpl";
		}
		System.out.println("This should not Happen -->"+type);
		return null;
	}

	private String getLinkValue(DataEntity entity) {
		//Add Exception to State
		if(entity.getDataEntityType().equals(DataEntityTypeInterface.STATE_TYPE)) {
			System.out.println("This should not Happen"+entity.getName());
			String linkValue = CenstatPageGenTool.getInstance().getProperName(SpecialCharTool.cleanAndReturn(this.getLinkName(entity.getName())));
			return linkValue;
		}
		return CenstatPageGenTool.getInstance().getProperName(entity.getState()) + entity.getDataEntityType()
				+ SpecialCharTool.cleanAndReturn(this.getLinkName(entity.getName()));
	}
	
	/**
	 * 
	 * @param toCreate
	 * @param type
	 * @param entity
	 */
	private void populateControllerTemplates(String toCreate, String type, DataEntity entity) {
		if (type.equals(MODULE_AGE_SEX_TYPE)) {
			this.forAgeSexController.addLink(toCreate + "/Age-Sex", getLinkValue(entity)+"AgeSex", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_RACE_TYPE)) {
			this.forRaceController.addLink(toCreate + "/Race", getLinkValue(entity)+"Race", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_ANCESTRY)) {
			this.forAncestryController.addLink(toCreate + "/Ancestry", getLinkValue(entity)+"Ancestry", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_COMPUTER_USAGE)) {
			this.forComputerUsageController.addLink(toCreate + "/Computer-Usage", getLinkValue(entity)+"ComputerUsage", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_EDUCATIONALATTAINMENT)) {
			this.forEducationalAttainmentController.addLink(toCreate + "/Educational-Attainment", getLinkValue(entity)+"EAttainment", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_FERTILITY)) {
			this.forFertilityController.addLink(toCreate + "/Fertility", getLinkValue(entity)+"Fertility", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_GRANDPARENTS)) {
			this.forGrandParentsController.addLink(toCreate + "/Grand-Parents", getLinkValue(entity)+"GrandParents", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_HISPANIC_LATINO)) {
			this.forHispanicOrLatinoController.addLink(toCreate + "/Hispanic-Latino", getLinkValue(entity)+"HispanicLatino", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_HOUSEHOLDS_BY_TYPE)) {
			this.forHouseHoldsByTypeController.addLink(toCreate + "/HouseHolds-ByType", getLinkValue(entity)+"HousesByType", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_LANGUAGES_SPOKEN)) {
			this.forLanguagesSpokenController.addLink(toCreate + "/Languages-Spoken", getLinkValue(entity)+"Languages", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_MARITIAL_STATUS)) {
			this.forMaritialStatusController.addLink(toCreate + "/Maritial-Status", getLinkValue(entity)+"MaritialStatus", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_PLACEOFBIRTH)) {
			this.forPlaceOfBirthController.addLink(toCreate + "/Place-Of-Birth", getLinkValue(entity)+"PlaceOfBirth", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_RELATIONSHIP)) {
			this.forRelationShipsController.addLink(toCreate + "/Relationships", getLinkValue(entity)+"RelationShip", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_SCHOOLENROLLMENT)) {
			this.forSchoolEnrollmentController.addLink(toCreate + "/School-Enrollment", getLinkValue(entity)+"SchoolEnrollement", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_USCITIZENSHIP)) {
			this.forCitizenshipController.addLink(toCreate + "/US-Citizenship", getLinkValue(entity)+"uscitizenship", entity.getFipCode(),
					entity.getName());
		} else if (type.equals(MODULE_VETERAN_STATUS)) {
			this.forVeteranStatusController.addLink(toCreate + "/Veteran-Status", getLinkValue(entity)+"veteranstatus", entity.getFipCode(),
					entity.getName());
		}
	}



	public void createModulePages() {
		String tilesDir = System.getProperty("user.dir")
				+File.separator+"src"
				+File.separator+"main"
				+File.separator+"webapp"
				+File.separator+"WEB-INF"
				+File.separator+"views"
				+File.separator+"tiles";
		int count = 0;
		KeyGenTemplateFile template = new KeyGenTemplateFile();
		File directory = null;
		File fileToCreate = null;
		FileWriter writer = null;
		Iterator<CenModuleInfoObject> iter = this.moduleInfoHolder.iterator();
		while(iter.hasNext()) {
			System.out.println("**********Creating the Module Pages**********"+count++);			
			CenModuleInfoObject object = iter.next();
			String fileName = object.getFileNameToCreate();
			String type = object.getTypeOfModule();
			DataEntity entity = object.getDataEntity();
			populateControllerTemplates(fileName,type,entity);
			template.setKeyMap(entity.getItentifierKeys());			
			directory = new File(tilesDir+fileName);
			if(!directory.exists()) {
				try{
					directory.mkdir();
				} catch(Exception e) {
					System.out.println(e);					
				}
			}			
			fileToCreate = new File(directory+File.separator+getPageName(type));
			if(!fileToCreate.exists()) {
				try {
					fileToCreate.createNewFile();
				}catch(Exception e) {
					System.out.println(e);
				}
			}
			NestedModuleSectionsStartVisitor startSection = new NestedModuleSectionsStartVisitor();
			ModuleSectionStopVisitor stopSection = new ModuleSectionStopVisitor();
			MustacheFactory bct = new DefaultMustacheFactory();			
			Mustache mus = bct.compile("templates"+File.separator+"breadcrumb.tmpl");
			MustacheFactory mf = new DefaultMustacheFactory();				
			Mustache mustache = mf.compile("templates"+File.separator+this.getTemplateFile(type));
			try {
				writer = new FileWriter(fileToCreate);
				startSection.visit(entity, writer);
				mus.execute(writer,this.generateBreadCrumb(entity,type));
				mustache.execute(writer, template);	
				stopSection.visit(entity, writer);
				writer.flush();
				writer.close();
				
			}catch(Exception e) {
				System.out.println(e);
				
			}			
			
		}
		//Create the MVC Controller Code
		generateControllerComponents();
	}
	
	public ModuleControllerCodeTemplate getControllerForJavaFile(String fileName) {
		
		if (fileName.equals("AgeSexController.java")) {
			return this.forAgeSexController;

		} else if (fileName.equals("AncestryController.java")) {
			return this.forAncestryController;

		} else if (fileName.equals("CitizenshipController.java")) {
			return this.forCitizenshipController;

		} else if (fileName.equals("ComputerUsageController.java")) {
			return this.forComputerUsageController;

		} else if (fileName.equals("EducationalAttainmentController.java")) {
			return this.forEducationalAttainmentController;

		} else if (fileName.equals("GrandParentsController.java")) {
			return this.forGrandParentsController;

		} else if (fileName.equals("HispanicOrLatinoController.java")) {
			return this.forHispanicOrLatinoController;

		} else if (fileName.equals("HouseHoldsByTypeController.java")) {
			return this.forHouseHoldsByTypeController;

		} else if (fileName.equals("LanguagesSpokenController.java")) {
			return this.forLanguagesSpokenController;

		} else if (fileName.equals("MaritialStatusController.java")) {
			return this.forMaritialStatusController;

		} else if (fileName.equals("PlaceOfBirthController.java")) {
			return this.forPlaceOfBirthController;

		} else if (fileName.equals("RaceController.java")) {
			return this.forRaceController;

		} else if (fileName.equals("RelationShipsController.java")) {
			return this.forRelationShipsController;

		} else if (fileName.equals("SchoolEnrollmentController.java")) {
			return this.forSchoolEnrollmentController;

		} else if (fileName.equals("VeteranStatusController.java")) {
			return this.forVeteranStatusController;
		}
		else if(fileName.equals("FertilityController.java")) {
			return this.forFertilityController;
		}
		return null;
	}
	
	/**
	 * A method to return the Title for each of the Module Pages
	 * @param moduleName
	 * @return
	 */
	public String getTitleForModulePage(String fileName) {
		if (fileName.equals("AgeSexController.java")) {
			return "Age Details of the population of ";

		} else if (fileName.equals("AncestryController.java")) {
			return "Ancestry of the population of ";

		} else if (fileName.equals("CitizenshipController.java")) {
			return "Citizenship of the population of ";

		} else if (fileName.equals("ComputerUsageController.java")) {
			return "Computer Usage for the population of ";

		} else if (fileName.equals("EducationalAttainmentController.java")) {
			return "Educational Attainment for the Population of ";

		} else if (fileName.equals("GrandParentsController.java")) {
			return "Grandparents for the population of " ;

		} else if (fileName.equals("HispanicOrLatinoController.java")) {
			return "Hispanics or Latinos for the population of ";

		} else if (fileName.equals("HouseHoldsByTypeController.java")) {
			return "Households for the population of ";

		} else if (fileName.equals("LanguagesSpokenController.java")) {
			return "Languages Spoken for the population of ";

		} else if (fileName.equals("MaritialStatusController.java")) {
			return "Maritial Status for the population of ";

		} else if (fileName.equals("PlaceOfBirthController.java")) {
			return "Place of Birth data for the population of ";

		} else if (fileName.equals("RaceController.java")) {
			return "Races for the population of ";

		} else if (fileName.equals("RelationShipsController.java")) {
			return "Relationships for the population of ";

		} else if (fileName.equals("SchoolEnrollmentController.java")) {
			return "School Enrollment for the population of ";

		} else if (fileName.equals("VeteranStatusController.java")) {
			return "Veterans for the population of ";
		}
		else if(fileName.equals("FertilityController.java")) {
			return "Fertility for the Population of ";
		}
		
		return "";
	}
	
	/**
	 * 
	 */
	private void generateControllerComponents() {
		//Create and array that holds the source files.
		//If Java Source Files exist then delete them
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = mf.compile("templates" + File.separator + "modulecontrollercode.tmpl");
		String srcFolder = System.getProperty("user.dir") + File.separator + "src" + File.separator + "main"
				+ File.separator + "java" + File.separator + "com" + File.separator + "censtat" + File.separator
				+ "web";

		String[] sourceFiles = { "AgeSexController.java", "AncestryController.java", "CitizenshipController.java",
				"ComputerUsageController.java", "EducationalAttainmentController.java", "FertilityController.java",
				"GrandParentsController.java", "HispanicOrLatinoController.java", "HouseHoldsByTypeController.java",
				"LanguagesSpokenController.java", "MaritialStatusController.java", "PlaceOfBirthController.java",
				"RaceController.java", "RelationShipsController.java", "SchoolEnrollmentController.java",
				"VeteranStatusController.java" };

		for (int i = 0; i < sourceFiles.length; i++) {
			String toDelete = srcFolder + File.separator + sourceFiles[i];
			File toDeleteFile = new File(toDelete);					
					try {
						FileWriter writer = new FileWriter(new File(toDelete));
						mustache.execute(writer, this.getControllerForJavaFile(sourceFiles[i])).flush();
						writer.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}

		

	}

	private CenModuleBreadCrumb generateBreadCrumb(DataEntity entity, String type ) {
			CenModuleBreadCrumb template = new CenModuleBreadCrumb();			
			template.addLink("Home", "/");			
			template.addLink("states", "/states");			
			String stateLink = "/states/" + this.getLinkName(entity.getState());
			if (!entity.getDataEntityType().equals(DataEntityTypeInterface.STATE_TYPE)) {
				template.addLink(entity.getState(), stateLink);				
			}
			if (entity.getDataEntityType().equals(DataEntityTypeInterface.CITY_TYPE)) {
				template.addLink("cities", stateLink + "/" + "cities-"+this.getLinkName(entity.getState()));
				template.addLink(entity.getName(),stateLink + "/cities"+"/" +this.getLinkName(entity.getName()));
				template.setActive(type);
			}
			else if (entity.getDataEntityType().equals(DataEntityTypeInterface.COUNTY_TYPE)) {
				template.addLink("Counties", stateLink + "/" + "counties-"+this.getLinkName(entity.getState()));
				template.addLink(entity.getName(),stateLink +"/counties"+ "/" +this.getLinkName(entity.getName()));
				template.setActive(type);
			}
			else if(entity.getDataEntityType().equals(DataEntityTypeInterface.METRO_TYPE)) {
				template.addLink("Metros", stateLink + "/" + "metros-"+this.getLinkName(entity.getState()));
				template.addLink(entity.getName(),stateLink +"/metros" +"/" +this.getLinkName(entity.getName()));
				template.setActive(type);
			}
			else if(entity.getDataEntityType().equals(DataEntityTypeInterface.MICRO_TYPE)) {
				template.addLink("Micros", stateLink + "/" + "micros-"+getLinkName(entity.getState()));
				template.addLink(entity.getName(),stateLink +"/micros" +"/" +this.getLinkName(entity.getName()));
				template.setActive(type);

			}
			else if(entity.getDataEntityType().equals(DataEntityTypeInterface.STATE_TYPE)) {
				template.addLink(entity.getState(), stateLink);
				template.setActive(type);
			}

		return template;
	}
	
	class CenModuleBreadCrumb {

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
	

	class CenModuleInfoObject {

		private String typeOfModule = "";

		public String getTypeOfModule() {
			return typeOfModule;
		}

		public void setTypeOfModule(String typeOfModule) {
			this.typeOfModule = typeOfModule;
		}

		public String getFileNameToCreate() {
			return fileNameToCreate;
		}

		public void setFileNameToCreate(String fileNameToCreate) {
			this.fileNameToCreate = fileNameToCreate;
		}

		public DataEntity getDataEntity() {
			return dataEntity;
		}

		public void setDataEntity(DataEntity dataEntity) {
			this.dataEntity = dataEntity;
		}

		private String fileNameToCreate = "";
		private DataEntity dataEntity = null;

		/**
		 * 
		 * @param type
		 * @param fileName
		 * @param entity
		 */
		public CenModuleInfoObject(String type, String fileName, DataEntity entity) {
			this.typeOfModule = type;
			this.fileNameToCreate = fileName;
			this.dataEntity = entity;
		}

	}
	
	public static void main(String[] args) {
		
		String srcFolder = System.getProperty("user.dir") + File.separator + "src" + File.separator + "main"
				+ File.separator + "java" + File.separator + "com" + File.separator + "censtat" + File.separator
				+ "web";

		String[] sourceFiles = { "AgeSexController.java", "AncestryController.java", "CitizenshipController.java",
				"ComputerUsageController.java", "EducationalAttainmentController.java", "FertilityController.java",
				"GrandParentsController.java", "HispanicOrLatinoController.java", "HouseHoldsByTypeController.java",
				"LanguagesSpokenController.java", "MaritialStatusController.java", "PlaceOfBirthController.java",
				"RaceController.java", "RelationShipsController.java", "SchoolEnrollmentController.java",
				"VeteranStatusController.java" };

		for (int i = 0; i < sourceFiles.length; i++) {
			String toDelete = srcFolder + File.separator + sourceFiles[i];
			File toDeleteFile = new File(toDelete);
			if (toDeleteFile.exists()) {
				try {
					FileUtils.forceDelete(toDeleteFile);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

	}

}
