package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.QuizUser;

/**
 *
 * @author kenzi
 */
public class QuizUserAccessor {

    private static Connection conn = null;
    private static PreparedStatement selectStatement = null;

    private QuizUserAccessor() {
        //private constructor
    }

    private static void init() throws SQLException {
        if (conn == null) {
            conn = ConnectionManager.getConnection(ConnectionParameters.URL, ConnectionParameters.USERNAME, ConnectionParameters.PASSWORD);
            selectStatement = conn.prepareStatement("select * from quizappuser where username=?");
        }
    }


    public static boolean verifyUser() {
        boolean verify;
        ResultSet rs = null;
        try {
            init();
            rs = selectStatement.executeQuery();
            if (rs != null) {
                String password = rs.getString("PASSWORD");
                String encryptedPassword = encode(password);
            } else {
                verify = false;
            }
        } catch (SQLException ex) {
            System.err.println("************************");
            System.err.println("** Error retreiving Quiz Users");
            System.err.println("** " + ex.getMessage());
            System.err.println("************************");
            verify = false;
        }
        return verify;
    }
}
