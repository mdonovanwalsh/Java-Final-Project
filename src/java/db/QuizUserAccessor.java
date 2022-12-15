package db;

import entity.QuizUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public static QuizUser getUser(String usernameIn) {
        QuizUser user = null;
        ResultSet rs = null;
        try {
            init();
            selectStatement.setString(1, usernameIn);
            rs = selectStatement.executeQuery();
            while (rs.next()) {
                String username = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");
                String permissionLevel = rs.getString("PERMISSIONLEVEL");
                user = new QuizUser(username, password, permissionLevel);
            }
        } catch (SQLException ex) {
            System.err.println("************************");
            System.err.println("** Error retreiving Quiz Users");
            System.err.println("** " + ex.getMessage());
            System.err.println("************************");
            user = null;
        }
        return user;
    }
}
