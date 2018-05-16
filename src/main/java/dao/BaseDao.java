package dao;


import java.io.Serializable;
import java.util.List;


/*
       公共的DAO处理对象，这个对象中包含了Hibernate的所有基本操作和对SQL的操作
 */
public interface BaseDao<T> {
    //添加实体
    public void save(T t);

    //更新实体
    public void update(T t);
    public void updateByHql(String hql, Object []ids);

    //物理删除删除实体
    public void delete(T t);
    public void delete(Class<T> entityClazz, Serializable id);
    public Boolean delete(Class<T> entityClazz, Serializable[]id);
    //获取特定实体
    public T get(Class<T> entityClazz, Serializable id);

    //获取表实体总数
    public long findCount(Class<T> entityClazz);
    //获取表实体总数
    public long findCount(Class<T> entityClazz,Serializable id);


    //查询所有实体
    public List<T> findAll(Class<T> entityClazz);

    //根据hql查询实体
    public List<T> find(String hql);
    public List<T> find(String hql, Object[] params);
    //查找整数类型的数据
//    int findByhql(String hql,Object[] params);
    //没带参数的分页
    public List<T> findByPage(String hql);
    //hql带占位符参数的分页
    public List<T> findByPage(String hql,Object[] params);
}
