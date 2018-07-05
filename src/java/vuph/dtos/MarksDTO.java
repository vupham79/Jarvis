/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.dtos;

import java.io.Serializable;

/**
 *
 * @author Vu PH
 */
public class MarksDTO implements Serializable {

    private String markId, markStatus, missionId, avengerId;

    public MarksDTO() {
    }

    public MarksDTO(String markId, String markStatus, String missionId, String avengerId) {
        this.markId = markId;
        this.markStatus = markStatus;
        this.missionId = missionId;
        this.avengerId = avengerId;
    }

    public MarksDTO(String markId, String markStatus) {
        this.markId = markId;
        this.markStatus = markStatus;
    }

    public String getMarkId() {
        return markId;
    }

    public void setMarkId(String markId) {
        this.markId = markId;
    }

    public String getMarkStatus() {
        return markStatus;
    }

    public void setMarkStatus(String markStatus) {
        this.markStatus = markStatus;
    }

    public String getMissionId() {
        return missionId;
    }

    public void setMissionId(String missionId) {
        this.missionId = missionId;
    }

    public String getAvengerId() {
        return avengerId;
    }

    public void setAvengerId(String avengerId) {
        this.avengerId = avengerId;
    }

}
