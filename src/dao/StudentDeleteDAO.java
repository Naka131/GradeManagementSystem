package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StudentDeleteDAO extends DAO {

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
}
