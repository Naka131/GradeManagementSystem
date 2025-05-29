package bean;

import java.io.Serializable;

public class Students implements Serializable{
	  private String student_id;
	  private String school_code;
	  private String class_number;
	  private String student_name;
	  private int enrollment_year;
	  private String is_enrolled;
	  
	public String getStudent_id() {
		return student_id;
	}
	
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
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
	
	public int getEnrollment_year() {
		return enrollment_year;
	}
	
	public void setEnrollment_year(int enrollment_year) {
		this.enrollment_year = enrollment_year;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getIs_enrolled() {
		return is_enrolled;
	}

	public void setIs_enrolled(String is_enrolled) {
		this.is_enrolled = is_enrolled;
	}
}