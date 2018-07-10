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
import vuph.dtos.MarksDTO;
import vuph.utils.MyConnection;

/**
 *
 * @author Vu PH
 */
public class MarksDAO implements Serializable {

    public boolean updateMarkImage(String markId, String path) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "UPDATE Marks SET Image=? "
                + "WHERE MarkId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, path);
            preStm.setString(2, markId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public List<MarksDTO> getAllMarks() throws ClassNotFoundException, SQLException {
        List<MarksDTO> result;
        String sql = "SELECT MarkId, MarkStatus "
                + "FROM Marks";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("MarkId");
                String status = rs.getString("MarkStatus");
                result.add(new MarksDTO(id, status));
            }
        }
        return result;
    }

    public List<String> getMarksNotUsedOfMission(String missionId) throws ClassNotFoundException, SQLException {
        List<String> result;
        String sql = "SELECT Marks.MarkId FROM Marks "
                + "WHERE Marks.MarkStatus = 'Active' "
                + "EXCEPT "
                + "SELECT Marks.MarkId FROM Marks "
                + "INNER JOIN MarkDetail "
                + "ON Marks.MarkId = MarkDetail.MarkId "
                + "WHERE MarkDetail.MissionId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, missionId);
            ResultSet rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("MarkId");
                result.add(id);
            }
        }
        return result;
    }

    public boolean updateMark(MarksDTO dto) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "UPDATE Marks SET MarkStatus=? "
                + "WHERE MarkId=?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, dto.getMarkStatus());
            preStm.setString(2, dto.getMarkId());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean removeMark(String markId) throws ClassNotFoundException, SQLException {
        boolean result;
        String sql = "DELETE FROM MarkDetail "
                + "WHERE MarkDetail.MarkId = ? "
                + "DELETE FROM Marks "
                + "WHERE Marks.MarkId = ?";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, markId);
            preStm.setString(2, markId);
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }

    public boolean addMark(MarksDTO dto) throws SQLException, ClassNotFoundException {
        boolean result;
        String sql = "INSERT INTO Marks "
                + "(MarkId, MarkStatus) "
                + "VALUES(?,?)";
        try (Connection conn = MyConnection.getConnection();
                PreparedStatement preStm = conn.prepareStatement(sql)) {
            preStm.setString(1, dto.getMarkId());
            preStm.setString(2, dto.getMarkStatus());
            result = preStm.executeUpdate() > 0;
        }
        return result;
    }
}
