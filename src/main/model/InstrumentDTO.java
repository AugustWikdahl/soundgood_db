package main.model;

/*
 * A interface with the getters from the instrument class.
 */
public interface InstrumentDTO {
    /**
     * @return The unique instrument identifier.
     */
    public int getInstrumentId();

    /**
     * @return The instrument type.
     */
    public String getType();

    /**
     * @return The instrument price.
     */
    public double getPrice();

    /**
     * @return The instrument brand.
     */
    public String getBrand();

    /**
     * @return Instrument availability.
     */
    public boolean isAvailable();
    
    
}
