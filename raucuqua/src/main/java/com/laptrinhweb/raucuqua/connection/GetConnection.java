package com.laptrinhweb.raucuqua.connection;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Stream;

public class GetConnection {
    private static GetConnection getConnection;
    private static Connection con;
    private static ConnectionPool pool;

    private GetConnection() throws ClassNotFoundException, SQLException {
        Map<String, String> config = readConfig();
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/raucuqua";
        String username = config.get("user_database");
        String password = config.get("password_database");
        con = DriverManager.getConnection(url, username, password);
        pool = new BasicConnectionPool(url, username, password);
    }
    //property
    public static Map<String, String> readConfig() {

//        File f = new File(".config");
//        File m = new File("db.property");
        InputStream reader = GetConnection.class.getClassLoader().getResourceAsStream(".config");
//        InputStream reader = GetConnection.class.getClassLoader().;
//        InputStream n = GetConnection.class.getClassLoader().getResourceAsStream("test.properties");
//        System.out.println("cannonical "+n);

//        Properties p = new Properties();
//        try {
//            System.out.println("reader "+reader);
//            p.load(reader);
//            System.out.println(p.keys());
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }

//        System.out.println(f.getAbsolutePath());
//        System.out.println("java.class.path "+System.getProperty("java.class.path"));
//        System.out.println("java.home "+System.getProperty("java.home"));
//        System.out.println("java.vendor "+System.getProperty("java.vendor"));
//        System.out.println("java.vendor.url "+System.getProperty("java.vendor.url"));
//        System.out.println("os.arch "+System.getProperty("os.arch"));
//        System.out.println("os.name "+System.getProperty("os.name"));
//        System.out.println("os.version "+System.getProperty("os.version"));
//        System.out.println("path.separator "+System.getProperty("path.separator"));
//        System.out.println("user.dir "+System.getProperty("user.dir"));
//        System.out.println("user.home "+System.getProperty("user.home"));
//        System.out.println("user.name "+System.getProperty("user.name"));
//
//        System.out.println();
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(reader));
            Map<String, String> data = new HashMap<String, String>();
            String line;
            while ((line = br.readLine()) != null) {
                System.out.println(line);
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
        Connection selfCon;
        try {
            selfCon = pool.getConnection();
            System.out.println("[no error]");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("[err] ");
            selfCon = con;
        }
        return selfCon;
    }

    public static void releaseConection(Connection con) {
        try {
            pool.releaseConnection(con);
        }catch (Exception e){

        }
    }

    public static int sizePool() {
        return pool.getSize();
    }

    public static void main(String[] args) {
        try {
            for (Map.Entry<String, String> record : readConfig().entrySet()
            ) {
                System.out.println(record.getKey() + " + " + record.getValue());
            }

            GetConnection getCon = GetConnection.getInstance();
            Connection con = getCon();
            System.out.println(sizePool());
            Connection con1 = getCon();
            System.out.println(sizePool());
            Connection con2 = getCon();
            System.out.println(sizePool());
            Connection con3 = getCon();
            System.out.println(sizePool());
            releaseConection(con);
            releaseConection(con1);
            releaseConection(con2);
            releaseConection(con3);

            System.out.println(sizePool());

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
