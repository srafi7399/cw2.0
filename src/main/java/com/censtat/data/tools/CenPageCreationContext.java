package com.censtat.data.tools;

import java.util.HashMap;

/**
 * 
 * @author RafiS1
 *
 */
public class CenPageCreationContext {
	
	private static CenPageCreationContext singleton = null;
	private String currentWorkingDir = null;
	private CenstatPageGenTool.ModuleControllerCodeTemplate ageSexTemplate =  CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("AgeSexController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate raceTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("RaceController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate hispaicOrLatinoTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("HispanicOrLatinoController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate houseHoldsByTypeTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("HouseHoldsByTypeController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate relationShipTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("RelationShipsController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate maritialStatusTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("MaritialStatusController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate fertilityTemplate =  CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("FertilityController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate grandparentsTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("GrandParentsController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate schoolEnrollmentTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("SchoolEnrollmentController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate educationalTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("EducationalAttainment");
	private CenstatPageGenTool.ModuleControllerCodeTemplate veteransTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("VeteranStatusController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate placeOfBirthTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("PlaceOfBirthController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate citizenShipStatus = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("CitizenshipController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate languagesSpokenTemplate =  CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("LanguagesSpokenController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate ancestryTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("AncestryController");
	private CenstatPageGenTool.ModuleControllerCodeTemplate computerUsageTemplate = CenstatPageGenTool.getInstance().new ModuleControllerCodeTemplate("ComputerUsageController");
	private HashMap<String,CenstatPageGenTool.ModuleControllerCodeTemplate> controllerMap = new HashMap<String,CenstatPageGenTool.ModuleControllerCodeTemplate>();
	
	

	private CenPageCreationContext() {
		initControllerMap();

	}

	/**
	 * Public method to return the Build Context
	 * 
	 * @return
	 */
	public static CenPageCreationContext getInstance() {
		if (singleton == null) {
			synchronized (CenPageCreationContext.class) {
				if (singleton == null) {
					singleton = new CenPageCreationContext();
				}
			}
		}
		return singleton;
	}
	
	/**
	 * Initialize all the controller Code Gen Templates 
	 */
	private void initControllerMap() {
		this.controllerMap.put("AgeSexController", ageSexTemplate);
		this.controllerMap.put("RaceController", raceTemplate);
		this.controllerMap.put("HispanicOrLatinoController", hispaicOrLatinoTemplate);
		this.controllerMap.put("HouseHoldsByTypeController", houseHoldsByTypeTemplate);
		this.controllerMap.put("RelationShipsController", this.relationShipTemplate);
		this.controllerMap.put("MaritialStatusController",this.maritialStatusTemplate);
		this.controllerMap.put("FertilityController", this.fertilityTemplate);
		this.controllerMap.put("GrandParentsController", this.grandparentsTemplate);
		this.controllerMap.put("SchoolEnrollmentController", this.schoolEnrollmentTemplate);
		this.controllerMap.put("EducationalAttainment", this.educationalTemplate);
		this.controllerMap.put("VeteranStatusController", this.veteransTemplate);
		this.controllerMap.put("PlaceOfBirthController", this.placeOfBirthTemplate);
		this.controllerMap.put("CitizenshipController", this.citizenShipStatus);
		this.controllerMap.put("LanguagesSpokenController", this.languagesSpokenTemplate);
		this.controllerMap.put("AncestryController", this.ancestryTemplate);
		this.controllerMap.put("ComputerUsageController", this.computerUsageTemplate);	
	}
	/**
	 * A method to set the Current Working Directory
	 * @param currentDir
	 */
	public void setCurrentWorkingDirectory(String currentDir) {
		this.currentWorkingDir=currentDir;
	}
	/**
	 * A method to get the Current Working Directory.
	 * @return currentWorkingDir
	 */
	public String getCurrentWorkingDirectory(){
		return this.currentWorkingDir;
	}

}
