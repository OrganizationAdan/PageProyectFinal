package com.example.vetnelo.services;

import java.io.Console;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.catalina.User;

public class Conexion {
    Connection conn;

    public Connection openDb() {
        try {
            String usuario = "xino";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            this.conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=veterinaria_Nelo;encrypt=true;trustServerCertificate=true;allowMultiQueries=true;", usuario, password);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            System.out.println(e);
            e.printStackTrace();
        } catch (SQLException exc) {
            System.out.println(exc);
        }
        return conn;
    }
}
