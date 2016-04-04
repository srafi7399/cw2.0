package com.censtat.node.router;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;


public class CenstatViewDataNodeProxy {

	public Object getChartData(String fipCode) throws ClientProtocolException,
			IOException {
		HttpClient client = new DefaultHttpClient();
		HttpGet request = new HttpGet("http://localhost:3000/charts");
		request.setHeader("resource", fipCode);
		HttpResponse response = client.execute(request);
		return EntityUtils.toString(response.getEntity());
	}

	public static void main(String[] args) {
		CenstatViewDataNodeProxy proxy = new CenstatViewDataNodeProxy();
		try {
			System.out.println(proxy.getChartData("1"));
			System.out.println(proxy.getChartData("2"));
			System.out.println(proxy.getChartData("3"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
