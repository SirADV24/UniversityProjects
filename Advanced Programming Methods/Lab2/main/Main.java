package main;

//2. Intr-un depozit de alimente exista sare,
// zahar si faina. Sa se afiseze produsele
//cu pretul mai mare decat 20Ron/kg.

import Controller.Controller;
import Models.Flour;
import Models.Salt;
import Models.Sugar;
import Repository.Repository;
import View.View;
import tests.Tests;

public class Main {

    public static void main(String[] args) {
        Tests.runTests();
        Repository repo = new Repository();
        Controller service = new Controller(repo);

        Flour f1 = new Flour(100, "Flour1", 4);
        Flour f2 = new Flour(50, "Flour90", 5);
        Salt s1 = new Salt(100, "Salt34", 2);
        Sugar s2 = new Sugar(99, "Sugar14", 33);

        View my_view = new View(service);

        repo.add(f1);repo.add(f2);repo.add(s1);repo.add(s2);

        my_view.run();
    }
}
