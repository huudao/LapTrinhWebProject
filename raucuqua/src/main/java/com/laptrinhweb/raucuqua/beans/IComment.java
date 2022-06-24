package com.laptrinhweb.raucuqua.beans;

import java.util.List;

public interface IComment {
    public String getFatherID();
    public void addChild(IComment comment);
    List<IComment> getChildren();
    /*
    reason for different between {id and name,father and parent} -> by decision changing over time
    added into @ 9:58PM April 28 2022
     */
    public void setFatherName(String fatherName);
    public String id();
    public String getParent() ;
    public void setParent(String parent);
    //to set total number of comments
    //which query by using @ getSize() below

}
