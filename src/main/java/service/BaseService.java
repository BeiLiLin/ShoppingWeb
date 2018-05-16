package service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseService<T> {
//    添加实体
    public Boolean save(T t);

   //更新实体
    public Boolean update(T t);

    //逻辑删除
    public Boolean Logic_deleteAll(Class<T> entityClazz,int[]ids);
    //物理删除删除实体
    public Boolean delete(T t);
    public Boolean delete(Class<T> entityClazz, Serializable id);
    public Boolean delete(Class<T> entityClazz, Serializable[]ids);
    //获取特定主键的实体
    public T get(Class<T> entityClazz, Serializable id);

    //获取表的实体总数
    public long findCount(Class<T> entityClazz);

    //获取表的实体总数
    public long findCount(Class<T> entityClazz,Serializable id);

    //根据hql语句查询
    public List<T> find(Class<T> entityClazz, Map<String, Object> params);

    //查询所有实体
    public List<T> findAll(Class<T> entityClazz);
    //分页
    public List<T> findByPage(Class<T> entityClazz);
    public List<T> findByPage(Class<T> entityClazz, Map<String, Object> params);


}
