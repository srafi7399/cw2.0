package com.censtat.data.tools;
import java.io.File;

import org.apache.commons.io.FileUtils;

public class CleanBuild {
	
	
	public static void cleanUpGeneratedFilesAndDirectories() {
		
		
		String targetDir = System.getProperty("user.dir")
								+File.separator+"src"
								+File.separator+"main"
								+File.separator+"webapp"
								+File.separator+"WEB-INF"
								+File.separator+"views"
								+File.separator+"tiles"
								+File.separator+"states";
		
		String tilesDir =  System.getProperty("user.dir")
				+File.separator+"src"
				+File.separator+"main"
				+File.separator+"webapp"
				+File.separator+"WEB-INF"
				+File.separator+"views"
				+File.separator+"tiles";

			String tilesXmlFile = System.getProperty("user.dir")
				+File.separator+"src"
				+File.separator+"main"
				+File.separator+"webapp"
				+File.separator+"WEB-INF"
				+File.separator+"spring"
				+File.separator+"tiles.xml";
			File tilesFile = new File(tilesXmlFile);
			if(tilesFile.exists()) {
				if(tilesFile.delete()) {
					System.out.println("Sucessfully Deleted the Tiles files ");
				}
			}
		
		String states = tilesDir +File.separator+"states.jsp";
				
		
		File file = new File(targetDir);
		if(!file.isDirectory()) {
			System.out.println("The States Directory Does not Exist");
			System.out.println("Creating.....");
			try{
				file.mkdir();				
			}catch(Exception e) {
				System.out.println(e);				
			}
		}
		else {
			try {
				FileUtils.deleteDirectory(file);
				System.out.println("Sucessfully Deleted");
				
			} catch (Exception e) {
				System.out.println(e);

			}			
			
		}
		
		//Delete the states.jsp file
		File statesFile = new File(states);
		if(statesFile.exists()){
			if(statesFile.delete()) {
				System.out.println("Sucessfully Deleted the States File ");
			}
		}
		
		
	}

	public static void main(String[] args) {		
		CleanBuild.cleanUpGeneratedFilesAndDirectories();
	}

}