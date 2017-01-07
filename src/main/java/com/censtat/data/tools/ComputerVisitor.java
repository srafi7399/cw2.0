package com.censtat.data.tools;

import java.io.File;
import java.io.FileWriter;

import com.censtat.data.implementation.DataEntity;
import com.censtat.data.interfaces.DataEntityTypeInterface;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

public class ComputerVisitor implements ModuleVisitorInterface {

	private KeyGenTemplateFile template = new KeyGenTemplateFile();
	@Override
	public FileWriter visit(DataEntity entity, FileWriter writer) {
		
		/*template.setKeyMap(entity.getItentifierKeys());
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = mf.compile("templates/computers.tmpl");
		mustache.execute(writer, template);*/
		createComputerUsagePage(entity);
		return writer;
	}
	
	private void createComputerUsagePage(DataEntity entity) {
		System.out.println("***********Creating the Computer Usage Page ******************");
		String toCreate = "/states/"+ CenModulePageCreator.getInstance().getLinkName(entity.getState());
		if (entity.getDataEntityType().equals(DataEntityTypeInterface.CITY_TYPE)) {
			toCreate = toCreate + "/cities";
		} else if (entity.getDataEntityType().equals(DataEntityTypeInterface.COUNTY_TYPE)) {
			toCreate = toCreate +  "/counties";
		} else if (entity.getDataEntityType().equals(DataEntityTypeInterface.METRO_TYPE)) {
			toCreate = toCreate + "/metros";
		} else if (entity.getDataEntityType().equals(DataEntityTypeInterface.MICRO_TYPE)) {
			toCreate = toCreate +  "/micros";
		} else if(entity.getDataEntityType().equals(DataEntityTypeInterface.STATE_TYPE)) {
			CenModulePageCreator.getInstance().addModuleInfo(CenModulePageCreator.MODULE_COMPUTER_USAGE, toCreate, entity);
			return;
		}
		toCreate = toCreate + "/" + CenModulePageCreator.getInstance().getLinkName(entity.getName());
		CenModulePageCreator.getInstance().addModuleInfo(CenModulePageCreator.MODULE_COMPUTER_USAGE, toCreate, entity);
	}

}
