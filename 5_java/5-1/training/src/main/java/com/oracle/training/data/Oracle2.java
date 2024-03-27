package com.oracle.training.data;

public class Oracle2{
    private int employeeNum;
    private int age;
    private String name;
    private String department;

    public Oracle2(int employeeNum, int age, String name, String department){
        this.employeeNum = employeeNum;
        this.age = age;
        this.name = name;
        this.department = department;
    }

    public int getEmployeeNum(){
        return employeeNum;
    }

    public int getAge(){
        return age;
    }

    public String getName(){
        return name;
    }

    public String getDepartment() {
        return department;
    }
}
