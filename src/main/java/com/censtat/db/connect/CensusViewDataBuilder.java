package com.censtat.db.connect;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

/**
 * A class to build the data for all the view in the system. This class will
 * Query the Main Collection and create sub collection objects from the main
 * collection to support the various view
 * 
 * @author Numaan
 *
 */
public class CensusViewDataBuilder {

	private DB db = null;// Mongo DB Instance with connection to Main Source
							// collection

	/**
	 * Constructor
	 * 
	 * @param db
	 *            , The DB connection
	 */
	public CensusViewDataBuilder(DB db) {
		this.db = db;
	}

	/**
	 * Initialize the CensusViews with Data
	 */
	public void init() {
		dropViewCollections();
		buildViewCollections();
		this.populateViewCollections();
	}
	
	/**
	 * Delete the collections
	 */
	private void dropViewCollections() {
		if (db.collectionExists("PopEst20102014all")) {
			DBCollection collection = db.getCollection("PopEst20102014all");
			collection.drop();
			System.out.println("Sucessfully dropped the view collection");
		} else if (db.collectionExists("PopEst20102014Num")) {
			DBCollection collection = db.getCollection("PopEst20102014Num");
			collection.drop();
			System.out.println("Sucessfully dropped the view collection");
		} else if (db.collectionExists("PopEst20102014Per")) {
			DBCollection collection = db.getCollection("PopEst20102014Per");
			collection.drop();
			System.out.println("Sucessfully dropped the view collection");
		}
	}
	/**
	 * A private method to build the view collections
	 */
	private void buildViewCollections() {	
		// Build the Pop Estimate Collection
		db.createCollection("PopEst20102014all", null);
		DBCollection coll = db.getCollection("PopEst20102014all");
		DBCollection mainCollection = db.getCollection("Pop20102014");
		BasicDBObject allQuery = new BasicDBObject();
		BasicDBObject fields = new BasicDBObject();
		fields.put(CensusConst.REGION_NAME, 1);
		fields.put(CensusConst.POP_ESTIMATE_2010, 1);
		fields.put(CensusConst.POP_ESTIMATE_2011, 1);
		fields.put(CensusConst.POP_ESTIMATE_2012, 1);
		fields.put(CensusConst.POP_ESTIMATE_2013, 1);
		fields.put(CensusConst.POP_ESTIMATE_2014, 1);

		DBCursor cursor = mainCollection.find(allQuery, fields);
		while (cursor.hasNext()) {
			System.out.println("--Inserting Value into Other Table---");
			coll.insert(new BasicDBObject(cursor.next().toMap()));
		}

		// Build the Net Population Change Collection
		db.createCollection("PopEst20102014Num", null);
		DBCollection collNum = db.getCollection("PopEst20102014Num");
		BasicDBObject numQuery = new BasicDBObject();
		BasicDBObject numfields = new BasicDBObject();
		numfields.put(CensusConst.REGION_NAME, 1);
		numfields.put(CensusConst.NET_POP_CHANGE2010, 1);
		numfields.put(CensusConst.NET_POP_CHANGE2011, 1);
		numfields.put(CensusConst.NET_POP_CHANGE2012, 1);
		numfields.put(CensusConst.NET_POP_CHANGE2013, 1);
		numfields.put(CensusConst.NET_POP_CHANGE2014, 1);

		cursor = mainCollection.find(numQuery, numfields);
		while (cursor.hasNext()) {
			System.out.println("--Inserting Value into Other Table---");
			collNum.insert(new BasicDBObject(cursor.next().toMap()));
		}

		// Build the Percentage Population Change Collection
		db.createCollection("PopEst20102014Per", null);
		DBCollection perNum = db.getCollection("PopEst20102014Per");
		BasicDBObject perQuery = new BasicDBObject();
		BasicDBObject perfields = new BasicDBObject();
		perfields.put(CensusConst.REGION_NAME, 1);
		perfields.put(CensusConst.PER_POP_CHANGE2010, 1);
		perfields.put(CensusConst.PER_POP_CHANGE2011, 1);
		perfields.put(CensusConst.PER_POP_CHANGE2012, 1);
		perfields.put(CensusConst.PER_POP_CHANGE2013, 1);
		perfields.put(CensusConst.PER_POP_CHANGE2014, 1);

		cursor = mainCollection.find(perQuery, perfields);
		while (cursor.hasNext()) {
			System.out.println("--Inserting Value into Other Table---");
			perNum.insert(new BasicDBObject(cursor.next().toMap()));
		}
		
	}

	/**
	 * A private method to populate the view collections with Data
	 */
	private void populateViewCollections() {

	}

}
