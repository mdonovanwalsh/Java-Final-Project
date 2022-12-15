package entity;
public class Question {

    private int answer;
    private String[] choices; //array of strings
    public String questionID;
    public String questionText;

    public Question(int answer, String[] choices, String questionID, String questionText) {
        this.answer = answer;
        this.choices = choices;
        this.questionID = questionID;
        this.questionText = questionText;
    }

    public int getAnswer() {
        return answer;
    }
    public String[] getChoices() {
        return choices;
    }
    public String getQuestionID(){
        return questionID;
    }
    public String getQuestionText(){
        return questionText;
    }
}
