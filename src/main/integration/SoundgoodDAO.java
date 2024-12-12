package main.integration;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import main.model.Instrument;
import main.model.Student;

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
    private static final String STUDENT_PK_COLUMN_NAME = "id";

    private PreparedStatement findAllInstrumentsStmt;
    private PreparedStatement findStudentByIdStmt;
    private PreparedStatement rentInstrumentStmt;
    private PreparedStatement findInstrumentByIDStmt;
    private PreparedStatement terminateRentalStmt;



    private Connection connection;

    /*
     * Constructs a DAO object to connect to the school database 
     */
    public SoundgoodDAO() throws DBException {
        try {
            connectToSoundgoodDB();
            prepareStatements();
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


    /*
     * Function to close result set. Taken from Jdbc-bank project written by Leif Lindbäck 2020.
     */
    private void closeResultSet(String failureMsg, ResultSet result) throws DBException {
        if (result != null) { // Ensure result is not null before attempting to close
            try {
                result.close();
            } catch (SQLException e) { // Handle SQLException specifically
                throw new DBException(failureMsg + " Could not close result set.", e);
            }
        }
    }

    /*
     * @Param Input string that specifies instrument type to be listed
     * @return list of instruments available
     */
    public List<Instrument> readAvailableInstruments(String instrumentType) throws DBException {
        String failureMsg = "Could not find available instruments";
        List<Instrument> instruments = new ArrayList<>();
        ResultSet result = null;
        try {
            findAllInstrumentsStmt.setString(1, instrumentType);
            result = findAllInstrumentsStmt.executeQuery();
            while (result.next()) {
                instruments.add(new Instrument(result.getInt(INSTRUMENT_PK_COLUMN_NAME),
                    instrumentType, 
                    result.getDouble(INSTRUMENT_PRICE_COLUMN_NAME),
                    result.getString(INSTRUMENT_BRAND_COLUMN_NAME)
                ));
            }
            connection.commit();
        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        } finally {
            closeResultSet(failureMsg, result);
        }
        return instruments;
    }


    /*
     * @param int studentId, the id to search student by
     * @return a studentDTO from the database
     */
    public Student readStudentById(int studentId) throws DBException{
        String failureMsg = "Failed to get student with id: " + studentId;
        Student student = null;
        ResultSet result = null;
        try {
            findStudentByIdStmt.setInt(1, studentId);
            result = findStudentByIdStmt.executeQuery();
            if (result.next()) {
                student = (new Student(
                    result.getString(STUDENT_NAME_COLUMN_NAME),
                    result.getInt(STUDENT_PK_COLUMN_NAME), 
                    result.getInt("lease_count")
                ));
            }
            connection.commit();
        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        } finally {
            closeResultSet(failureMsg, result);
        }
        return student;
    }  

    /*
     * Method to check if instrument is available. Returns instrument object
     * 
     * @throws DBException if database cant find the instrument.
     */
    public Instrument isInstrumentAvailable(int instrumentId) throws DBException{
        String failureMsg = "Failed to find instrument by id: " + instrumentId;
        Instrument instrument = null;
        ResultSet result = null;
        try {
            findInstrumentByIDStmt.setInt(1, instrumentId);
            result = findInstrumentByIDStmt.executeQuery();
            if (result.next()) {
                instrument = new Instrument(instrumentId, result.getBoolean("is_available"));
            }
            connection.commit();
        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        } finally {
            closeResultSet(failureMsg, result);
        }
        return instrument;
    }

    /*
     * 
     */
    public void rentInstrument(int studentId, int instrumentId) throws DBException {
        String failureMsg = "Failed to rent specified instrument for student";
        int updatedRows = 0;
        try {
            rentInstrumentStmt.setInt(1, studentId);
            rentInstrumentStmt.setInt(2, instrumentId);
            rentInstrumentStmt.setDate(3, Date.valueOf(LocalDate.now()));
            rentInstrumentStmt.setInt(4, 1);
            rentInstrumentStmt.setBoolean(5, false);
            updatedRows = rentInstrumentStmt.executeUpdate();
            if (updatedRows != 1) {
                handleException(failureMsg, null);
            }

            connection.commit();
        } catch (SQLException sqle){
            handleException(failureMsg, sqle);
        } 
    }

    public void terminateRental(int rentalId) throws DBException {
        String failureMsg = "Failed to terminate rental";
        int updatedRows = 0;
        try {
            terminateRentalStmt.setInt(1, rentalId);
            updatedRows = terminateRentalStmt.executeUpdate();
            if (updatedRows != 1) {
                handleException(failureMsg, null);
            }

        } catch (SQLException sqle) {
            handleException(failureMsg, sqle);
        }
    }


    private void prepareStatements() throws SQLException {
        findAllInstrumentsStmt = connection.prepareStatement(
            "SELECT i." + INSTRUMENT_PK_COLUMN_NAME + ", " 
            + "i." + INSTRUMENT_PRICE_COLUMN_NAME + ", "
            + "i." + INSTRUMENT_BRAND_COLUMN_NAME + " "
            + "FROM " + INSTRUMENT_TABLE_NAME + " i "
            + "JOIN " + TYPE_TABLE_NAME + " it ON i." + INSTRUMENT_TYPE_FK_NAME + " = it." + TYPE_PK_COLUMN_NAME + " "
            + "LEFT JOIN " + LEASE_TABLE_NAME + " il ON i." + INSTRUMENT_PK_COLUMN_NAME + " = il." + LEASE_INSTRUMENT_FK_NAME + " "
            + "WHERE it." + TYPE_NAME_COLUMN_NAME + " = ? " 
            + "AND (il." + LEASE_TERMINATED_COLUMN_NAME + " = TRUE OR il." + LEASE_INSTRUMENT_FK_NAME + " IS NULL)"
        );

        findStudentByIdStmt = connection.prepareStatement(
            "SELECT s." + STUDENT_NAME_COLUMN_NAME + ", "
             + "s." + STUDENT_PK_COLUMN_NAME + ", "
             + "COUNT(il." + LEASE_STUDENT_FK_NAME + ") AS lease_count "
            + "FROM " + STUDENT_TABLE_NAME + " AS s "
            + "LEFT JOIN " + LEASE_TABLE_NAME + " AS il "
            + "ON s." + STUDENT_PK_COLUMN_NAME + " = il." + LEASE_STUDENT_FK_NAME + " "
            + "WHERE s." + STUDENT_PK_COLUMN_NAME + " = ? "
            + "GROUP BY s." + STUDENT_PK_COLUMN_NAME + ", s." + STUDENT_NAME_COLUMN_NAME
            );

        rentInstrumentStmt = connection.prepareStatement("INSERT INTO " + LEASE_TABLE_NAME + "(" + LEASE_STUDENT_FK_NAME + ", " + 
            LEASE_INSTRUMENT_FK_NAME + ", start_date, lease_rules, " + LEASE_TERMINATED_COLUMN_NAME + ") VALUES (?, ?, ?, ?, ?)");

        findInstrumentByIDStmt = connection.prepareStatement("SELECT i." + INSTRUMENT_PK_COLUMN_NAME + 
            ", CASE WHEN il." + LEASE_INSTRUMENT_FK_NAME + " IS NULL OR il." + LEASE_TERMINATED_COLUMN_NAME
            + " =  TRUE THEN TRUE ELSE FALSE END AS is_available FROM " + INSTRUMENT_TABLE_NAME + 
            " AS i LEFT JOIN " + LEASE_TABLE_NAME + " AS il ON i." + INSTRUMENT_PK_COLUMN_NAME + " = il." 
            + LEASE_INSTRUMENT_FK_NAME + " WHERE i." + INSTRUMENT_PK_COLUMN_NAME + " = ?"
        );

        terminateRentalStmt = connection.prepareStatement("UPDATE " + LEASE_TABLE_NAME + " SET " + LEASE_TERMINATED_COLUMN_NAME
            + "= TRUE WHERE " + INSTRUMENT_PK_COLUMN_NAME + " = ?");
    }
}
