package main.controller;

import main.integration.SoundgoodDAO;

import java.util.List;

import main.integration.DBException;
import main.model.Instrument;
import main.model.InstrumentDTO;

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

    public List<Instrument> getAvailableInstrumentsOfType (String instrumentType) {
        try {
            soundgoodDb.findAvailableInstruments(instrumentType);
        } catch (DBException e) {
            System.out.println("Fuck yourself");
        }
    }

    public void rentInstrument (String studentId, String instrumentId) {

    }

}
