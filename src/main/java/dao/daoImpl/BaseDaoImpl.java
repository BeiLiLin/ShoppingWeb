package dao.daoImpl;

import dao.BaseDao;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;
import shop.Page;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * 泛型dao组件
 * @Transactional实现事务管理，没有这个注释进行的数据库操作将会回滚
 */
@Transactional
public class BaseDaoImpl<T> implements BaseDao<T> {
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;
    @Resource(name = "page")
    private Page page;
    //保存实体
    @Override
    public void save(T t) {
        sessionFactory.getCurrentSession().save(t);
    }

    //更新实体
    @Override
    public void update(T t) {
        sessionFactory.getCurrentSession().update(t);
    }

    @Override
    public void updateByHql(String hql, Object[] ids) {
        Query query = sessionFactory.openSession().createQuery(hql);
        for (int i=0;i<ids.length;i++){
            query.setParameter(i+"",ids[i]);
        }
        query.executeUpdate();
    }

    //删除实体
    @Override
    public void delete(T t) {
        sessionFactory.getCurrentSession().delete(t);
    }

    @SuppressWarnings("unchecked")
    @Override
    public void delete(Class<T> entityClazz, Serializable id) {
      sessionFactory.getCurrentSession()
              .createQuery("delete from "+entityClazz.getSimpleName()+" en  where en.id=?0")
              .setParameter("0",id).executeUpdate();
    }

    @Override
    public Boolean delete(Class<T> entityClazz, Serializable[] id) {
        String hql ="";
        int count =0;
        for (int i=0;i<id.length;i++){
                if (count++ <=0)  hql = " en.id =?"+i;
                else            hql = " or en.id =?"+i;
            }
       Query query =  sessionFactory.getCurrentSession()
                .createQuery("delete from "+entityClazz.getSimpleName()+" en  where "+hql);
        for (int i=0;i<id.length;i++)
            query.setParameter(i+"",id[i]);
        int row =query.executeUpdate();
        if (row >0)     return true;
        else            return false;
    }

    //根据id获取实体
    @SuppressWarnings("unchecked")
    @Override
    public T get(Class<T> entityClazz, Serializable id) {
        return (T) sessionFactory
                .getCurrentSession()
                .get(entityClazz, id);
    }

    //获取表实体总数
    @SuppressWarnings("unchecked")
    @Override
    public long findCount(Class<T> entityClazz) {
        List<Long> l = sessionFactory.getCurrentSession()
                .createQuery("select count(*) from" + entityClazz.getSimpleName()+" o where o.delFlag=:delFlag")
                .setParameter("delFlag",0)
                .list();
        return l.get(0);
    }

    //获取表实体总数
    @SuppressWarnings("unchecked")
    @Override
    public long findCount(Class<T> entityClazz,Serializable id) {
        List<Long> l = sessionFactory.getCurrentSession()
                .createQuery("select count(*) from " + entityClazz.getSimpleName()+ " o where o.userByUid.id=?0 and o.delFlag=?1")
                .setParameter("0",id)
                .setParameter("1",0)
                .list();
        return l.get(0);
    }



    //获取表的所有实体
    @SuppressWarnings("unchecked")
    @Override
    public List<T> findAll(Class<T> entityClazz) {
        List<T> l = (List<T>) sessionFactory.getCurrentSession()
                .createQuery("from " + entityClazz.getSimpleName()+" o where o.delFlag=:delFlag")
                .setParameter("delFlag",0)
                .list();
        return l;
    }

    @SuppressWarnings("unchecked")
    //根据Hql查询实体
    public List<T> find(String hql) {
        return sessionFactory.openSession()
                .createQuery(hql)
                .list();
    }
    @SuppressWarnings("unchecked")
   //根据带占位符的Hql查询实体
   public List<T> find(String hql,Object[]params) {
        System.out.println("hql:"+hql);
        Query query = sessionFactory.openSession().createQuery(hql);
       for (int i=0,len=params.length;i<len;i++){
           query.setParameter(i+"",params[i]);
       }
        return (List<T>)query.list();
   }
    /*
        使用HQL语句进行分页查询
        @param hql 需要查询的HQL语句
        @return 当前页的所有内容
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<T> findByPage(String hql) {
        return sessionFactory.openSession()
                .createQuery(hql)
                .setParameter("delFlag",0)
                .setFirstResult((page.getPageNo()-1)*page.getPageSize())
                .setMaxResults(page.getPageSize()).list();

    }

    /*
       使用HQL语句进行分页查询
       @param hql 需要查询的HQL语句
       @param params 如果hql带占位符的参数，params用于传入占用符参数
       @return 当前页的所有内容
    */
    @SuppressWarnings("unchecked")
    @Override
    public List<T> findByPage(String hql, Object[] params) {
        Query query =sessionFactory.openSession()
                .createQuery(hql);
        for (int i=0,len=params.length;i<len;i++){
            query.setParameter(""+i,params[i]);
        }
        query.setParameter("delFlag",0)
                .setFirstResult((page.getPageNo()-1)*page.getPageSize())
                .setMaxResults(page.getPageSize());
        System.out.println("page.getPageNo()"+(page.getPageNo()-1)*page.getPageSize());
        System.out.println("page..getPageSize()"+page.getPageSize());
        return (List<T>)query.list();
    }
}
