package dao.daoImpl;

import dao.UserDao;
import domain.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;
//    @Override
//    public int findByhql(String hql,Object[]params) {
//        Query query = sessionFactory.getCurrentSession().createQuery(hql);
//        for (int i=0;i<params.length;i++)
//            query.setParameter(i+"",params[i]);
//        return (int)query.list().get(0);
//    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> search(String keyword) {
        String hql = "select u.uid,u.uname from User u  where u.uid like concat('%',?,'%') or u.uname like concat('%',?,'%')";
        return sessionFactory.getCurrentSession()
                .createQuery(hql)
                .setParameter(0+"",keyword)
                .setParameter(1+"",keyword)
                .setMaxResults(80)
                .list();

    }
//
//    @Override
//    public int findCount(Serializable uid, Serializable pass) {
//
//        return 0;
//    }
}
