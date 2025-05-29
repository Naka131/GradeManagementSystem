package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Students;


public class StudentlistDAO extends DAO {
	public List<Students> search()
		throws Exception {
		List<Students> stList = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement s;
		s=con.prepareStatement(
			"select * from student");
		ResultSet rs=s.executeQuery();
		
		while (rs.next()) {
	        Students st = new Students();
	        st.setStudent_id(rs.getString("student_id"));
	        st.setSchool_code(rs.getString("school_code"));
	        st.setClass_number(rs.getString("class_number"));
	        st.setStudent_name(rs.getString("student_name"));
	        st.setEnrollment_year(rs.getInt("enrollment_year"));
	        st.setIs_enrolled(rs.getString("is_enrolled"));
	        stList.add(st);
	    }
		
		s.close();
		con.close();
		return stList;
	}
}
