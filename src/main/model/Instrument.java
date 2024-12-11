package main.model;

public class Instrument implements InstrumentDTO{
    private int id;
    private String type;
    private double price;
    private String brand;

    public Instrument(int id, String type, double price, String brand) {
        this.id = id;
        this.type = type;
        this.price = price;
        this.brand = brand;
    }


    /**
     * @return The unique instrument identifier.
     */
    public int getInstrumentId() {
        return id;
    }

        /**
     * @return The instrument type.
     */
    public String getType() {
        return type;
    }

    /**
     * @return The instrument price.
     */
    public double getPrice() {
        return price;
    }

    /**
     * @return The instrument brand.
     */
    public String getBrand() {
        return brand;
    }

    @Override
    public String toString() {
        return "Type: " + this.getType() + " Brand: " + this.getBrand() + " ID: " + this.getInstrumentId();
    }


}
