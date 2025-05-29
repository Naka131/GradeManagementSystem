package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import bean.Students;

public class StudentInsertDAO extends DAO {

    public void insert(Students student) throws Exception {
        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
        		"INSERT INTO student (student_id, school_code, class_number,student_name, enrollment_year, is_enrolled) VALUES (?, ?, ?, ?, ?, ?)");
        st.setString(1, student.getStudent_id());
        st.setString(2, student.getSchool_code());
        st.setString(3, student.getClass_number());
        st.setString(4, student.getStudent_name());
        st.setInt(5, student.getEnrollment_year());
        st.setString(6, student.getIs_enrolled());
        st.executeUpdate();

        st.close();
        con.close();
    }
}
