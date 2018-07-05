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
public class WeaponDTO implements Serializable {
    private String weaponId, weaponName,avengerId, missionId;

    public WeaponDTO() {
    }

    public WeaponDTO(String weaponId, String weaponName, String avengerId, String missionId) {
        this.weaponId = weaponId;
        this.weaponName = weaponName;
        this.avengerId = avengerId;
        this.missionId = missionId;
    }

    public WeaponDTO(String weaponId, String avengerId) {
        this.weaponId = weaponId;
        this.avengerId = avengerId;
    }

    public WeaponDTO(String weaponId, String weaponName, String avengerId) {
        this.weaponId = weaponId;
        this.weaponName = weaponName;
        this.avengerId = avengerId;
    }

    public String getWeaponId() {
        return weaponId;
    }

    public void setWeaponId(String weaponId) {
        this.weaponId = weaponId;
    }

    public String getWeaponName() {
        return weaponName;
    }

    public void setWeaponName(String weaponName) {
        this.weaponName = weaponName;
    }

    public String getAvengerId() {
        return avengerId;
    }

    public void setAvengerId(String avengerId) {
        this.avengerId = avengerId;
    }

    public String getMissionId() {
        return missionId;
    }

    public void setMissionId(String missionId) {
        this.missionId = missionId;
    }
    
}
