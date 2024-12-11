package main.controller;

import java.util.List;
import main.integration.DBException;
import main.integration.SoundgoodDAO;
import main.model.Instrument;
import main.model.StudentDTO;

public class Controller {
    private final SoundgoodDAO soundgoodDb;

    /**
     * Creates a new instance, and retrieves a connection to the database.
     * 
     * @throws BankDBException If unable to connect to the database.
     */
    public Controller() throws DBException {
        this.soundgoodDb = new SoundgoodDAO();
    }

    public List<Instrument> getAvailableInstrumentsOfType (String instrumentType) throws DBException {
        return soundgoodDb.findAvailableInstruments(instrumentType);
    }

    // TODO:
    public boolean rentInstrument (String studentId, String instrumentId) throws DBException{
        StudentDTO student = soundgoodDb.findStudentById(studentId);
        if (student.canRentMore()) {
            soundgoodDb.rentInstrument(Integer.parseInt(studentId), Integer.parseInt(instrumentId));
            return true;
        } else {
            return false;
        }
    }

    // TODO:
    public void terminateRental (String leaseId) {

    }

}
