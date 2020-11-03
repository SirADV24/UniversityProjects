package Controller;

import Models.IAliment;
import Repository.Repository;
import Repository.RepositoryExceptions;

public class Controller {
    Repository database;

    public Controller(Repository db){
        this.database = db;
    }

    public void add(IAliment aliment) throws RepositoryExceptions {
        this.database.add(aliment);
    }

    public void remove(int index) throws RepositoryExceptions{
        this.database.remove(index);
    }

    public IAliment[] getAll(){
        return this.database.getAll();
    }

    public IAliment[] filter(){
        return this.database.filter();
    }

}
