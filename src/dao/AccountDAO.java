package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}


