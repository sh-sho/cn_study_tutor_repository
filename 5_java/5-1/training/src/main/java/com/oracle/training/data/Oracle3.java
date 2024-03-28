package com.oracle.training.data;

import lombok.Getter;
import lombok.AllArgsConstructor;

@Getter
@AllArgsConstructor
public class Oracle3{
    private final int employeeNum;
    private final int age;
    private final String name;
    private final String department;

    @Override
    public String toString(){
        return "employeeNum: " + employeeNum + ", age: " + age + ", name: " + name + ", department: " + department;
    }
}
