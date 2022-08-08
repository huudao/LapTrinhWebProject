package com.laptrinhweb.raucuqua.controller.lazyLoading;

import java.util.*;

public class main {
    public static void main(String[] args) {
//        Map<String,Integer> m = new HashMap<>();
//        m.put("BL0001",12);
//        m.put("BL0002",31);
//        m.put("BL0001",55);
//
//        System.out.println(m.get("BL0001"));

        Random rand = new Random();
        int random = rand.nextInt();
        System.out.println(random);
        List<Integer> li  = new ArrayList<>();
        for (int i =1; i<100;i++){
            li.add(i);
        }

        List<Integer> lisub = li.subList(0,10);
        lisub.set(3,77);
        System.out.println(lisub);
        List<Integer> lisub2 = li.subList(10,20);
        System.out.println(lisub2);
        System.out.println(li);

    }
}
