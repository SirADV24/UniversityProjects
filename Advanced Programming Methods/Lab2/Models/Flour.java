package Models;

public class Flour implements  IAliment{
    double price;
    String name;
    double weight;

    public Flour(double price, String name, double weight){
        this.price = price; this.name = name; this.weight = weight;
    }

    @Override
    public double pricePerKg(){ return this.price/this.weight;}
    @Override
    public String getName(){
        return this.name;
    }
    @Override
    public double getPrice(){
        return this.price;
    }

    @Override
    public String toString(){
        return "Flour " + this.name + " at the price of "
                + String.valueOf(this.price) + " with weight of " + String.valueOf(this.weight);
    }
}
