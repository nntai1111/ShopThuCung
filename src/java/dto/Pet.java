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
public class Pet {
    private int id;
    private int accid;
    private String breedid;
    private String typepetid;
    private float weight;
    private int status;

    public Pet(int id, int accid, String breedid, String typepetid, float weight, int status) {
        this.id = id;
        this.accid = accid;
        this.breedid = breedid;
        this.typepetid = typepetid;
        this.weight = weight;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccid() {
        return accid;
    }

    public void setAccid(int accid) {
        this.accid = accid;
    }

    public String getBreedid() {
        return breedid;
    }

    public void setBreedid(String breedid) {
        this.breedid = breedid;
    }

    public String getTypepetid() {
        return typepetid;
    }

    public void setTypepetid(String typepetid) {
        this.typepetid = typepetid;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
}
