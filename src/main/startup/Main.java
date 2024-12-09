package main.startup;

import main.integration.SoundgoodDAO;

public class Main {
    SoundgoodDAO soundgoodDAO = new SoundgoodDAO();
    public static void main(String[] args) {
        System.out.println("Program started!");
        Main main = new Main();
    }
}
