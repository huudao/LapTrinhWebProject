package com.laptrinhweb.raucuqua.beans;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class CommentProduct implements IComment{
    private String parent;
    private String id_comment_product,id_product,father_id_product,id_user,comment_content;
    private Date date_post;
    private int num_star;
    private List<IComment> children;
    public CommentProduct(){
        children = new ArrayList<IComment>();
    }
    public String getId_comment_product() {
        return id_comment_product;
    }

    public void setId_comment_product(String id_comment_product) {
        this.id_comment_product = id_comment_product;
    }

    public String getId_product() {
        return id_product;
    }

    public void setId_product(String id_product) {
        this.id_product = id_product;
    }

    public String getFather_id_product() {
        return father_id_product;
    }

    public void setFather_id_product(String father_id_product) {
        this.father_id_product = father_id_product;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public Date getDate_post() {
        return date_post;
    }

    public void setDate_post(Date date_post) {
        this.date_post = date_post;
    }

    public int getNum_star() {
        return num_star;
    }

    public void setNum_star(int num_star) {
        this.num_star = num_star;
    }

    @Override
    public String getFatherID() {
        return father_id_product;
    }
    @Override
    public void setFatherName(String fatherName){
        this.father_id_product = fatherName;
    }

    @Override
    public void addChild(IComment comment) {
        children.add(comment);
    }

    @Override
    public List<IComment> getChildren() {
        return children;
    }
    //this will return name, not id
    public String id(){
        return id_user;
    }
    public String getParent() {
        return parent;
    }
    public void setParent(String parent){
        this.parent = parent;
    }
}
