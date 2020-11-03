package Models;

public class Sugar implements IAliment {
    double price;
    double weight;
    String name;

    public Sugar(double price, String name, double weight){
        this.price = price; this.name = name; this.weight = weight;
    }
    public double pricePerKg(){ return this.price/this.weight;}

    @Override
    public String getName(){
        return this.name;
    }
    @Override
    public double getPrice(){
        return this.price;
    }


    public String toString(){
        return "Sugar " + this.name + " at the price of "
                + String.valueOf(this.price) + " with weight of " + String.valueOf(this.weight);
    }

}
