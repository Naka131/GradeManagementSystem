package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StudentUpdateDAO extends DAO {

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
