package com.censtat.data.tools;
/**
 * Singleton for the build Context
 * 
 * @author RafiS1
 *
 */
public class CenBuildContext {
	/* Singleton Instance */
	private static CenBuildContext singleton = null;
	/* Used for a Production Build */
	public static final String PROD = "Production";
	/*Used for a Stage Build */
	public static final String STAGE = "Stage";
	/* Used for a Test Build */
	public static final String TEST = "Test";
	
	private String currentBuildContext = "";

	/* Private Constructor */
	private CenBuildContext() {

	}
	
	/**
	 * Public method to return the Build Context
	 * 
	 * @return
	 */
	public static CenBuildContext getInstance() {
		if (singleton == null) {
			synchronized (CenBuildContext.class) {
				if (singleton == null) {
					singleton = new CenBuildContext();
				}
			}
		}
		return singleton;
	}
	
	/**
	 * A method to set the current build Context
	 * @param buildContext
	 */
	public void setBuildContext(String buildContext){
		System.out.println("Build Context was set to --> "+buildContext);
		this.currentBuildContext= buildContext;		
	}
	
	/*
	 * A method to get the Current Build Context
	 */
	public String getCurrentBuildContext(){
		return this.currentBuildContext;
	}

	/**
	 * Program Main Method
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

	}
}