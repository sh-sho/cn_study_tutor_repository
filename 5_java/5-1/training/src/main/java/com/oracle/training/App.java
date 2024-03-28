package com.oracle.training;

import com.oracle.training.data.*;

public class App{
    public static void main(String[] args){
        // Oracle class
        Oracle oracle = new Oracle(000, 100, "Jack", "Finance");
        oracle.setEmployeeNum(111);
        oracle.setAge(10);
        oracle.setName("John");
        oracle.setDepartment("IT");

        System.out.println("Oracle");
        System.out.println(oracle.toString());

        // Oracle2 class
        Oracle2 oracle2 = new Oracle2(111, 10, "John", "IT");
        System.out.println("Oracle2");
        System.out.println(oracle2.toString());

        // Oracle3 class
        Oracle3 oracle3 = new Oracle3(111, 10, "John", "IT");
        System.out.println("Oracle3");
        System.out.println(oracle3.toString());

        // Oracle4 class
        Oracle4 oracle4 = Oracle4.builder().employeeNum(111).age(10).name("John").department("IT").build();
        System.out.println("Oracle4");
        System.out.println(oracle4.toString());
        
        // Oracle5 class
        Oracle5 oracle5 = new Oracle5(111, 10, "John", "IT");
        System.out.println("Oracle5");
        System.out.println(oracle5.toString());
    }
}
