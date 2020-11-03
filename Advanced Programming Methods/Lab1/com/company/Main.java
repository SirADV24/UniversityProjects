package com.company;


import java.util.Scanner;
import java.util.Vector;
import java.util.*;


public class Main {

    public static void main(String[] args) {
        Person me = new Person(1, "Adrian");
        Student also_me = new Student(1, "Adrian", "vaie2848");

        assert me.get_type().equals("Person");
        assert also_me.get_type().equals("Student");
        assert me.get_id() == also_me.get_id();

        int[] myNumbers = {1, 2, 3, 4};
        try {
            System.out.println(myNumbers[5]);
            assert Boolean.TRUE == Boolean.FALSE;
        }
        catch (Exception e){
            System.out.println("Oops\n");
        }
        finally {
            System.out.println("TryCatch over\n");
        }

        String[] numbers = {"1", "2", "3"};
        compute_average(numbers);

        System.out.println("Test Over :)");
    }

    public static void compute_average(String[] args)
    {
        double sum = 0;
        for(String arg: args) {
            try {
                sum += Double.parseDouble(arg);
            } catch (Exception e){
                System.out.println("Not a number\n");
            }
        }
        System.out.println("Average= " + sum / args.length + "\n");
    }

}
