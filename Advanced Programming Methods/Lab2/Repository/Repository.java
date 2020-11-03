package Repository;

import Models.IAliment;

public class Repository implements  IRepository{
    private IAliment[] data;
    private int no_of_elements;
    private final int size = 1000;

    public Repository(){
        this.data = new IAliment[this.size]; this.no_of_elements = 0;
    }
    @Override
    public void add(IAliment a) throws RepositoryExceptions{
        if(this.no_of_elements == this.size - 1)
            throw new RepositoryExceptions("Repo full sorry :(");

        for(IAliment entity: this.data)
            if(entity != null)
                if(entity.getName().equals(a.getName()))
                    throw new RepositoryExceptions("Already In " + entity.getName());

        this.data[this.no_of_elements++] = a;
    }
    @Override
    public void remove(int poz) throws RepositoryExceptions{

        if(0 > poz || poz >= this.no_of_elements)
            throw new RepositoryExceptions("Invalid Position");

        IAliment[] newData = new IAliment[this.size];
        int new_size = 0;

        for(int i = 0 ; i < this.no_of_elements; i++)
            if(i != poz)
                newData[new_size++] = this.data[i];

        this.no_of_elements = new_size;
        this.data = newData;
    }
    @Override
    public IAliment[] getAll(){
        return this.data;
    }
    @Override
    public IAliment[] filter(){
        IAliment[] filtered = new IAliment[this.size];
        int filter_size = 0;
        for(IAliment al: this.data)
            if(al != null)
                if(al.pricePerKg() >= 20)
                    filtered[filter_size++] = al;

        return filtered;

    }

    public int getLenght(){
        // for testing
        return this.no_of_elements;
    }

}
