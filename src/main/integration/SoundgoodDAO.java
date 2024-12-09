package main.integration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SoundgoodDAO {

    private Connection connection;

    public SoundgoodDAO() {
        try {
            connectToSoundgoodDB();
        } catch (ClassNotFoundException | SQLException exception) {
            System.out.println("failed");
            //throw new DBException("Could not connect to datasource.", exception);
        }
    }
    private void connectToSoundgoodDB() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/soundgood",
                "postgres", "mo12qwer");
        // connection =
        // DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdb",
        // "mysql", "mysql");
        connection.setAutoCommit(false);
    }
}
