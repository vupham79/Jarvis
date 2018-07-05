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
public class RegistrationDTO implements Serializable{
    private String username, password, fullname, role, realName;
    private double height, weight;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public RegistrationDTO(String username, String password, String fullname, String role, String realName, double height, double weight) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
        this.realName = realName;
        this.height = height;
        this.weight = weight;
    }

    public RegistrationDTO() {
    }
}
