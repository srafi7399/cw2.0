package com.censtat.db.connect;

import java.util.ArrayList;
import java.util.List;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.util.JSON;

public class CensusAccess implements CensusAccessIfc {	

	
	public  DBObject getChartsForFip(String fipCode)
	{
		DBCollection coll = MongoApp.db.getCollection("DataEntityViewData");			
		DBObject query = new BasicDBObject("fipCode", fipCode);		
		DBObject object = coll.findOne(query);
		if(object!=null)
		{
			return object;
		}
		return null;
	}
	
	@Override
	public DBCursor getAllPopEstimatesFor2010To2014() {	
		DBCollection coll = MongoApp.db.getCollection("PopEst20102014all");		
		BasicDBObject allQuery = new BasicDBObject();
		BasicDBObject fields = new BasicDBObject();
		fields.put(CensusConst.REGION_NAME, 1);
		fields.put(CensusConst.POP_ESTIMATE_2010 ,1);
		fields.put(CensusConst.POP_ESTIMATE_2011 ,1);
		fields.put(CensusConst.POP_ESTIMATE_2012 ,1);
		fields.put(CensusConst.POP_ESTIMATE_2013 ,1);
		fields.put(CensusConst.POP_ESTIMATE_2014 ,1);	 
		DBCursor cursor = coll.find(allQuery, fields);
		return cursor;
	}

	@Override
	public DBCursor getAllPopEstimatesForAllStates2010To2014() {
		BasicDBObject inQuery = new BasicDBObject();
		List<String> list = new ArrayList<String>();
		list.add(CensusConst.POP_US);
		list.add(CensusConst.POP_MID_WEST);
		list.add(CensusConst.POP_WEST);
		list.add(CensusConst.POP_SOUTH);
		list.add(CensusConst.POP_NORTH_EAST);
		inQuery.put(CensusConst.REGION_NAME, new BasicDBObject("$nin", list));
		DBCursor cursor = MongoApp.db.getCollection("PopEst20102014all").find(inQuery);
		return cursor;
	}

	@Override
	public DBCursor getAllPopEstimatesForAllRegions2010To2014() {
		BasicDBObject inQuery = new BasicDBObject();		
		List<String> list = new ArrayList<String>();		
		list.add(CensusConst.POP_MID_WEST);
		list.add(CensusConst.POP_WEST);
		list.add(CensusConst.POP_SOUTH);
		list.add(CensusConst.POP_NORTH_EAST);
		inQuery.put(CensusConst.REGION_NAME, new BasicDBObject("$in", list));
		DBCursor cursor = MongoApp.db.getCollection("PopEst20102014all").find(inQuery);
		return cursor;
	}

	@Override
	public DBCursor getAllPopEstimatesForUSAFor2010To2014() {
		BasicDBObject inQuery = new BasicDBObject();
		List<String> list = new ArrayList<String>();
		list.add(CensusConst.POP_US);		
		inQuery.put(CensusConst.REGION_NAME, new BasicDBObject("$in", list));
		DBCursor cursor = MongoApp.db.getCollection("PopEst20102014all").find(inQuery);
		return cursor;
	}

	@Override
	public DBCursor getAllPopEstimatesForState2010To2014(String name) {
		if (name.equals(CensusConst.ALL_REGIONS)) {
			BasicDBObject inQuery = new BasicDBObject();
			List<String> list = new ArrayList<String>();
			list.add(CensusConst.POP_MID_WEST);
			list.add(CensusConst.POP_WEST);
			list.add(CensusConst.POP_SOUTH);
			list.add(CensusConst.POP_NORTH_EAST);
			inQuery.put(CensusConst.REGION_NAME,
					new BasicDBObject("$in", list));
			DBCursor cursor = MongoApp.db.getCollection("PopEst20102014all")
					.find(inQuery);
			return cursor;

		} else {
			BasicDBObject inQuery = new BasicDBObject();
			List<String> list = new ArrayList<String>();
			list.add(name);
			inQuery.put(CensusConst.REGION_NAME, new BasicDBObject("$in", list));
			DBCursor cursor = MongoApp.db.getCollection("PopEst20102014all")
					.find(inQuery);
			return cursor;

		}
	}
	
	
	@Override
	public DBCursor getAllPopEstimatesForState2010To2014(String chartType, String view) {
		
		//First Identify the Collection
		DBCollection targetCollection = null;
		if (chartType.equals("PopEstimatesAll")) {
			targetCollection = MongoApp.db.getCollection("PopEst20102014all");

		} else if (chartType.equals("PopEstimatesNum")) {
			targetCollection = MongoApp.db.getCollection("PopEst20102014Num");

		} else if (chartType.equals("PopEstimatesPer")) {
			targetCollection = MongoApp.db.getCollection("PopEst20102014Per");

		}
				
		if (view.equals(CensusConst.ALL_REGIONS)) {
			BasicDBObject inQuery = new BasicDBObject();
			List<String> list = new ArrayList<String>();
			list.add(CensusConst.POP_MID_WEST);
			list.add(CensusConst.POP_WEST);
			list.add(CensusConst.POP_SOUTH);
			list.add(CensusConst.POP_NORTH_EAST);
			inQuery.put(CensusConst.REGION_NAME,
					new BasicDBObject("$in", list));
			
			DBCursor cursor = targetCollection.find(inQuery);
			return cursor;

		} else {
			BasicDBObject inQuery = new BasicDBObject();
			List<String> list = new ArrayList<String>();
			list.add(view);
			inQuery.put(CensusConst.REGION_NAME, new BasicDBObject("$in", list));
			DBCursor cursor = targetCollection.find(inQuery);					
			return cursor;

		}
	}
	

}
