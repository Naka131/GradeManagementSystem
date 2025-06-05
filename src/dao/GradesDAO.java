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
			"select e.student_id, st.student_name, e.school_code, e.class_number, s.subject_name, e.attempt_number, e.score from exam e left join subject  s on e.subject_code = s.subject_code left join student st on e.student_id = st.student_id");
		ResultSet rs=s.executeQuery();

		while (rs.next()) {
	        Grades gd = new Grades();
	        gd.setStudent_id(rs.getString("student_id"));
	        gd.setStudent_name(rs.getString("student_name"));
	        gd.setSchool_code(rs.getString("school_code"));
	        gd.setClass_number(rs.getString("class_number"));
	        gd.setSubject_name(rs.getString("subject_name"));
	        gd.setAttempt_number(rs.getInt("attempt_number"));
	        gd.setScore(rs.getInt("score"));
	        gdList.add(gd);
	    }

		s.close();
		con.close();
		return gdList;
	}

	public List<Grades> keywordsearch(String keyword) throws Exception {
		List<Grades> gdList = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement s;
		s = con.prepareStatement(
				"select e.student_id, st.student_name, e.school_code, "
				+ "e.class_number, s.subject_name, e.attempt_number, e.score "
				+ "from exam e left join subject  s on e.subject_code = s.subject_"
				+ "code left join student st on e.student_id = st.student_id where "
				+ "e.student_id like ? or e.school_code like ? or e.class_number "
				+ "like ? or s.subject_code like ? or attempt_number like ? or "
				+ "score like ?");
		s.setString(1, "%" + keyword + "%");
		s.setString(2, "%" + keyword + "%");
		s.setString(3, "%" + keyword + "%");
		s.setString(4, "%" + keyword + "%");
		s.setString(5, "%" + keyword + "%");
		s.setString(6, "%" + keyword + "%");
		ResultSet rs = s.executeQuery();

		while (rs.next()) {
			Grades gd = new Grades();
			gd.setStudent_id(rs.getString("student_id"));
			gd.setStudent_name(rs.getString("student_name"));
			gd.setSchool_code(rs.getString("school_code"));
			gd.setClass_number(rs.getString("class_number"));
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
        		"INSERT INTO exam (student_id, school_code, class_number,subject_code, attempt_number, score) VALUES (?, ?, ?, (select subject_code from subject where subject_name = ?), ?, ?)");
        st.setString(1, grades.getStudent_id());
        st.setString(2, grades.getSchool_code());
        st.setString(3, grades.getClass_number());
        st.setString(4, grades.getSubject_name());
        st.setInt(5, grades.getAttempt_number());
        st.setInt(6, grades.getScore());
        st.executeUpdate();

        st.close();
        con.close();
    }


	public String update(int update_score,int update_attempt_number,String upadte_subject_code,String student_id,String subject_code,int attempt_number) throws Exception {

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
			"UPDATE exam SET subject_code=?, attempt_number=?, score=? WHERE student_id=? and subject_code=? and attempt_number=?");
		st.setString(1, upadte_subject_code);
		st.setInt(2, update_attempt_number);
		st.setInt(3, update_score);
		st.setString(4, student_id);
		st.setString(5, subject_code);
		st.setInt(6, attempt_number);
		st.executeUpdate();


		st.close();
		con.close();

		return null;
	}
}