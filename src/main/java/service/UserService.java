package service;


import domain.User;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface UserService extends BaseService<User> {
    //登陆处理
    public Map<String,String> get(String  uid, String Pass);

    //修改
    public Boolean update(User user);



    // 使用HQL语句进行分页查询
    public List<User> findByPage();
    public List<User> search(String keyword);
}
