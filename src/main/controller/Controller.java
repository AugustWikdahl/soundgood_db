package main.controller;

import main.integration.SoundgoodDAO;

import java.util.List;

import main.integration.DBException;
import main.model.Instrument;

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
    public void rentInstrument (String studentId, String instrumentId) {
        soundgoodDb.rentInstrument(Integer.parseInt(studentId), Integer.parseInt(instrumentId));
    }

    // TODO:
    public void terminateRental (String leaseId) {

    }

}
