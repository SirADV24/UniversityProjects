package View;
import Controller.Controller;
import Models.Flour;
import Models.IAliment;
import Models.Salt;
import Models.Sugar;
import Repository.RepositoryExceptions;
import java.util.HashMap;
import java.util.Scanner;

public class View {
    Controller service;
    Scanner sc;

    public View(Controller service){
        this.service = service;
        this.sc = new Scanner(System.in);
    }

    public void addFlour(){
        System.out.println("Introduce the price: ");
        double price = this.sc.nextDouble();

        System.out.println("Introduce the name of the flour");
        String name = this.sc.next();

        System.out.println("Introduce the weight");
        double weight = this.sc.nextDouble();
        Flour f = new Flour(price, name, weight);

        try{
            this.service.add(f);
        }
        catch(RepositoryExceptions e) {
            System.out.println(e.toString());
        }
    }

    public void addSalt(){
        System.out.println("Introduce the price: ");
        double price = this.sc.nextDouble();

        System.out.println("\nIntroduce the name of the salt");
        String name = this.sc.next();

        System.out.println("Introduce the weight");
        double weight = this.sc.nextDouble();
        Salt f = new Salt(price, name, weight);

        try{
            this.service.add(f);
        }
        catch(RepositoryExceptions e) {
            System.out.println(e.toString());
        }

    }

    public void addSugar(){
        System.out.println("Introduce the price: ");
        double price = this.sc.nextDouble();

        System.out.println("Introduce the name of the sugar");
        String name = this.sc.next();

        System.out.println("Introduce the weight");
        double weight = this.sc.nextDouble();

        Sugar f = new Sugar(price, name, weight);

        try{
            this.service.add(f);
        }
        catch(RepositoryExceptions e) {
            System.out.println(e.toString());
        }
    }

    public void removeAt(){
        System.out.println("Index of the object you wish to remove");
        int index = this.sc.nextInt();
        try{
            this.service.remove(index - 1);
        }
        catch(RepositoryExceptions e) {
            System.out.println(e.toString());
        }
    }

    public void printAll(){
        IAliment[] aliments = this.service.getAll();
        for(IAliment al: this.service.getAll())
            if(al != null)
                System.out.println(al.toString());
        System.out.println("\n");

    }

    public void printFiltered(){
        for(IAliment al: this.service.filter())
            if(al != null)
                System.out.println(al.toString());
        System.out.println("\n");
    }

    public void run(){
        String menu = "Press 1 to add a Flour\nPress 2 to add a Salt\nPress 3 to " +
                "add a Sugar\nPress 4 to remove an element at given index\nPress 5 to list" +
                "all the objects\nPress 6 to filter only theo objects with a higher price tan" +
                "a given margin\nPress 7 to exit";

        HashMap<Integer, Runnable> commands = new HashMap<Integer, Runnable>();
        commands.put(1, this::addFlour);
        commands.put(2, this::addSalt);
        commands.put(3, this::addSugar);
        commands.put(4, this::removeAt);
        commands.put(5, this::printAll);
        commands.put(6, this::printFiltered);

        while(Boolean.TRUE){
            System.out.println(menu);
            int command = sc.nextInt();

            if(command == 7)
                break;
            else if (commands.containsKey(command))
                commands.get(command).run();
            else
                System.out.println("Command does not exist\n");
        }
    }
}
