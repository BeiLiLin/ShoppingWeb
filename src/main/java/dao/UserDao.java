package dao;

import domain.User;

import java.io.Serializable;
import java.util.List;

public interface UserDao extends BaseDao<User> {


    List<User> search(String keyword);
//    int findCount(Serializable uid, Serializable pass);
}
