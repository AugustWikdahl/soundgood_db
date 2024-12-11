package main.model;

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
}
