package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Class;;


public class ClassNumberDAO extends DAO {
	public List<Class> search(String school_code)
		throws Exception {
		List<Class> cList = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement s;
		s=con.prepareStatement(
			"select * from class where school_code=?");
		s.setString(1, school_code);
		ResultSet rs=s.executeQuery();

		while (rs.next()) {
	        Class c = new Class();
	        c.setClass_number(rs.getString("class_number"));
	        cList.add(c);
	    }

		s.close();
		con.close();
		return cList;
	}
}
