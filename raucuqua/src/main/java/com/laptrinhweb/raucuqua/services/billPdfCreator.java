package com.laptrinhweb.raucuqua.services;

import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.DashedBorder;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.laptrinhweb.raucuqua.beans.Cart;
import com.laptrinhweb.raucuqua.beans.Product;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

public class billPdfCreator {
//    File f = new File("bill\\222.pdf");
//
//
//        System.out.println("OSDFJOISNV: "+f.getAbsolutePath());
public static String exportBill(String id, int year, String month, int day, String username, String state, String payby, double shipfee, String phone_number, String address, String email, List<Cart> products){
    String path = "bill\\"+id+".pdf";
    try {
//        FileOutputStream fos = new FileOutputStream(path);
        File f = new File(path);

        System.out.println("path: "+f.getAbsolutePath());
        if(!f.exists()){
//            FileOutputStream fos = new FileOutputStream(f);
            f.createNewFile();
        }
    } catch (Exception e) {
//        e.printStackTrace();
    }
    PdfWriter pdfWriter = null;
    try {
        pdfWriter = new PdfWriter(path);
    } catch (FileNotFoundException e) {
        throw new RuntimeException(e);
    }
    PdfDocument pdfDocument = new PdfDocument(
            pdfWriter
    );
    pdfDocument.setDefaultPageSize(PageSize.A4);

    Document document = new Document(pdfDocument);

//        document.add(new Paragraph("hello code finish"));
    float threecol = 190f;
    float twocol = 285f;
    float twocol150 = twocol+150f;
    float twocolumnWidth[] = {twocol150,twocol};
    float threeColumnWidth[] = {threecol,threecol,threecol};
    float fullwidth[] = {threecol*3};
    Paragraph onesp = new Paragraph("\n");
    Table table= new Table(twocolumnWidth);
    table.addCell(new Cell().add("Shop RauCuQua").setFontSize(20f).setBorder(Border.NO_BORDER).setBold());
    Table nestedtable = new Table(new float[]{twocol/2,twocol/2});
    nestedtable.addCell(getHeaderTextCell("Hoa Don No."));
    nestedtable.addCell(getHeaderTextCellValue(id));
    nestedtable.addCell(getHeaderTextCell("Date:"));
    String date = day+" "+ month+" " +year;
    nestedtable.addCell(getHeaderTextCellValue(date));

    table.addCell(new Cell().add(nestedtable).setBorder(Border.NO_BORDER));
    document.add(table);

    Border gb = new SolidBorder(com.itextpdf.kernel.color.Color.GRAY,2f);
    Table devider = new Table(fullwidth);
    devider.setBorder(gb);
    document.add(onesp);
    document.add(devider);
    document.add(onesp);

    Table twoColTable = new Table(twocolumnWidth);
    twoColTable.addCell(getBillingandShippingCell("thông tin Hoa Don"));
    twoColTable.addCell(getBillingandShippingCell("thông tin ship"));
    document.add(twoColTable.setMarginBottom(12f));

    Table twoColTable2 = new Table(twocolumnWidth);

    twoColTable2.addCell(getCell10Left("ten: ",true));
    twoColTable2.addCell(getCell10Left("state",true));
    twoColTable2.addCell(getCell10Left(username,false));
    twoColTable2.addCell(getCell10Left(state,false));
    twoColTable2.addCell(getCell10Left("PayBy",true));
    twoColTable2.addCell(getCell10Left("Ship fee",true));
    twoColTable2.addCell(getCell10Left(payby,false));
    twoColTable2.addCell(getCell10Left(String.valueOf(shipfee),false));
    document.add(twoColTable2);

    Table twoColTable3 = new Table(twocolumnWidth);

    twoColTable3.addCell(getCell10Left("so dien thoai",true));
    twoColTable3.addCell(getCell10Left("dia chi nhan hang",true));
    twoColTable3.addCell(getCell10Left(phone_number,false));
    twoColTable3.addCell(getCell10Left(address,false));
    document.add(twoColTable3);

    float oneColoumnwidth[] = {twocol150};
    Table oneColTable1 = new Table(oneColoumnwidth);
//        oneColTable1.addCell(getCell10Left("PayBy",true));
//        oneColTable1.addCell(getCell10Left("offline",false));
    oneColTable1.addCell(getCell10Left("Email",true));
    oneColTable1.addCell(getCell10Left(email,false));
    document.add(oneColTable1.setMarginBottom(10f));

    Table tableDevider2 = new Table(fullwidth);
    Border dgb = new DashedBorder(com.itextpdf.kernel.color.Color.GRAY,0.5f);
    document.add(tableDevider2.setBorder(dgb));

    Paragraph productGrap = new Paragraph("Products");
    document.add(productGrap.setBold());
    Table threeColTable1 = new Table(threeColumnWidth);
    threeColTable1.setBackgroundColor(com.itextpdf.kernel.color.Color.BLACK,0.7f);
    threeColTable1.addCell(new Cell().add("Description").setBold().setFontColor(com.itextpdf.kernel.color.Color.WHITE).setBorder(Border.NO_BORDER));
    threeColTable1.addCell(new Cell().add("Quantity").setBold().setFontColor(com.itextpdf.kernel.color.Color.WHITE).setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
    threeColTable1.addCell(new Cell().add("Price").setBold().setFontColor(com.itextpdf.kernel.color.Color.WHITE).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER));
    document.add(threeColTable1);

    List<Cart> ps = products;

    Table threeColTable2 = new Table(threeColumnWidth);
    double totalSum =0.0;
    for(Cart product:ps){
        float total = (float) (product.getAmount()*product.getProduct().getPriceDiscount());
        totalSum+=total;
        threeColTable2.addCell(new Cell().add(product.getProduct().getProduct_name()).setBorder(Border.NO_BORDER).setMarginLeft(10f));
        threeColTable2.addCell(new Cell().add(String.valueOf(product.getAmount())).setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
        threeColTable2.addCell(new Cell().add(String.valueOf(total)).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER).setMarginLeft(15f));

    }
    document.add(threeColTable2.setMarginBottom(20f));
    float onetwo[] ={threecol+125f,threecol*2};
    Table threeColTable4 = new Table(onetwo);
    threeColTable4.addCell(new Cell().add("").setBorder(Border.NO_BORDER));
    threeColTable4.addCell(new Cell().add(tableDevider2).setBorder(Border.NO_BORDER));
    document.add(threeColTable4);

    Table threeColTabl3 = new Table(threeColumnWidth);
    threeColTabl3.addCell(new Cell().add("").setBorder(Border.NO_BORDER).setMarginLeft(10f));
    threeColTabl3.addCell(new Cell().add("total").setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));
    threeColTabl3.addCell(new Cell().add(String.valueOf(totalSum)).setTextAlignment(TextAlignment.RIGHT).setBorder(Border.NO_BORDER)).setMarginRight(15f);
    document.add(threeColTabl3);
    document.add(tableDevider2);
    document.add(new Paragraph("\n"));
    document.add(devider.setBorder(new SolidBorder(Color.GRAY,1)).setMarginBottom(15f));
    document.add(new Cell().add("Cam on da su dung dich vu cua chung toi").setFontSize(20f));
    document.add(new Paragraph("Chu Shop").setBold().setFontSize(15f).setTextAlignment(TextAlignment.RIGHT));
    document.add(new Paragraph("da xac nhan").setTextAlignment(TextAlignment.RIGHT));
    document.close();
    return path;
}
    static Cell getHeaderTextCell(String textValue){
        return new Cell().add(textValue).setBold().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.RIGHT);
    }
    static Cell getHeaderTextCellValue(String textValue){

        return new Cell().add(textValue).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    }
    static Cell getBillingandShippingCell(String textValue){
        return new Cell().add(textValue).setFontSize(12f).setBold().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);

    }
    static Cell getCell10Left(String textValue,Boolean isBold){
        Cell myCell = new Cell().add(textValue).setFontSize(10f).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
        return isBold?myCell.setBold():myCell;
    }
}
