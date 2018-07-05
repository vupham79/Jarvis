/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vuph.utils.MyConnection;

/**
 *
 * @author Vu PH
 */
public class RegistrationDAO implements Serializable {

    public String checkLogin(String username, String password) throws ClassNotFoundException, SQLException {
        String role = "";
        String sql = "Select Role from Members "
                + "where AvengerId=? AND Password=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, username);
            preStm.setString(2, password);
            ResultSet rs = preStm.executeQuery();
            if (rs.next()) {
                role = rs.getString("Role");
            }
        }
        return role;
    }
}
