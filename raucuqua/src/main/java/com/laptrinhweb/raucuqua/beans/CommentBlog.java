package com.laptrinhweb.raucuqua.beans;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class CommentBlog implements IComment{
    private String parent;
    private String id_comment_blog,id_blog,father_id_blog,id_user,comment_content;
    private Date date_post;
    private int like;
    private List<IComment> children;
    public CommentBlog(){
        children = new ArrayList<IComment>();
    }
    public String getId_comment_blog() {
        return id_comment_blog;
    }

    public void setId_comment_blog(String id_comment_blog) {
        this.id_comment_blog = id_comment_blog;
    }

    public String getId_blog() {
        return id_blog;
    }

    public void setId_blog(String id_blog) {
        this.id_blog = id_blog;
    }

    public String getFather_id_blog() {
        return father_id_blog;
    }

    public void setFather_id_blog(String father_id_blog) {
        this.father_id_blog = father_id_blog;
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

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    @Override
    public String getFatherID() {
        return father_id_blog;
    }

    @Override
    public void addChild(IComment comment) {
        children.add(comment);
    }

    @Override
    public List<IComment> getChildren() {
        return children;
    }

    public String getParent() {
        return parent;
    }
    public void setParent(String parent){
        this.parent = parent;
    }
    public void setFatherName(String fatherName){
        this.father_id_blog = fatherName;
    }
    //this will return name, not id
    public String id(){
        return id_user;
    }
}
