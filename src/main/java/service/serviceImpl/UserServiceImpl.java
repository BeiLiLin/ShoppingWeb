package service.serviceImpl;

import dao.UserDao;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.*;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    @Autowired
    private UserDao userDao;
    //登陆处理
    @Override
    public Map<String,String> get(String uid, String pass) {
        String hql="select new User(u.id,u.uname) from User u where u.uid=?0 and u.password =?1 and u.delFlag=?2 ";
        Object params[] = new Object[3];
        params[0] = uid;
        params[1] = pass;
        params[2] = 0;
        try{
            User user = userDao.find(hql,params).get(0);
            Map map = new HashMap<>();
            map.put("uname",user.getUname());
            map.put("id",user.getId());
            return map;
        }catch (Exception e){
            e.getStackTrace();
            return null;
        }
    }
    //更新实体
    @Override
    public Boolean update(User user) {
        try{
            int version = userDao.get(User.class,user.getId()).getVersion();
            //进行乐观锁判断
            if (version >user.getVersion()){
                return false;
            }else{
                user.setUpdateDate(new Timestamp(new Date().getTime()));
                user.setUpdateBy(user.getUname());
                user.setVersion(version+1);
                System.out.println("userdao:"+user.toString());
                userDao.update(user);
                return  true;
            }
        }catch (Exception e){
            System.out.println("出错了");
            e.getStackTrace();
            return false;
        }
    }

    @Override
    public List<User> findByPage() {
        return null;
    }

    @Override
    public List<User> search(String keyword) {
        return null;
    }
}
