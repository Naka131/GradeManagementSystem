package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.School;


public class SchoolCodeDAO extends DAO {
	public List<School> search()
		throws Exception {
		List<School> scList = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement s;
		s=con.prepareStatement(
			"select * from school");
		ResultSet rs=s.executeQuery();
		
		while (rs.next()) {
	        School sc = new School();
	        sc.setSchool_code(rs.getString("school_code"));
	        sc.setSchool_name(rs.getString("school_name"));
	        scList.add(sc);
	    }
		
		s.close();
		con.close();
		return scList;
	}
}
