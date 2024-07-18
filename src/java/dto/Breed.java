/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ADMIN
 */
public class Breed {
    private String id;
    private String name;
    private String typepetid;

    public Breed(String id, String name, String typepetid) {
        this.id = id;
        this.name = name;
        this.typepetid = typepetid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTypepetid() {
        return typepetid;
    }

    public void setTypepetid(String typepetid) {
        this.typepetid = typepetid;
    }
    
    
}
