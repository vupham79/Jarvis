/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vuph.dtos.MissionDTO;
import vuph.dtos.WeaponDTO;
import vuph.utils.MyConnection;

/**
 *
 * @author Vu PH
 */
public class MissionDAO implements Serializable {

    public List<MissionDTO> getMissions() throws ClassNotFoundException, SQLException {
        List<MissionDTO> result = null;
        String sql = "SELECT MissionId, Date, MissionStatus "
                + "FROM Mission";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("MissionId");
                Date date = rs.getDate("Date");
                String status = rs.getString("MissionStatus");
                result.add(new MissionDTO(id, status, date));
            }
        }
        return result;
    }

    public List<MissionDTO> findByLikeId(String search) throws ClassNotFoundException, SQLException {
        List<MissionDTO> result = null;
        String sql = "SELECT MissionId, Date, MissionStatus "
                + "FROM Mission "
                + "WHERE MissionId LIKE ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, "%" + search + "%");
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("MissionId");
                Date date = rs.getDate("Date");
                String status = rs.getString("MissionStatus");
                result.add(new MissionDTO(id, status, date));
            }
        }
        return result;
    }

    public boolean updateMission(MissionDTO dto) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "UPDATE Mission SET Date=?, MissionStatus=? "
                + "WHERE MissionId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setDate(1, dto.getMissionDate());
            preStm.setString(2, dto.getMissionStatus());
            preStm.setString(3, dto.getMissionId());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean removeMission(String missionId) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "DELETE FROM WeaponDetail "
                + "WHERE WeaponDetail.MissionId = ? \n"
                + "DELETE FROM MissionDetail "
                + "WHERE MissionDetail.MissionId = ? \n"
                + "DELETE FROM MarkDetail "
                + "WHERE MarkDetail.MissionId = ? \n"
                + "DELETE Mission "
                + "WHERE MissionId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, missionId);
            preStm.setString(2, missionId);
            preStm.setString(3, missionId);
            preStm.setString(4, missionId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean addMission(MissionDTO dto) throws SQLException, ClassNotFoundException {
        boolean result;
        String sql = "INSERT INTO Mission "
                + "(MissionId,Date,MissionStatus) "
                + "VALUES(?,?,?)";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, dto.getMissionId());
            preStm.setDate(2, dto.getMissionDate());
            preStm.setString(3, dto.getMissionStatus());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public List<MissionDTO> getMissionDetail(String missionId) throws ClassNotFoundException, SQLException {
        List<MissionDTO> result;
        String sql = "Select Members.AvengerId, Members.Fullname, MissionDetail.AvengerStatus "
                + "from Mission "
                + "Inner join MissionDetail On Mission.MissionId = MissionDetail.MissionId "
                + "Inner join Members On MissionDetail.AvengerId = Members.AvengerId "
                + "WHERE Mission.MissionId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, missionId);
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String avengerId = rs.getString("AvengerId");
                String fullname = rs.getString("Fullname");
                String status = rs.getString("AvengerStatus");
                result.add(new MissionDTO(avengerId, fullname, status));
            }
        }
        return result;
    }

    public boolean updateMissionDetail(String status, String missionId, String avengerId) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "UPDATE MissionDetail SET AvengerStatus=? "
                + "WHERE MissionId=? AND AvengerId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, status);
            preStm.setString(2, missionId);
            preStm.setString(3, avengerId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean removeMissionDetail(String missionId, String avengerId) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "DELETE FROM WeaponDetail "
                + "WHERE WeaponDetail.WeaponId IN "
                + "( " 
                + "	SELECT WeaponDetail.WeaponId FROM WeaponDetail "
                + "	INNER JOIN Weapon ON WeaponDetail.WeaponId = Weapon.WeaponId "
                + "	WHERE Weapon.AvengerId = ?"
                + ") "
                + "DELETE MarkDetail "
                + "WHERE MissionId=? AND AvengerId=? "
                + "DELETE MissionDetail "
                + "WHERE MissionId=? AND AvengerId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            preStm.setString(2, missionId);
            preStm.setString(3, avengerId);
            preStm.setString(4, missionId);
            preStm.setString(5, avengerId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean addMissionDetail(String avengerId, String status, String missionId) throws SQLException, ClassNotFoundException {
        boolean result;
        String sql = "INSERT INTO MissionDetail"
                + "(AvengerId, AvengerStatus, MissionId) "
                + "VALUES (?,?,?)";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            preStm.setString(2, status);
            preStm.setString(3, missionId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public List<String> getMissionWeaponsOfOne(String avengerId, String missionId) throws ClassNotFoundException, SQLException {
        List<String> result;
        result = new ArrayList<>();
        String sql1 = "SELECT WeaponDetail.WeaponId From WeaponDetail "
                + "Inner join Mission "
                + "ON WeaponDetail.MissionId = Mission.MissionId "
                + "Inner join Weapon "
                + "ON WeaponDetail.WeaponId = Weapon.WeaponId "
                + "WHERE WeaponDetail.MissionId = ? AND Weapon.AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql1)) {
            preStm.setString(1, missionId);
            preStm.setString(2, avengerId);
            ResultSet rs = preStm.executeQuery();
            while (rs.next()) {
                String weaponId = rs.getString("WeaponId");
                result.add(weaponId);
            }
        }
        String sql2 = "SELECT MarkDetail.MarkId FROM MarkDetail "
                + "INNER JOIN Mission "
                + "ON MarkDetail.MissionId = Mission.MissionId "
                + "INNER JOIN Marks "
                + "ON MarkDetail.MarkId = Marks.MarkId "
                + "Where Mission.MissionId = ? AND MarkDetail.AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql2)) {
            preStm.setString(1, missionId);
            preStm.setString(2, avengerId);
            ResultSet rs = preStm.executeQuery();
            while (rs.next()) {
                String weaponId = rs.getString("MarkId");
                result.add(weaponId);
            }
        }
        return result;
    }

    public boolean addMissionWeaponOfOne(String weaponId, String avengerId, String missionId, String type) throws ClassNotFoundException, SQLException {
        boolean result;
        if (type.equals("Weapon")) {
            String sql = "INSERT INTO WeaponDetail(WeaponId, MissionId) "
                    + "VALUES (?,?)";
            try (Connection conn = MyConnection.getConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql)) {
                preStm.setString(1, weaponId);
                preStm.setString(2, missionId);
                result = preStm.executeUpdate() > 0;
            }
        } else {
            String sql = "INSERT INTO MarkDetail(MarkId, MissionId, AvengerId) "
                    + "VALUES (?,?,?)";
            try (Connection conn = MyConnection.getConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql)) {
                preStm.setString(1, weaponId);
                preStm.setString(2, missionId);
                preStm.setString(3, avengerId);
                result = preStm.executeUpdate() > 0;
            }
        }
        return result;
    }

    public boolean removeMissionWeaponDetail(String missionId, String weaponId, String type) throws ClassNotFoundException, SQLException {
        boolean result;
        if (type.equals("Weapon")) {
            String sql = "DELETE WeaponDetail "
                    + "WHERE WeaponId=? AND MissionId=?";
            try (Connection conn = MyConnection.getConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql)) {
                preStm.setString(1, weaponId);
                preStm.setString(2, missionId);
                result = preStm.executeUpdate() > 0;
            }
        } else {
            String sql = "DELETE MarkDetail "
                    + "WHERE MarkDetail.MarkId = ? AND MarkDetail.MissionId = ?";
            try (Connection conn = MyConnection.getConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql)) {
                preStm.setString(1, weaponId);
                preStm.setString(2, missionId);
                result = preStm.executeUpdate() > 0;
            }
        }
        return result;
    }

    public List<String> getMissionsNotJoin(String avengerId) throws ClassNotFoundException, SQLException {
        List<String> result = null;
        String sql = "SELECT Mission.MissionId "
                + "FROM Mission "
                + "WHERE MissionStatus = 'In Process'"
                + "EXCEPT "
                + "SELECT MissionDetail.MissionId FROM MissionDetail "
                + "WHERE AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("MissionId");
                result.add(id);
            }
        }
        return result;
    }

    public List<MissionDTO> getMissionsOfOne(String avengerId) throws ClassNotFoundException, SQLException {
        List<MissionDTO> result = null;
        String sql = "SELECT Mission.MissionId, Mission.Date, Mission.MissionStatus, MissionDetail.AvengerStatus FROM Mission "
                + "INNER JOIN MissionDetail "
                + "ON Mission.MissionId = MissionDetail.MissionId "
                + "WHERE MissionDetail.AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerId);
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("MissionId");
                Date date = rs.getDate("Date");
                String status = rs.getString("MissionStatus");
                String taskStatus = rs.getString("AvengerStatus");
                result.add(new MissionDTO(id, status, avengerId, taskStatus, date));
            }
        }
        return result;
    }

    public boolean removeMissionOfOne(String missionId, String avengerId) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "DELETE MissionDetail "
                + "WHERE MissionId = ? AND AvengerId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, missionId);
            preStm.setString(2, avengerId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean updateMissionOfOne(String missionId, String avengerId, String avengerStatus) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "UPDATE MissionDetail SET AvengerStatus=? "
                + "WHERE MissionId=? AND AvengerId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, avengerStatus);
            preStm.setString(2, missionId);
            preStm.setString(3, avengerId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean addMissionOfOne(String missionId, String avengerId, String avengerStatus) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "INSERT INTO MissionDetail(MissionId, AvengerId, AvengerStatus) "
                + "VALUES (?,?,?)";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, missionId);
            preStm.setString(2, avengerId);
            preStm.setString(3, avengerStatus);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean removeMissionWeaponOfOne(String missionId, String weaponId, String type) throws ClassNotFoundException, SQLException {
        boolean result;
        if (type.equals("Weapon")) {
            String sql = "DELETE MissionDetail "
                    + "WHERE WeaponId=? AND MissionId=?";
            try (Connection conn = MyConnection.getConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql)) {
                preStm.setString(1, weaponId);
                preStm.setString(2, missionId);
                result = preStm.executeUpdate() > 0;
            }
        } else {
            String sql = "DELETE MarkDetail "
                    + "WHERE MarkId=? AND MissionId=?";
            try (Connection conn = MyConnection.getConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql)) {
                preStm.setString(1, weaponId);
                preStm.setString(2, missionId);
                result = preStm.executeUpdate() > 0;
            }
        }
        return result;
    }

    public List<WeaponDTO> getMissionMarks(String missionId) throws ClassNotFoundException, SQLException {
        List<WeaponDTO> result = null;
        String sql = "SELECT MarkDetail.AvengerId, MarkDetail.MarkId FROM MarkDetail "
                + "INNER JOIN Mission "
                + "ON MarkDetail.MissionId = Mission.MissionId "
                + "WHERE Mission.MissionId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, missionId);
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String avengerId = rs.getString("AvengerId");
                String markId = rs.getString("MarkId");
                result.add(new WeaponDTO(markId, avengerId));
            }
        }
        return result;
    }
}
