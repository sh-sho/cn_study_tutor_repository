package com.oracle.training.data;

import lombok.Builder;

@Builder
public class Oracle4{
    private final int employeeNum;
    private final int age;
    private final String name;
    private final String department;

    @Override
    public String toString(){
        return "employeeNum: " + employeeNum + ", age: " + age + ", name: " + name + ", department: " + department;
    }
}
