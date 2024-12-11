package main.startup;

import main.controller.Controller;
import main.integration.DBException;
import main.view.BlockingInterpreter;

public class Main {
    public static void main(String[] args) {
        System.out.println("Program started!");
        try {
        new BlockingInterpreter(new Controller()).handleCmds();
        } catch(DBException dbException) {
            System.out.println("Could not connect to Bank db.");
            dbException.printStackTrace();
        }
    }
}
