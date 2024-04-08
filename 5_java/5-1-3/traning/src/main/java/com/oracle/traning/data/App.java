package com.oracle.traning.data;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        oracle1 o1 = new oracle1();
        o1.name="ritsuko";
        System.out.println(o1.name);

        oracle2 o2 = new oracle2();
        o2.age=27;
        System.out.println(o2.age);

        oracle3 o3 = new oracle3();
        o3.busho="CX";
        System.out.println(o3.busho);

        oracle4 o4 = new oracle4();
        o4.comment="果たして合っているのだろうか";
        System.out.println(o4.comment);

        oracle5 o5 = new oracle5();
        o5.date="2024年3月27日";
        System.out.println(o5.date);
    }
}

class oracle1 
{
    String name;
}

class oracle2 
{
    int age;
}
class oracle3 
{
    String busho;
}

class oracle4
{
    String comment;
}

class oracle5
{
    String date;
}
