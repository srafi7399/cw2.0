package com.censtat.web;


import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.censtat.node.router.CenstatViewDataNodeProxy;
import com.census.db.main.CensusAccess;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;
import com.censtat.node.router.*;
@Controller
public class ViewDataController {
	private CensusAccess access = new CensusAccess();	
	private CenstatViewDataNodeProxy proxy = new CenstatViewDataNodeProxy();
	
	@Autowired
	private HttpServletRequest request;
	@RequestMapping(value = "/charts", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody Object getCharts(Locale locale, Model model) throws ClientProtocolException, IOException {	
		Object object = proxy.getChartData(request.getHeader("resource"));
		//DBObject object = access.getChartsForFip(request.getHeader("resource"));			
		return object;
	}

}
