package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.Question;

/**
 *
 * @author kenzi
 */
public class QuestionAccessor {

    private static Connection conn = null;
    private static PreparedStatement selectStatement = null;

    private QuestionAccessor() {
        //private constructor
    }

    private static void init() throws SQLException {
        if (conn == null) {
            conn = ConnectionManager.getConnection(ConnectionParameters.URL, ConnectionParameters.USERNAME, ConnectionParameters.PASSWORD);
            selectStatement = conn.prepareStatement("select * from question join quizQuestion using (questionID) where QUIZID=?");
        }
    }
    
    public static List<Question> getQuestions(String quizID) {
        List<Question> items = new ArrayList();
        String id = quizID;
        ResultSet rs;
        try {
            init();
            selectStatement.setString(1, id);
            rs = selectStatement.executeQuery();
        } catch (SQLException ex) {
            System.err.println("************************");
            System.err.println("** Error retreiving Quizzes");
            System.err.println("** " + ex.getMessage());
            System.err.println("************************");
            return items;
        }
        try {
            while (rs.next()) {
                int answer = rs.getInt("ANSWER");
                String choices = rs.getString("CHOICES");
                String[] breakChoices = choices.split(" \\| " , -1);
                String questionID = rs.getString("QUESTIONID");
                String questionText = rs.getString("QUESTIONTEXT");
                Question item = new Question(answer, breakChoices, questionID, questionText);
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
}