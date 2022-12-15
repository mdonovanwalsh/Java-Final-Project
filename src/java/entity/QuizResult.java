package entity;
import java.time.LocalDateTime;
public class QuizResult {

    private String resultID;
    private String quizID;
    private String username;
    private LocalDateTime quizStartTime;
    private LocalDateTime quizEndTime;
    private String userAnswers;
    private int scoreNumerator;
    private int scoreDenominator;

    public QuizResult(String resultID, String quizID, String username, LocalDateTime quizStartTime, LocalDateTime quizEndTime, String userAnswers, int scoreNumerator, int scoreDenominator) {
        this.resultID = resultID;
        this.quizID = quizID;
        this.username = username;
        this.quizStartTime = quizStartTime;
        this.quizEndTime = quizEndTime;
        this.userAnswers = userAnswers;
        this.scoreNumerator = scoreNumerator;
        this.scoreDenominator = scoreDenominator;
    }

    public String getResultID() {
        return resultID;
    }

    public String getQuizID() {
        return quizID;
    }

    public String getUsername() {
        return username;
    }

    public LocalDateTime getQuizStartTime() {
        return quizStartTime;
    }

    public LocalDateTime getQuizEndTime() {
        return quizEndTime;
    }
        public String getUserAnswers() {
        return userAnswers;
    }

    public int getScoreNominator() {
        return scoreNumerator;
    }

    public int getScoreDenominator() {
        return scoreDenominator;
    }
}
