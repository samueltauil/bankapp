package com.sample;

import java.sql.*;

public class BasicSample {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");

        Connection db = DriverManager.getConnection("jdbc:postgresql://cockroachdb-0.cockroachdb.myproject.svc.cluster.local:26257/bank?sslmode=disable", "root", "");

        try {
          
            db.createStatement().execute("DROP table accounts");         

            db.createStatement().execute("CREATE TABLE accounts (id serial PRIMARY KEY, balance INT)");

            db.createStatement().execute("INSERT INTO accounts (id,balance) VALUES (1,1000), (2,250), (3,400), (4,1800)");

            System.out.println("Initial balances:");
            ResultSet res = db.createStatement().executeQuery("SELECT id, balance FROM accounts");
            while (res.next()) {
                System.out.printf("\taccount %s: %s\n", res.getInt("id"), res.getInt("balance"));
            }
        } finally {
            db.close();
        }
    }
}

