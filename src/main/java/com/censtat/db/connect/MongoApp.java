package com.censtat.db.connect;

import java.net.UnknownHostException;

import com.mongodb.*;

public class MongoApp {
	
	public static DB db = null;

	public MongoApp() {

	}

	public void createConnection() throws UnknownHostException {
		MongoClient mongoClient = new MongoClient(new ServerAddress("localhost", 27017));
		db = mongoClient.getDB("CensusDB");
		/*CensusViewDataBuilder builder = new CensusViewDataBuilder(db);
		builder.init();
*/
	}
	
	

	public void printCollection() {
		CensusAccess access = new CensusAccess();
		DBCursor cursor = access.getAllPopEstimatesFor2010To2014();
		System.out
				.println(">>>>>START PRINTING FOR ALL THE STATES AND TERRITORIES <<<<<<<<<<<");
		while (cursor.hasNext()) {
			System.out.println(cursor.next());
		}
		System.out
				.println(">>>>>END PRINTING FOR ALL THE STATES AND TERRITORIES <<<<<<<<<<<");

		cursor = access.getAllPopEstimatesForAllStates2010To2014();
		System.out
				.println(">>>>>START PRINTING FOR ALL THE STATES  ONLY <<<<<<<<<<<");
		while (cursor.hasNext()) {
			System.out.println(cursor.next());
		}
		System.out
				.println(">>>>>END PRINTING FOR ALL THE STATES ONLY <<<<<<<<<<<");

		cursor = access.getAllPopEstimatesForAllRegions2010To2014();
		System.out
				.println(">>>>>START PRINTING FOR ALL THE REGIONS  ONLY <<<<<<<<<<<");
		while (cursor.hasNext()) {
			System.out.println(cursor.next());
		}
		System.out
				.println(">>>>>END PRINTING FOR ALL THE REGIONS ONLY <<<<<<<<<<<");

		cursor = access.getAllPopEstimatesForUSAFor2010To2014();
		System.out
				.println(">>>>>START PRINTING FOR ALL THE USA  ONLY <<<<<<<<<<<");
		while (cursor.hasNext()) {
			System.out.println(cursor.next());
		}
		System.out.println(">>>>>END PRINTING FOR ALL USA ONLY <<<<<<<<<<<");

		cursor = access
				.getAllPopEstimatesForState2010To2014(CensusConst.POP_SOUTH);
		System.out
				.println(">>>>>START PRINTING FOR A SPECIFIED REGION ONLY <<<<<<<<<<<");
		while (cursor.hasNext()) {
			System.out.println(cursor.next());
		}

		cursor = access
				.getAllPopEstimatesForState2010To2014(CensusConst.ALL_REGIONS);
		System.out.println(">>>>>START PRINTING FOR  ALL REGIONS <<<<<<<<<<<");
		while (cursor.hasNext()) {
			System.out.println(cursor.next());
		}
		System.out
				.println(">>>>>END PRINTING FOR A SPECIFIED REGION ONLY <<<<<<<<<<<");
	}

	public static void main(String[] args) {
		MongoApp app = new MongoApp();
		try {
			app.createConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		app.printCollection();

	}

}
