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
			"select e.student_id, st.student_name, st.student_kana,e.school_code, e.class_number, e.subject_name, e.subject_code, e.attempt_number, e.score from exam e left join student st on e.student_id = st.student_id");
		ResultSet rs=s.executeQuery();

		while (rs.next()) {
	        Grades gd = new Grades();
	        gd.setStudent_id(rs.getString("student_id"));
	        gd.setStudent_name(rs.getString("student_name"));
	        gd.setStudent_kana(rs.getString("student_kana"));
	        gd.setSchool_code(rs.getString("school_code"));
	        gd.setClass_number(rs.getString("class_number"));
	        gd.setSubject_code(rs.getString("subject_code"));
	        gd.setSubject_name(rs.getString("subject_name"));
	        gd.setAttempt_number(rs.getInt("attempt_number"));
	        gd.setScore(rs.getInt("score"));
	        gdList.add(gd);
	    }

		s.close();
		con.close();
		return gdList;
	}

	public List<Grades> keywordsearch(String student_id,String school_code,String class_number,String subject_name,String attempt_number,String student_name) throws Exception {
		List<Grades> gdList = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement s;
		s = con.prepareStatement(
				"select e.student_id, st.student_name, st.student_kana, e.school_code, "
				+ "e.class_number, e.subject_name, e.subject_code, e.attempt_number, e.score "
				+ "from exam e "
				+ "left join student st on e.student_id = st.student_id where "
				+ "e.student_id like ? and e.school_code like ? and e.class_number "
				+ "like ? and subject_name like ? and attempt_number like ? and (st.student_name like ? OR st.student_kana like ?)");
		s.setString(1, "%" + student_id + "%");
		s.setString(2, "%" + school_code + "%");
		s.setString(3, "%" + class_number + "%");
		s.setString(4, "%" + subject_name + "%");
		s.setString(5, "%" + attempt_number + "%");
		s.setString(6, "%" + student_name + "%");
		s.setString(7, "%" + student_name + "%");
		ResultSet rs = s.executeQuery();

		while (rs.next()) {
			Grades gd = new Grades();
			gd.setStudent_id(rs.getString("student_id"));
			gd.setStudent_name(rs.getString("student_name"));
			gd.setStudent_kana(rs.getString("student_kana"));
			gd.setSchool_code(rs.getString("school_code"));
			gd.setClass_number(rs.getString("class_number"));
			gd.setSubject_code(rs.getString("subject_code"));
			gd.setSubject_name(rs.getString("subject_name"));
			gd.setAttempt_number(rs.getInt("attempt_number"));
			gd.setScore(rs.getInt("score"));
			gdList.add(gd);
		}

		s.close();
		con.close();

		return gdList;
	}



	public String delete(String student_id,String subject_code,int attempt_number) throws Exception {

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
			"delete from exam where student_id=? and subject_code=? and attempt_number=?");
		st.setString(1, student_id);
		st.setString(2, subject_code);
		st.setInt(3, attempt_number);
		st.executeUpdate();


		st.close();
		con.close();

		return null;
	}


	public void insert(Grades grades) throws Exception {
        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
        		"INSERT INTO exam (student_id, school_code, class_number,subject_code, subject_name, attempt_number, score) VALUES (?, ?, ?, (select subject_code from subject where subject_name = ?), ?, ?, ?)");
        st.setString(1, grades.getStudent_id());
        st.setString(2, grades.getSchool_code());
        st.setString(3, grades.getClass_number());
        st.setString(4, grades.getSubject_name());
        st.setString(5, grades.getSubject_name());
        st.setInt(6, grades.getAttempt_number());
        st.setInt(7, grades.getScore());
        st.executeUpdate();

        st.close();
        con.close();
    }


	public String update(int update_score,int update_attempt_number,String update_subject_name,String student_id,String subject_name,int attempt_number) throws Exception {


		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(

			"UPDATE exam SET subject_code=(select subject_code from subject where subject_name = ?), attempt_number=?, score=?, subject_name=? WHERE student_id=? and subject_name=? and attempt_number=?");

		st.setString(1, update_subject_name);
		st.setInt(2, update_attempt_number);
		st.setInt(3, update_score);
		st.setString(4, update_subject_name);
		st.setString(5, student_id);
		st.setString(6, subject_name);
		st.setInt(7, attempt_number);
		st.executeUpdate();


		st.close();
		con.close();

		return null;
	}
}