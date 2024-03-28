package com.oracle.training.data;

public class Oracle{
    private int employeeNum;
    private int age;
    private String name;
    private String department;

    public Oracle(int employeeNum, int age, String name, String department){
        this.employeeNum = employeeNum;
        this.age = age;
        this.name = name;
        this.department = department;
    }

    public int getEmployeeNum(){
        return employeeNum;
    }

    public void setEmployeeNum(int employeeNum){
        this.employeeNum = employeeNum;
    }

    public int getAge(){
        return age;
    }

    public void setAge(int age){
        this.age = age;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public String toString(){
        return "employeeNum: " + employeeNum + ", age: " + age + ", name: " + name + ", department: " + department;
    }
}
