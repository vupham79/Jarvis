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
import java.util.ArrayList;
import java.util.List;
import vuph.dtos.AvengerDTO;
import vuph.utils.MyConnection;

/**
 *
 * @author Vu PH
 */
public class AvengerDAO implements Serializable {

    public List<AvengerDTO> getAllMembers() throws ClassNotFoundException, SQLException {
        List<AvengerDTO> result;
        String sql = "SELECT AvengerId, Fullname, Role, Status "
                + "FROM Members";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("AvengerId");
                String fullname = rs.getString("Fullname");
                String role = rs.getString("Role");
                String status = rs.getString("Status");
                result.add(new AvengerDTO(id, fullname, role, status));
            }
        }
        return result;
    }

    public List<String> getAvengers() throws ClassNotFoundException, SQLException {
        List<String> result;
        String sql = "SELECT AvengerId FROM Members "
                + "WHERE AvengerId NOT IN ('jarvis')";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("AvengerId");
                result.add(id);
            }
        }
        return result;
    }

    public AvengerDTO getAvenger(String avengerId) throws ClassNotFoundException, SQLException {
        AvengerDTO result = null;
        String sql = "Select Fullname, Role, Status From Members "
                + "WHERE AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            ResultSet rs = preStm.executeQuery();
            if (rs.next()) {
                String role = rs.getString("Role");
                String fullname = rs.getString("Fullname");
                String status = rs.getString("Status");
                result = new AvengerDTO(avengerId, fullname, role, status);
            }
        }
        return result;
    }

    public String getPasswordOfOne(String avengerId) throws ClassNotFoundException, SQLException {
        String result = null;
        String sql = "Select Password From Members "
                + "WHERE AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            ResultSet rs = preStm.executeQuery();
            if (rs.next()) {
                String password = rs.getString("Password");
                result = password;
            }
        }
        return result;
    }

    public boolean updateAvengerAsAdmin(AvengerDTO dto) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "UPDATE Members SET Password=?, Fullname=?, Role=?, Status=? "
                + "WHERE AvengerId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(2, dto.getFullname());
            preStm.setString(1, dto.getPassword());
            preStm.setString(3, dto.getRole());
            preStm.setString(4, dto.getStatus());
            preStm.setString(5, dto.getAvengerId());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean updateAvengerAsUser(AvengerDTO dto) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "UPDATE Members SET Password=?, Fullname=?, Status=? "
                + "WHERE AvengerId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, dto.getPassword());
            preStm.setString(2, dto.getFullname());
            preStm.setString(3, dto.getStatus());
            preStm.setString(4, dto.getAvengerId());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean removeAvenger(String avengerId) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "DELETE FROM MissionDetail "
                + "WHERE MissionDetail.AvengerId = ? "
                + "DELETE FROM Members "
                + "WHERE Members.AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            preStm.setString(2, avengerId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean addAvenger(AvengerDTO dto) throws SQLException, ClassNotFoundException {
        boolean result;
        String sql = "INSERT INTO Members "
                + "(AvengerId,Password,Fullname,Role,Status) "
                + "VALUES(?,?,?,?,?)";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, dto.getAvengerId());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getFullname());
            preStm.setString(4, dto.getRole());
            preStm.setString(5, dto.getStatus());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public List<AvengerDTO> findByLikeFullname(String search) throws ClassNotFoundException, SQLException {
        List<AvengerDTO> result;
        String sql = "SELECT AvengerId, Fullname, Role, Status "
                + "FROM Members "
                + "WHERE Fullname LIKE ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, "%" + search + "%");
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("AvengerId");
                String fullname = rs.getString("Fullname");
                String role = rs.getString("Role");
                String status = rs.getString("Status");
                result.add(new AvengerDTO(id, fullname, role, status));
            }
        }
        return result;
    }
}
