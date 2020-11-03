package com.company;

class Person {
    protected int cnp;
    protected String name;

    public Person(int cnp, String name){
        this.cnp = cnp;
        this.name = name;
    }

    public Person()
    {
        this.cnp = -1;
        this.name = "";
    }

    public Person(Person another)
    {
        this.cnp = another.cnp;
        this.name = another.name;
    }

    @Override
    protected void finalize() throws Throwable {
        // destructor
        super.finalize();
    }

    public String get_type()
    {
        return "Person";
    }

    public int get_id()
    {
        return this.cnp;
    }
}

class Student extends Person{
    String university_id;

    public Student(int cnp, String name, String university_id)
    {
        this.cnp = cnp; this.name = name; this.university_id = university_id;
    }

    public Student()
    {
        this.cnp = -1; this.name = ""; this.university_id = "";
    }

    public Student(Student another)
    {
        this.cnp = another.cnp; this.name = another.name; this.university_id = another.university_id;
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize();
    }

    @Override
    public String get_type()
    {
        return "Student";
    }
}

