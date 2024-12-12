package main.model;

public class Student {
    private String name;
    private int id;
    private int noOfRentedInstruments;

    /*
     * Creates instance of StudentDTO
     * @param name, studentid
     */
    public Student(String name, int studentId, int noOfRentedInstruments) {
        this.name = name;
        this.id = studentId;
        this.noOfRentedInstruments = noOfRentedInstruments;
    }


    public String getName() {
        return name;
    }

    public int getID() {
        return id;
    }

    /*
     * Public method to tell if student is allowed to rent more instruments
     * @return boolean 
     */
    public boolean canRentMore() {
        if (noOfRentedInstruments < 2) {
            return true;
        } else {
            return false;
        }
    }

}
