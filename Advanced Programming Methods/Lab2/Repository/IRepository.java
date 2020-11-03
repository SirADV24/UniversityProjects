package Repository;

import Models.IAliment;

public interface IRepository {
    void add(IAliment elem) throws RepositoryExceptions;
    void remove(int index) throws RepositoryExceptions;
    IAliment[] getAll();
    IAliment[] filter();
    String toString();
}
