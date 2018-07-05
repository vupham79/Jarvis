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
import vuph.dtos.WeaponDTO;
import vuph.utils.MyConnection;

/**
 *
 * @author Vu PH
 */
public class WeaponDAO implements Serializable {

    public List<WeaponDTO> getWeapons() throws ClassNotFoundException, SQLException {
        List<WeaponDTO> result;
        String sql = "SELECT WeaponId, Name, AvengerId "
                + "FROM Weapon";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String weaponId = rs.getString("WeaponId");
                String name = rs.getString("Name");
                String avengerId = rs.getString("AvengerId");
                result.add(new WeaponDTO(weaponId, name, avengerId));
            }
        }
        return result;
    }

    public List<WeaponDTO> getWeaponsOfOne(String avengerId) throws ClassNotFoundException, SQLException {
        List<WeaponDTO> result;
        String sql = "SELECT WeaponId, Name "
                + "FROM Weapon "
                + "WHERE AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String weaponId = rs.getString("WeaponId");
                String name = rs.getString("Name");
                result.add(new WeaponDTO(weaponId, name, avengerId));
            }
        }
        return result;
    }

    public List<String> getWeaponNotUsed(String avengerId, String missionId) throws ClassNotFoundException, SQLException {
        List<String> result;
        String sql = "SELECT Weapon.WeaponId FROM Weapon "
                + "WHERE Weapon.AvengerId = ? "
                + "EXCEPT "
                + "SELECT WeaponDetail.WeaponId FROM WeaponDetail "
                + "WHERE WeaponDetail.MissionId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            preStm.setString(2, missionId);
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String weaponId = rs.getString("WeaponId");
                result.add(weaponId);
            }
        }
        return result;
    }

    public boolean updateWeapon(WeaponDTO dto) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "UPDATE Weapon SET Name=?, AvengerId=? "
                + "WHERE WeaponId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, dto.getWeaponName());
            preStm.setString(2, dto.getAvengerId());
            preStm.setString(3, dto.getWeaponId());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean removeWeapon(String weaponId) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "DELETE Weapon "
                + "WHERE WeaponId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, weaponId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean addWeapon(WeaponDTO dto) throws SQLException, ClassNotFoundException {
        boolean result;
        String sql = "INSERT INTO Weapon "
                + "(WeaponId,Name,AvengerId) "
                + "VALUES(?,?,?)";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, dto.getWeaponId());
            preStm.setString(2, dto.getWeaponName());
            preStm.setString(3, dto.getAvengerId());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }
}
