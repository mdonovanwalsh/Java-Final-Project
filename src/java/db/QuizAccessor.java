package db;

import db.ConnectionManager;
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
        try {
            init();
            ResultSet rs = selectAllStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("QUIZID");
                String title = rs.getString("QUIZTITLE");
                Quiz item = new Quiz(id, title);
                items.add(item);
            }
        } catch (SQLException ex) {
            items = new ArrayList();
        }
        return items;
    }

    public static Quiz getQuiz(int id) {

        try {
            init();
            selectOne.setInt(1, id);
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
