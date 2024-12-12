package main.controller;

import java.util.List;
import main.integration.DBException;
import main.integration.SoundgoodDAO;
import main.model.Instrument;
import main.model.Student;

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

    /*
     * Public method to list all free instruments to rent of a specified type
     * 
     * @throws BankDBException If unable to read the instruments.
     */
    public List<Instrument> getAvailableInstrumentsOfType (String instrumentType) throws DBException {
        return soundgoodDb.readAvailableInstruments(instrumentType);
    }


    /*
     * Public method to check if instrument is available with specified instrument id
     * 
     * @throws BankDBException If unable to find the specified instrument.
     */
    public boolean isIntrumentAvailable (String instrumentId) throws DBException {
        Instrument instrument = soundgoodDb.readInstrumentAvailable(Integer.parseInt(instrumentId));
        if (instrument.isAvailable()) {
            return true;
        } else {
            return false;
        }
    }

    /*
     * Public method to rent an instrument 
     * 
     * @throws BankDBException If inserting rental in database fails.
     */
    public boolean rentInstrument (String studentId, String instrumentId) throws DBException{
        Student student = soundgoodDb.readStudentById(Integer.parseInt(studentId));
        if (student.canRentMore()) {
            soundgoodDb.updateRentInstrument(Integer.parseInt(studentId), Integer.parseInt(instrumentId));
            return true;
        } else {
            return false;
        }
    }

    /*
     * Public method to terminate rental
     * 
     * @throws BankDBException If fails to update database.
     */
    public void terminateRental (String leaseId) throws DBException{
        soundgoodDb.updateTerminateRental(Integer.parseInt(leaseId));
    }

}
