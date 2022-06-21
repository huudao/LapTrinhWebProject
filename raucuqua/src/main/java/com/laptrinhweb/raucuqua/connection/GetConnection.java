package com.laptrinhweb.raucuqua.connection;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;

public class GetConnection {
    private static GetConnection getConnection;
    private static Connection con;

    private GetConnection() throws ClassNotFoundException, SQLException {
        Map<String,String> config = readConfig();
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/raucuqua";
        String username = config.get("user_database");
        String password = config.get("password_database");
        con = DriverManager.getConnection(url, username, password);
    }
    public static Map<String,String> readConfig() {

        File f = new File(".config");
        System.out.println(f.getAbsolutePath());

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(f)));
            Map<String, String> data = new HashMap<String, String>();
            String line;
            while ((line = br.readLine()) != null) {
                StringTokenizer st = new StringTokenizer(line, "\t");
                try {
                    data.put(st.nextToken(), st.nextToken());
                } catch (NoSuchElementException x) {

                }
            }
            return data;
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static GetConnection getInstance() throws SQLException, ClassNotFoundException {
        if (getConnection == null)
            getConnection = new GetConnection();
        return getConnection;
    }

    public static Connection getCon() throws SQLException, ClassNotFoundException {
        getInstance();
        return con;
    }

    public static void main(String[] args) {
        try {
            for (Map.Entry<String,String> record:readConfig().entrySet()
            ) {
                System.out.println(record.getKey()+" + "+record.getValue());
            }

            GetConnection getCon = GetConnection.getInstance();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
