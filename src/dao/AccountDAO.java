package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Account;

public class AccountDAO extends DAO {

    public Account findAccount(Account ab) {
        Account returnAb = null;

        try (Connection con = getConnection()) {
            String sql = "SELECT * FROM teacher WHERE teacher_id = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ab.getTeacher_id());
            ps.setString(2, ab.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                returnAb = new Account();
                returnAb.setTeacher_id(rs.getString("teacher_id"));
                returnAb.setPassword(rs.getString("password"));
                returnAb.setSchool_code(rs.getString("school_code"));
                returnAb.setTeacher_name(rs.getString("teacher_name"));
                returnAb.setAccess_level(rs.getInt("access_level"));
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return returnAb;
    }
    
    public List<Account> Accoutsearch()
    		throws Exception {
    		List<Account> acList = new ArrayList<>();

    		Connection con=getConnection();

    		PreparedStatement s;
    		s=con.prepareStatement(
    			"select * from teacher order by access_level asc");
    		ResultSet rs=s.executeQuery();
    		
    		while (rs.next()) {
    	        Account ac = new Account();
    	        ac.setTeacher_id(rs.getString("teacher_id"));
    	        ac.setSchool_code(rs.getString("school_code"));
    	        ac.setTeacher_name(rs.getString("teacher_name"));
    	        ac.setAccess_level(rs.getInt("access_level"));
    	        acList.add(ac);
    	    }
    		
    		s.close();
    		con.close();
    		return acList;
    	}
    
    
    public boolean registerAccount(Account ab)throws Exception {
		try (Connection con = getConnection()) {
			String sql = "INSERT INTO teacher "
					+ "(teacher_id, password, school_code, teacher_name,access_level) "
					+ "VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, ab.getTeacher_id());
			ps.setString(2, ab.getPassword());
			ps.setString(3, ab.getSchool_code());
			ps.setString(4, ab.getTeacher_name());
			ps.setInt(5, ab.getAccess_level());

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
	        throw e;
	    }
	}
    
    public String Accountdelete(String teacher_id) throws Exception {

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
			"delete from teacher where teacher_id=?");
		st.setString(1, teacher_id);
		st.executeUpdate();
		
		
		st.close();
		con.close();

		return null;
	}
    
    public String update(String teacher_id,int access_level) throws Exception {

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
			"UPDATE teacher SET access_level = ? WHERE teacher_id = ?");
		st.setInt(1, access_level);
		st.setString(2, teacher_id);
		st.executeUpdate();
		
		
		st.close();
		con.close();

		return null;
	}
}


