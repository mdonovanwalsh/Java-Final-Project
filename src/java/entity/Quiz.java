package entity;

public class Quiz {

    private int quizID;
    private String quizTitle;

    public Quiz(int quizID, String quizTitle) {
        this.quizID = quizID;
        this.quizTitle = quizTitle;
    }
    
        public int getQuizId() {
        return quizID;
    }

    public String getQuizTitle() {
        return quizTitle;
    }
}
