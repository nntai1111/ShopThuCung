/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Service {
    private int id;
    private String typeservice;
    private String typepetid;
    private String description;
    private float weightrange;
    private Date expiration;
    private int price;
    private int discount;
    private int quantity;
    private String img;
    private int status;

    public Service(int id, String typeservice,String typepetid, String description, float weightrange, Date expiration, int price, int discount, int quantity,String img,int status) {
        this.id = id;
        this.typeservice = typeservice;
        this.typepetid = typepetid;
        this.description = description;
        this.weightrange = weightrange;
        this.expiration = expiration;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.img = img;
        this.status = status;
        
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeservice() {
        return typeservice;
    }

    public void setTypeservice(String typeservice) {
        this.typeservice = typeservice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getWeightrange() {
        return weightrange;
    }

    public void setWeightrange(float weightrange) {
        this.weightrange = weightrange;
    }

    public Date getExpiration() {
        return expiration;
    }

    public void setExpiration(Date expiration) {
        this.expiration = expiration;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTypepetid() {
        return typepetid;
    }

    public void setTypepetid(String typepetid) {
        this.typepetid = typepetid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
    
    
           
    
    
}
