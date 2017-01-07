package com.censtat.data.tools;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.StringTokenizer;

import com.censtat.data.implementation.DataEntity;
import com.censtat.data.interfaces.DataEntityTypeInterface;
import com.censtat.ui.charts.BasicPieChartBuilder;
import com.censtat.ui.charts.CenPieChart;
import com.censtat.ui.charts.DataEntityViewData;
import com.censtat.ui.charts.DataEntityViewFactory;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.util.JSON;

/**
 * 
 * @author Rafi Shaik
 *
 */
public class AgeSexModuleVisitor implements ModuleVisitorInterface {
	private KeyGenTemplateFile template = new KeyGenTemplateFile();
	GsonBuilder builder = new GsonBuilder();
	Gson gson = builder.create();

	@Override
	public FileWriter visit(DataEntity entity, FileWriter writer) {
		/*template.setKeyMap(entity.getItentifierKeys());
		MustacheFactory mf = new DefaultMustacheFactory();
		Mustache mustache = null;
		if (CenBuildContext.getInstance().getCurrentBuildContext().equals(CenBuildContext.STAGE)) {
			mustache = mf.compile("templates/sexandage_stage.tmpl");
		} else {
			mustache = mf.compile("templates/sexandage.tmpl");
		}
		mustache.execute(writer, template);
		buildandStoreGUICharts(entity);*/
		createAgeSexPage(entity);
		return writer;
	}

	/* FIX ME -- Duplicate Logic - NEED to STANDARDIZE */

	private void createAgeSexPage(DataEntity entity) {
		System.out.println("***********Adding the Module Info ******************");
		String toCreate = "/states/"+ CenModulePageCreator.getInstance().getLinkName(entity.getState());
		if (entity.getDataEntityType().equals(DataEntityTypeInterface.CITY_TYPE)) {
			toCreate = toCreate + "/cities";
		} else if (entity.getDataEntityType().equals(DataEntityTypeInterface.COUNTY_TYPE)) {
			toCreate = toCreate + "/counties";
		} else if (entity.getDataEntityType().equals(DataEntityTypeInterface.METRO_TYPE)) {
			toCreate = toCreate +"/metros";
		} else if (entity.getDataEntityType().equals(DataEntityTypeInterface.MICRO_TYPE)) {
			toCreate = toCreate + "/micros";
		} else if(entity.getDataEntityType().equals(DataEntityTypeInterface.STATE_TYPE)) {
			CenModulePageCreator.getInstance().addModuleInfo(CenModulePageCreator.MODULE_AGE_SEX_TYPE, toCreate, entity);
			return;
		}
		toCreate = toCreate +"/"+ CenModulePageCreator.getInstance().getLinkName(entity.getName());
		CenModulePageCreator.getInstance().addModuleInfo(CenModulePageCreator.MODULE_AGE_SEX_TYPE, toCreate, entity);
	}

	private void buildandStoreGUICharts(DataEntity entity) {
		BasicPieChartBuilder asBuilder = new BasicPieChartBuilder();
		CenPieChart pieChart0 = asBuilder.getAgeSexPieChart(entity, "name_male_female_percentage");
		CenPieChart pieChart1 = asBuilder.getAgeSexPieChart(entity, "name_18_years_and_over_cdp");
		CenPieChart pieChart2 = asBuilder.getAgeSexPieChart(entity, "name_age_distribution");
		CenPieChart pieChart3 = asBuilder.getAgeSexPieChart(entity, "name_65_years_and_over_cdp");
		storeTheCharts(pieChart0, entity, "name_male_female_percentage");
		storeTheCharts(pieChart1, entity, "name_18_years_and_over_cdp");
		storeTheCharts(pieChart2, entity, "name_age_distribution");
		storeTheCharts(pieChart3, entity, "name_65_years_and_over_cdp");
	}

	/**
	 * 
	 * @param chart
	 * @param entity
	 */
	private void storeTheCharts(CenPieChart chart, DataEntity entity, String id) {
		// Check if a DataEntityViewData Object exists.
		DataEntityViewData viewData = null;
		viewData = DataEntityViewFactory.getInstance().getDataEntityViewData(entity.getFipCode());
		if (viewData == null) {
			viewData = new DataEntityViewData();
			viewData.setFipCode(entity.getFipCode());
			DataEntityViewFactory.getInstance().registerDataViewTofip(entity.getFipCode(), viewData);
		}
		viewData.registerJSON(id, getJson(chart));

	}

	private String getJson(CenPieChart chart) {
		Object obj = JSON.parse(gson.toJson(chart));
		return obj.toString();
	}

	public static void main(String[] args) {
		CenstatPageGenTool.getInstance().testDriveModuleVisitors();
		DataEntityViewFactory.getInstance().storeViewData();

	}

}
