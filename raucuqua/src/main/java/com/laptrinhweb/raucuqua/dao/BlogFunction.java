package com.laptrinhweb.raucuqua.dao;

import com.laptrinhweb.raucuqua.beans.Blog;
import com.laptrinhweb.raucuqua.beans.CommentBlog;
import com.laptrinhweb.raucuqua.beans.IComment;
import com.laptrinhweb.raucuqua.connection.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class BlogFunction {
    public static Blog searchBlogById(String id){
        try {
            Connection con = GetConnection.getCon();
            String sql = "select * from blog where id_blog = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            Blog blog = new Blog();
            while(rs.next()){
                 blog = new Blog(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7));
            }
            rs.close();
            ps.close();
            return blog;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static void arrangeToDataAndItsChildren_fixBugOnly(List<CommentBlog> commentBlogs){
        List<IComment> commentb = new ArrayList<>();
        for (CommentBlog b :
                commentBlogs) {
            commentb.add((IComment) b);
        }
        arrangeToDataAndItsChildren(commentb);
    }
    public static void arrangeToDataAndItsChildren(List<IComment> commentBlogs){
        commentBlogs.sort(new Comparator<IComment>() {
            @Override
            public int compare(IComment o1, IComment o2) {
                CommentBlog c1 = (CommentBlog) o1;
                CommentBlog c2 = (CommentBlog) o2;
                return -c1.getDate_post().compareTo(c2.getDate_post());
            }
        });
        for (int i = 0;i< commentBlogs.size();i++){
            arrangeToDataAndItsChildren(commentBlogs.get(i).getChildren());
        }
    }
    public static void main(String[] args) {
        Blog b = searchBlogById("BL0001");
        System.out.println("----" + b.toString());
        b.loadComment();
        System.out.println("----" + b.getCommentRootBlogs().size());

    }
}
