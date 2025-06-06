package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import bean.Account;

public class AccountRegisterDAO extends DAO {

	public boolean registerAccount(Account ab) {
		try (Connection con = getConnection()) {
			String sql = "INSERT INTO teacher (teacher_id, password, school_code, teacher_name,access_level) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, ab.getTeacher_id());
			ps.setString(2, ab.getPassword());
			ps.setString(2, ab.getSchool_code());
			ps.setString(3, ab.getTeacher_name());
			ps.setInt(4, ab.getAccess_level());

			int r = ps.executeUpdate();

			if (r != 0) {
				System.out.println("新規登録成功！");
				return true;
			} else {
				System.out.println("新規登録失敗( ﾉД`)ｼｸｼｸ…");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}


