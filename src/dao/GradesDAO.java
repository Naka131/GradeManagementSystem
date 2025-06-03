package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Grades;


public class GradesDAO extends DAO {
	public List<Grades> search()
		throws Exception {
		List<Grades> gdList = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement s;
		s=con.prepareStatement(
			"select * from exam");
		ResultSet rs=s.executeQuery();
		
		while (rs.next()) {
	        Grades gd = new Grades();
	        gd.setStudent_id(rs.getString("student_id"));
	        gd.setSchool_code(rs.getString("school_code"));
	        gd.setClass_number(rs.getString("class_number"));
	        gd.setSubject_code(rs.getString("subject_code"));
	        gd.setAttempt_number(rs.getInt("attempt_number"));
	        gd.setScore(rs.getInt("score"));
	        gdList.add(gd);
	    }
		
		s.close();
		con.close();
		return gdList;
	}



	public String delete(String student_id) throws Exception {

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
			"delete from student where student_id=?");
		st.setString(1, student_id);
		st.executeUpdate();
		
		
		st.close();
		con.close();

		return null;
	}
	
	
	public void insert(Grades grades) throws Exception {
        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
        		"INSERT INTO exam (student_id, school_code, class_number,subject_code, attempt_number, score) VALUES (?, ?, ?, ?, ?, ?)");
        st.setString(1, grades.getStudent_id());
        st.setString(2, grades.getSchool_code());
        st.setString(3, grades.getClass_number());
        st.setString(4, grades.getSubject_code());
        st.setInt(5, grades.getAttempt_number());
        st.setInt(6, grades.getScore());
        st.executeUpdate();

        st.close();
        con.close();
    }
	
	
	public String update(String student_id,String is_enrolled) throws Exception {

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
			"UPDATE student SET is_enrolled = ? WHERE student_id = ?");
		st.setString(1, is_enrolled);
		st.setString(2, student_id);
		st.executeUpdate();
		
		
		st.close();
		con.close();

		return null;
	}
}