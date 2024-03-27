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
        System.out.println(oracle.getEmployeeNum());
        System.out.println(oracle.getAge());
        System.out.println(oracle.getName());
        System.out.println(oracle.getDepartment());

        // Oracle2 class
        Oracle2 oracle2 = new Oracle2(111, 10, "John", "IT");
        System.out.println("Oracle2");
        System.out.println(oracle2.getEmployeeNum());
        System.out.println(oracle2.getAge());
        System.out.println(oracle2.getName());
        System.out.println(oracle2.getDepartment());

        // Oracle3 class
        Oracle3 oracle3 = new Oracle3(111, 10, "John", "IT");
        System.out.println("Oracle3");
        System.out.println(oracle3.getEmployeeNum());
        System.out.println(oracle3.getAge());
        System.out.println(oracle3.getName());
        System.out.println(oracle3.getDepartment());

        // Oracle4 class
        // Oracle4 oracle4 = Oracle4.Builder().employeeNum(111).age(10).name("John").department("IT").build();
        
        // Oracle5 class
        Oracle5 oracle5 = new Oracle5(111, 10, "John", "IT");
        System.out.println("Oracle5");
        System.out.println(oracle5.employeeNum());
        System.out.println(oracle5.age());
        System.out.println(oracle5.name());
        System.out.println(oracle5.department());
    }
}
