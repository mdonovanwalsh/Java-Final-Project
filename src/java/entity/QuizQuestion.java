package entity;

public class QuizQuestion {

    private String quizID;
    private String questionID;
    private int points;
    
    public QuizQuestion(String quizID, String questionID, int points) {
        this.quizID = quizID;
        this.questionID = questionID;
        this.points = points;
    }

    public String getQuizID() {
        return quizID;
    }

    public String getQuestionID() {
        return questionID;
    }
    
    public int getPoints() {
        return points;
    }

}