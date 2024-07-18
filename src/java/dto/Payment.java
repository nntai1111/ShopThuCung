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
public class Payment {
    private int id;
    private int typepayment;
    private Date paymentDate;
    private int status;

    public Payment(int id, int typepayment, Date paymentDate, int status) {
        this.id = id;
        this.typepayment = typepayment;
        this.paymentDate = paymentDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTypepayment() {
        return typepayment;
    }

    public void setTypepayment(int typepayment) {
        this.typepayment = typepayment;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
   
}
