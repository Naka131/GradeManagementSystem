package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Subjects;


public class SubjectsDAO extends DAO {
	public List<Subjects> search()
		throws Exception {
		List<Subjects> sjList = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement s;
		s=con.prepareStatement(
			"select * from subject");
		ResultSet rs=s.executeQuery();

		while (rs.next()) {
	        Subjects sj = new Subjects();
	        sj.setSubject_code(rs.getString("subject_code"));
	        sj.setSubject_name(rs.getString("subject_name"));
	        sjList.add(sj);
	    }

		s.close();
		con.close();
		return sjList;
	}
	public String searchcode(String subject_name)
			throws Exception {
		
		Connection con=getConnection();
		System.out.println("1");
		PreparedStatement s;
		s=con.prepareStatement(
				"select * from subject where subject_name = ?");
		s.setString(1, subject_name);
		ResultSet rs=s.executeQuery();
		System.out.println("2");
		String subject_code = "";
		while(rs.next()){
			subject_code = rs.getString("subject_code");
		}
		System.out.println("3");
		
		s.close();
		con.close();
		return subject_code;
	}
	public void insert(Subjects sj) throws Exception {

		try (Connection con = getConnection();
				PreparedStatement s = con.prepareStatement(
	                    "INSERT INTO Subject (subject_code, subject_name) VALUES (?, ?)")){
			s.setString(1, sj.getSubject_code());
			s.setString(2, sj.getSubject_name());

			s.executeUpdate();
		}
}
	public String update(String update_subject_code,String subject_name, String subject_code) throws Exception {

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
			"UPDATE subject SET subject_code = ?, subject_name = ? WHERE subject_code = ?");
		st.setString(1, update_subject_code);
		st.setString(2, subject_name);
		st.setString(3, subject_code);
		st.executeUpdate();


		st.close();
		con.close();

		return null;
	}
	public String delete(String subject_code) throws Exception {

		Connection con=getConnection();

		PreparedStatement s=con.prepareStatement(
			"delete from subject where subject_code=?");
		s.setString(1, subject_code);
		s.executeUpdate();


		s.close();
		con.close();

		return null;
	}

}
