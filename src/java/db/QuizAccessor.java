package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.Quiz;

/**
 *
 * @author kenzi
 */
public class QuizAccessor {

    private static Connection conn = null;
    private static PreparedStatement selectAllStatement = null;
    private static PreparedStatement selectOne = null;

    private QuizAccessor() {
        //private constructor
    }

    private static void init() throws SQLException {
        if (conn == null) {
            conn = ConnectionManager.getConnection(ConnectionParameters.URL, ConnectionParameters.USERNAME, ConnectionParameters.PASSWORD);
            selectAllStatement = conn.prepareStatement("select * from quiz");
            selectOne = conn.prepareStatement("select * from quiz where QUIZID=?");
        }
    }


    public static List<Quiz> getAllQuizzes() {
        List<Quiz> items = new ArrayList();
        ResultSet rs;
        try {
            init();
            rs = selectAllStatement.executeQuery();
        } catch (SQLException ex) {
            System.err.println("************************");
            System.err.println("** Error retreiving Quizzes");
            System.err.println("** " + ex.getMessage());
            System.err.println("************************");
            return items;
        }
        try {
            while (rs.next()) {
                String id = rs.getString("QUIZID");
                System.out.println("The id is" + id);
                String title = rs.getString("QUIZTITLE");
                Quiz item = new Quiz(id, title);
                items.add(item);
            }
        } catch (SQLException ex) {
            System.err.println("************************");
            System.err.println("** Error populating Quizzes");
            System.err.println("** " + ex.getMessage());
            System.err.println("************************");
        }
        return items;
    }

    public static Quiz getQuiz(String id) {

        try {
            init();
            selectOne.setString(1, id);
            ResultSet rs = selectOne.executeQuery();
            while (rs.next()) {
                String title = rs.getString("QUIZTITLE");
                Quiz item = new Quiz(id, title);
                return item;
            }

        } catch (SQLException ex) {
            System.out.println("" + ex.getMessage());
            return null;
        }
        return null;
    }
}
