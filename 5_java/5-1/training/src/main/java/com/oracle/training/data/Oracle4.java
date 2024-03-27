package com.oracle.training.data;

public class Oracle4{
    private int employeeNum;
    private int age;
    private String name;
    private String department;

    public static class Builder{
        private int employeeNum;
        private int age;
        private String name;
        private String department;

        Builder(){
        }

        public Builder employeeNum(int employeeNum){
            this.employeeNum = employeeNum;
            return this;
        }
    
        public Builder age(int age){
            this.age = age;
            return this;
        }
    
        public Builder name(String name){
            this.name = name;
            return this;
        }
    
        public Builder department(String department){
            this.department = department;
            return this;
        }

        public Oracle4 build(){
            return new Oracle4(this);
        }
    }

    public Oracle4(Builder builder){
        this.employeeNum = builder.employeeNum;
        this.age = builder.age;
        this.name = builder.name;
        this.department = builder.department;
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
