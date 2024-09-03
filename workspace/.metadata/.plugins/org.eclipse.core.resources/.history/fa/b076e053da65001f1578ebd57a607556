package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTemp {
    private static JDBCTemp instance = null;

    private JDBCTemp() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static JDBCTemp getInstance() {
        if (instance == null) {
            instance = new JDBCTemp();
        }
        return instance;
    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "username", "password");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
