package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Students;


public class StudentDAO extends DAO {
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
	        st.setStudent_kana(rs.getString("student_kana"));
	        st.setEnrollment_year(rs.getInt("enrollment_year"));
	        st.setIs_enrolled(rs.getString("is_enrolled"));
	        stList.add(st);
	    }

		s.close();
		con.close();
		return stList;
	}

	public List<Students> searchdata(String stundet_id)
			throws Exception {
		List<Students> stList = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement s;
		s=con.prepareStatement(
				"select * from student where student_id=?");
		s.setString(1, stundet_id);
		ResultSet rs=s.executeQuery();

		while (rs.next()) {
			Students st = new Students();
			st.setStudent_id(rs.getString("student_id"));
			st.setSchool_code(rs.getString("school_code"));
			st.setClass_number(rs.getString("class_number"));
			st.setStudent_name(rs.getString("student_name"));
			st.setStudent_kana(rs.getString("student_kana"));
			st.setEnrollment_year(rs.getInt("enrollment_year"));
			st.setIs_enrolled(rs.getString("is_enrolled"));
			stList.add(st);
		}

		s.close();
		con.close();
		return stList;
	}

	public List<Students> keywordsearch(String stundet_id,String school_code,String class_number,String student_name)
			throws Exception {
		List<Students> stList = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement s;
		s=con.prepareStatement(
				"select * from student where student_id like ? and school_code like ? and class_number like ? and(student_name like ? or student_kana like ?)");
		s.setString(1, "%" + stundet_id + "%");
		s.setString(2, "%" + school_code + "%");
		s.setString(3, "%" + class_number + "%");
		s.setString(4, "%" + student_name + "%");
		s.setString(5, "%" + student_name + "%");
		ResultSet rs=s.executeQuery();

		while (rs.next()) {
			Students st = new Students();
			st.setStudent_id(rs.getString("student_id"));
			st.setSchool_code(rs.getString("school_code"));
			st.setClass_number(rs.getString("class_number"));
			st.setStudent_name(rs.getString("student_name"));
			st.setStudent_kana(rs.getString("student_kana"));
			st.setEnrollment_year(rs.getInt("enrollment_year"));
			st.setIs_enrolled(rs.getString("is_enrolled"));
			stList.add(st);
		}

		s.close();
		con.close();
		return stList;
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

	public void insert(Students student) throws Exception {
        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
        		"INSERT INTO student (student_id, school_code, class_number,student_name, student_kana, enrollment_year, is_enrolled) VALUES (?, ?, ?, ?, ?, ?, ?)");
        st.setString(1, student.getStudent_id());
        st.setString(2, student.getSchool_code());
        st.setString(3, student.getClass_number());
        st.setString(4, student.getStudent_name());
        st.setString(5, student.getStudent_kana());
        st.setInt(6, student.getEnrollment_year());
        st.setString(7, student.getIs_enrolled());
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