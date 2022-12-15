package entity;

public class Quiz {

    private String quizID;
    private String quizTitle;
//    private String[] questions;
//    private int[] points;

    public Quiz(String quizID, String quizTitle) {
        this.quizID = quizID;
        this.quizTitle = quizTitle;
    }

    public String getQuizId() {
        return quizID;
    }

    public String getQuizTitle() {
        return quizTitle;
    }

}
