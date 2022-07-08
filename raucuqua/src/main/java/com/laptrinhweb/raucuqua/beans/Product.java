package com.laptrinhweb.raucuqua.beans;

import com.laptrinhweb.raucuqua.dao.Comment_vote;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public class Product {
    private String id_product;
    private String product_name;
    private String product_type;
    private int amount_bought;
    private int amount_imported;
    private int percent_discount;
    private double price;
    private String short_description;
    private String description;
    private String img_url;
    private int numberComment;
    private double numstar;
    private double price_discount;
    private List<CommentProduct> commentRootProducts;
    private HashMap<String, IComment> rawCommentProducts;
    public Product(String id_product, String product_name, String product_type, int amount_bought, int amount_imported, int percent_discount, double money, String short_description, String description, String img_url) {
        this.id_product = id_product;
        this.product_name = product_name;
        this.product_type = product_type;
        this.amount_bought = amount_bought;
        this.amount_imported = amount_imported;
        this.percent_discount = percent_discount;
        this.price = money;
        this.short_description = short_description;
        this.description = description;
        this.img_url = img_url;
        price_discount = getPriceDiscount();
    }
    public Product() {
    }
    public List<CommentProduct> getCommentRootProducts() {
        return commentRootProducts;
    }

    public void setCommentRootProducts(List<CommentProduct> commentRootProducts) {
        this.commentRootProducts = commentRootProducts;
    }

    public HashMap<String, IComment> getRawCommentProducts() {
        return rawCommentProducts;
    }

    public void setRawCommentProducts(HashMap<String, IComment> rawCommentProducts) {
        this.rawCommentProducts = rawCommentProducts;
    }
    public String getId_product() {
        return id_product;
    }

    public void setId_product(String id_product) {
        this.id_product = id_product;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_type() {
        return product_type;
    }

    public void setProduct_type(String product_type) {
        this.product_type = product_type;
    }

    public int getAmount_bought() {
        return amount_bought;
    }

    public void setAmount_bought(int amount_bought) {
        this.amount_bought = amount_bought;
    }

    public int getAmount_imported() {
        return amount_imported;
    }

    public void setAmount_imported(int amount_imported) {
        this.amount_imported = amount_imported;
    }

    public int getPercent_discount() {
        return percent_discount;
    }

    public void setPercent_discount(int percent_discount) {
        this.percent_discount = percent_discount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
        price_discount = getPriceDiscount();
    }

    public String getShort_description() {
        return short_description;
    }

    public void setShort_description(String short_description) {
        this.short_description = short_description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }
    public double getPriceDiscount(){
        return this.price*((100-percent_discount)/100.0);
    }
    public void loadComment(){
        try {
            rawCommentProducts = Comment_vote.read_comment_hash_product(this.id_product);
            commentRootProducts = Comment_vote.read_comment_product(this.id_product);
            this.numberComment = rawCommentProducts.size();
            this.numstar = numstar(rawCommentProducts);
            System.out.printf("number product,size: %d,number star: %f \n",numberComment,numstar);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
    public double numstar(HashMap<String,IComment> rawComments){
        int total=0;
        for (IComment type:rawComments.values()
        ) {
            CommentProduct p = (CommentProduct) type;
            total+=p.getNum_star();
        }
        int y = (rawComments.size()==0)?1:rawComments.size();
        double x = total/y;
        return x/5;
    }
    public double getNumstar(){
        return numstar;
    }
    public int getNumberComment(){
        return numberComment;
    }
    @Override
    public String toString() {
        return "Product{" +
                "id_product='" + id_product + '\'' +
                ", product_name='" + product_name + '\'' +
                ", product_type='" + product_type + '\'' +
                ", amount_bought=" + amount_bought +
                ", left_amount=" + amount_imported +
                ", percent_discount=" + percent_discount +
                ", money=" + price +
                ", short_description='" + short_description + '\'' +
                ", description='" + description + '\'' +
                ", img_url='" + img_url + '\'' +
                '}';
    }

}
