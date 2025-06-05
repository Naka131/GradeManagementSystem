package bean;

import java.io.Serializable;

public class Grades implements Serializable{
	  private String student_id;
	  private String student_name;
	  private String school_code;
	  private String class_number;
	  private String subject_code;
	  private String subject_name;
	  private int attempt_number;
	  private int score;

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getSchool_code() {
		return school_code;
	}

	public void setSchool_code(String school_code) {
		this.school_code = school_code;
	}

	public String getClass_number() {
		return class_number;
	}

	public void setClass_number(String class_number) {
		this.class_number = class_number;
	}

	public String getSubject_code() {
		return subject_code;
	}

	public void setSubject_code(String subject_code) {
		this.subject_code = subject_code;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public int getAttempt_number() {
		return attempt_number;
	}

	public void setAttempt_number(int attempt_number) {
		this.attempt_number = attempt_number;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
}