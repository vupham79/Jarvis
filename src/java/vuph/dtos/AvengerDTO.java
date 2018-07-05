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
public class AvengerDTO implements Serializable {

    private String avengerId, password, fullname, role, status;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvengerId() {
        return avengerId;
    }

    public void setAvengerId(String avengerId) {
        this.avengerId = avengerId;
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

    public AvengerDTO(String avengerId, String password, String fullname, String role, String status) {
        this.avengerId = avengerId;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
        this.status = status;
    }

    public AvengerDTO(String avengerId, String fullname, String role, String status) {
        this.avengerId = avengerId;
        this.fullname = fullname;
        this.role = role;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public AvengerDTO() {
    }
}
