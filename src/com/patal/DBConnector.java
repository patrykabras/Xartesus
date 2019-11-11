package com.patal;
import java.sql.*;

public class DBConnector {
    private static Connection con;
    private static String url = "jdbc:mysql://localhost:3306/xartesus";
    private static String user = "root";
    private static String password = "";
    public DBConnector() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static void sendSQL(String sql){
        try {
            con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
                System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));

            con.close();
        } catch (SQLException  e) {
            e.printStackTrace();
        }
    }
    public static ResultSet getSQL(String sql){
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            con.close();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}
