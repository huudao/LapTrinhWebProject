package com.laptrinhweb.raucuqua.beans;

import java.util.Date;

public class Contact {
    private String id_contact;
    private String email;
    private String name;
    private String phone_name;
    private String content;
    private Date date_up_contact;
    private boolean ischeck;

    public Contact(String id_contact, String email, String name, String phone_name, String content, Date date_up_contact, boolean ischeck) {
        this.id_contact = id_contact;
        this.email = email;
        this.name = name;
        this.phone_name = phone_name;
        this.content = content;
        this.date_up_contact = date_up_contact;
        this.ischeck = ischeck;
    }

    public boolean isIscheck() {
        return ischeck;
    }

    public void setIscheck(boolean ischeck) {
        this.ischeck = ischeck;
    }

    public Contact(){
    }

    public String getId_contact() {
        return id_contact;
    }

    public void setId_contact(String id_contact) {
        this.id_contact = id_contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone_name() {
        return phone_name;
    }

    public void setPhone_name(String phone_name) {
        this.phone_name = phone_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate_up_contact() {
        return date_up_contact;
    }

    public void setDate_up_contact(Date date_up_contact) {
        this.date_up_contact = date_up_contact;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "id_contact='" + id_contact + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", phone_name=" + phone_name +
                ", content='" + content + '\'' +
                ", date_up_contact=" + date_up_contact +
                ", ischeck= "+ischeck+
                '}';
    }
}
