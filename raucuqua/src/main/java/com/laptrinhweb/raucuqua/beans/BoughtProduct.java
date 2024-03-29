package com.laptrinhweb.raucuqua.beans;

public class BoughtProduct {
    private String id_product;
    private String product_name;
    private String product_type;
    private int amount_bought;
    private int amount_imported;
    private int percent_discount;
    private double price;
    private String img_url;
    private double boughtPrice;
    private int amount;

    public BoughtProduct(String id_product, String product_name, String product_type, int amount_bought, int amount_imported, int percent_discount, double price, String img_url, double boughtPrice, int amount) {
        this.id_product = id_product;
        this.product_name = product_name;
        this.product_type = product_type;
        this.amount_bought = amount_bought;
        this.amount_imported = amount_imported;
        this.percent_discount = percent_discount;
        this.price = price;
        this.img_url = img_url;
        this.boughtPrice = boughtPrice;
        this.amount = amount;
    }
    public BoughtProduct(){

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
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public double getBoughtPrice() {
        return boughtPrice;
    }

    public void setBoughtPrice(double boughtPrice) {
        this.boughtPrice = boughtPrice;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPriceDiscount(){
        return this.price*((100-percent_discount)/100.0);
    }

    @Override
    public String toString() {
        return "BoughtProduct{" +
                "id_product='" + id_product + '\'' +
                ", product_name='" + product_name + '\'' +
                ", product_type='" + product_type + '\'' +
                ", amount_bought=" + amount_bought +
                ", amount_imported=" + amount_imported +
                ", percent_discount=" + percent_discount +
                ", price=" + price +
                ", img_url='" + img_url + '\'' +
                ", boughtPrice=" + boughtPrice +
                ", amount=" + amount +
                '}';
    }
}
