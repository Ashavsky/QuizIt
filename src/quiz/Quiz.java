package quiz;
import java.util.*; 
public class Quiz {
	
	// TODO: Might want to track user statistics in the future for the quiz summary page
	// Example fields for the quiz summary page to store this info in the database. 
	
	private long timeTaken; 
	private double percentCorrect;
	private Date dateTaken; 
	
	private boolean isPractice; 
	//TODO: Implement scoring the actual questions 
	private List<Question> questions;
	
	public Quiz(List<Question> questions) {
		this.questions = questions; 
		this.isPractice = false; 
	}
	
	// Randomizes the list of questions if the player wants random questions 
	public void randomizeQuestions() {
		Collections.shuffle(questions);
	}
	
	// Sets the Quiz to "practice mode" if the user wants 
	public void setPractice() {
		isPractice = true; 
	}
	
	public void questionsToString() {
		for(int i = 0; i < questions.size(); i++) {
			System.out.println(questions.get(i).toString());
		}
	}
}
