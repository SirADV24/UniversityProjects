package Models;


public class Salt implements IAliment {
    double weight;
    double price;
    String name;

    public Salt(double price, String name, double weight){
        this.price = price; this.name = name; this.weight = weight;
    }
    public double pricePerKg(){ return this.price/this.weight;}

    @Override
    public double getPrice(){
        return this.price;
    }
    @Override
    public String getName(){
        return this.name;
    }

    public String toString(){
        return "Salt " + this.name + " at the price of " +
                String.valueOf(this.price) + " with weight of " + String.valueOf(this.weight);
    }
}
