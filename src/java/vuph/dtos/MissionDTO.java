/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Vu PH
 */
public class MissionDTO implements Serializable {

    private String missionId, missionStatus, avengerId, avengerName, avengerStatus;
    private Date missionDate;

    public MissionDTO() {
    }

    public String getAvengerStatus() {
        return avengerStatus;
    }

    public void setAvengerStatus(String avengerStatus) {
        this.avengerStatus = avengerStatus;
    }

    public String getAvengerName() {
        return avengerName;
    }

    public void setAvengerName(String avengerName) {
        this.avengerName = avengerName;
    }

    public MissionDTO(String avengerId, String avengerName, String avengerStatus, Date date) {
        this.avengerId = avengerId;
        this.avengerName = avengerName;
        this.avengerStatus = avengerStatus;
        this.missionDate = date;
    }

    public MissionDTO(String avengerId, String avengerName, String avengerStatus) {
        this.avengerId = avengerId;
        this.avengerName = avengerName;
        this.avengerStatus = avengerStatus;
    }

    public MissionDTO(String missionId, String missionStatus, String avengerId, String avengerStatus, Date date) {
        this.missionId = missionId;
        this.missionStatus = missionStatus;
        this.avengerId = avengerId;
        this.avengerStatus = avengerStatus;
        this.missionDate = date;
    }

    public String getAvengerId() {
        return avengerId;
    }

    public void setAvengerId(String avengerId) {
        this.avengerId = avengerId;
    }

    public MissionDTO(String missionId, String missionStatus, Date date) {
        this.missionId = missionId;
        this.missionStatus = missionStatus;
        this.missionDate = date;
    }

    public String getMissionId() {
        return missionId;
    }

    public void setMissionId(String missionId) {
        this.missionId = missionId;
    }

    public String getMissionStatus() {
        return missionStatus;
    }

    public void setMissionStatus(String missionStatus) {
        this.missionStatus = missionStatus;
    }

    public Date getMissionDate() {
        return missionDate;
    }

    public void setMissionDate(Date missionDate) {
        this.missionDate = missionDate;
    }
}
