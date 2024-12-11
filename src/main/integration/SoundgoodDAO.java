package main.integration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class SoundgoodDAO {
    private static final String INSTRUMENT_TABLE_NAME = "instrument";
    private static final String INSTRUMENT_PK_COLUMN_NAME = "id";
    private static final String INSTRUMENT_TYPE_FK_NAME = "instrument_type_id";
    private static final String INSTRUMENT_PRICE_COLUMN_NAME = "rental_price";
    private static final String INSTRUMENT_BRAND_COLUMN_NAME = "brand";

    private static final String TYPE_TABLE_NAME = "instrument_type";
    private static final String TYPE_PK_COLUMN_NAME = "id";
    private static final String TYPE_NAME_COLUMN_NAME = "name";

    private static final String LEASE_TABLE_NAME = "instrument_lease";
    private static final String LEASE_STUDENT_FK_NAME = "student_id";
    private static final String LEASE_INSTRUMENT_FK_NAME = "instrument_id";
    private static final String LEASE_TERMINATED_COLUMN_NAME = "is_terminated";

    private static final String STUDENT_TABLE_NAME = "student";
    private static final String STUDENT_NAME_COLUMN_NAME = "name";



    private Connection connection;

    /*
     * Constructs a DAO object to connect to the school database 
     */
    public SoundgoodDAO() throws DBException {
        try {
            connectToSoundgoodDB();
        } catch (ClassNotFoundException | SQLException exception) {
            System.out.println("failed");
            throw new DBException("Could not connect to datasource.", exception);
        }
    }

    private void connectToSoundgoodDB() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/soundgood",
                "postgres", "Hjrntvtt97");

        connection.setAutoCommit(false);
    }

    /*
     * Exception-handler to handle rollbacks. Taken from Jdbc-bank project written by Leif Lindbäck 2020.
     */
    private void handleException(String failureMsg, Exception cause) throws DBException {
        String completeFailureMsg = failureMsg;
        try {
            connection.rollback();
        } catch (SQLException rollbackExc) {
            completeFailureMsg = completeFailureMsg + ". Failed to rollout transaction because of: "
            + rollbackExc.getMessage();
        }

        if (cause != null) {
            throw new DBException(failureMsg, cause);
        } else {
            throw new DBException(failureMsg);
        }
    }

    private void closeResultSet(String failureMsg, ResultSet result) throws DBExcepiton {
        try {
            result.close();
        } catch (Exception e) {
            throw new DBException(failureMsg + " Could not close result set.", e);
        }  
    }

    
}
