package com.laptrinhweb.raucuqua.beans;

import com.laptrinhweb.raucuqua.dao.Comment_vote;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class Blog {
    private String id_blog;
    private String name;
    private String short_discription;
    private String content;
    private String author;
    private Date date_post;
    private String img_url;

    private int numberComment;
    private List<CommentBlog> commentRootBlogs;
    private HashMap<String, IComment> rawCommentBlogs;

    public Blog(String id_blog, String name, String short_discription, String content, String author, Date date_post, String img_url) {
        this.id_blog = id_blog;
        this.name = name;
        this.short_discription = short_discription;
        this.content = content;
        this.author = author;
        this.date_post = date_post;
        this.img_url = img_url;
    }

    public Blog() {

    }

    public List<CommentBlog> getCommentRootBlogs() {
        return commentRootBlogs;
    }

    public HashMap<String, IComment> getRawCommentBlogs() {
        return rawCommentBlogs;
    }

    public String getId_blog() {
        return id_blog;
    }

    public void setId_blog(String id_blog) {
        this.id_blog = id_blog;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShort_discription() {
        return short_discription;
    }

    public void setShort_discription(String short_discription) {
        this.short_discription = short_discription;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getDate_post() {
        return date_post;
    }

    public void setDate_post(Date date_post) {
        this.date_post = date_post;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }
    public void loadComment(){
        try {
            rawCommentBlogs = Comment_vote.read_comment_hash_blog(this.id_blog);
            System.out.println("rawCommentBlogs: "+rawCommentBlogs.size());
            commentRootBlogs = Comment_vote.read_comment_blog(this.id_blog);
            this.numberComment = rawCommentBlogs.size();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    public int getNumberComment(){
        return numberComment;
    }

    @Override
    public String toString() {
        return id_blog+", "+name+", "+author+", toString blog update more...";
    }
}
