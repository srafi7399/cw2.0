package com.censtat.db.connect;

import com.mongodb.DBCursor;
import com.mongodb.DBObject;

/**
 * Interface to retrieve the Census Access Information
 * 
 * @author Numaan
 *
 */
public interface CensusAccessIfc {

	/**
	 * A method to return all the population estimates for all the states and
	 * regions including the unites states from the year 2010 to 2014.
	 * 
	 * @return DBObject, The result object
	 */
	public DBCursor getAllPopEstimatesFor2010To2014();

	/**
	 * A method to get all the Population Estimates for all states from 2010 to 2014
	 */
	public DBCursor getAllPopEstimatesForAllStates2010To2014();
	/**
	 * A method to get pop estimates for all the regions from 2010 to 2014.
	 * @return
	 */
	public DBCursor getAllPopEstimatesForAllRegions2010To2014();
	/**
	 * A method to get all the Pop Estimates for USA from 2010 to 2014
	 * @return
	 */
	public DBCursor getAllPopEstimatesForUSAFor2010To2014();
	/**
	 * A method to get all the population estimates for the provides state from 2010 to 2014.
	 * @param allquery
	 * @param filter
	 * @return
	 */
	public DBCursor getAllPopEstimatesForState2010To2014(
			String stateName);

	DBCursor getAllPopEstimatesForState2010To2014(String type, String view);
	
	public DBObject getChartsForFip(String fipCode);

}
