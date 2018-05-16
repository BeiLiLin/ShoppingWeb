package service.serviceImpl;

import dao.BaseDao;
import org.springframework.beans.factory.annotation.Autowired;
import service.BaseService;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class BaseServiceImpl<T> implements BaseService<T> {
    @Autowired
    private BaseDao<T> dao;
    @Override
    public Boolean save(T t) {
        try{
            dao.save(t);
            return true;
        }catch (Exception e){
            System.out.println("出错了");
            e.getStackTrace();
            return false;
        }
    }

    @Override
    public Boolean update(T t) {
        try {
            dao.update(t);
        }catch (Exception ex){
            ex.getStackTrace();
            return  false;
        }
        return true;
    }

    @Override
    public Boolean Logic_deleteAll(Class<T> entityClazz,int[] ids) {
        String hql = "update "+entityClazz.getSimpleName()+" o set o.delFlag =?0 where o.id IN( ";
        Object params[] = new Object[ids.length+1];
        params[0] = 1;
        int len = ids.length;
        for (int i=1;i<=len;i++){
            if (i==len){
                hql += "?"+i;
                params[i] = ids[i-1];
            }else{
                hql += "?"+i+",";
                params[i] = ids[i-1];
            }
        }
        hql += " )";
        System.out.println(hql);
        //try{
            dao.updateByHql(hql,params);
            return true;
//        }catch (Exception ex){
//            ex.getStackTrace();
//            return false;
//        }
    }


//    @Override
//        public Boolean update(T t) {
//            try{
//                dao.update(t);
//                return true;
//            }catch (Exception e){
//                System.out.println("出错了");
//                e.getStackTrace();
//                return false;
//            }
//
//    }

    @Override
    public Boolean delete(T t)
    {
        try{
            dao.delete(t);
            return true;
        }catch (Exception e){
            System.out.println("出错了");
            e.getStackTrace();
            return  false;
        }

    }

    @Override
    public Boolean delete(Class<T> entityClazz, Serializable id) {
        try{
            dao.delete(entityClazz,id);
            return true;
        }catch (Exception e){
            System.out.println("出错了");
            e.getStackTrace();
            return  false;
        }
    }

    @Override
    public Boolean delete(Class<T> entityClazz, Serializable[]id) {
        try{
            return dao.delete(entityClazz,id);
        }catch (Exception e){
            System.out.println("出错了");
            e.getStackTrace();
            return  false;
        }
    }

    @Override
    public List<T> find(Class<T> entityClazz,Map<String,Object>params) {
        try {
        //分为有参数和无参数两种
        String hql = "from "+entityClazz.getSimpleName() +" o";
        if (params.size()== 0)        return dao.find(hql);
        else{
            String query =null;
            Object[]obj = new Object[params.size()];
            int k=0;
            for (String key:params.keySet()) {
                if (query ==null )         query  = " where "+key+"=?"+k;
                else                       query +=  " and "+key+"=?"+k;
                    obj[k++] = params.get(key);
                }
            hql += query;
            System.out.println("hql"+hql);
            return dao.find(hql,obj);
        }
        }catch (Exception e){
            System.out.println("出错了");
            e.getStackTrace();
            return null;
        }
    }
    @Override
    public T get(Class<T> entityClazz, Serializable id) {
        try{
            return dao.get(entityClazz,id);
        }catch (Exception e){
            System.out.println("出错了");
            e.getStackTrace();
            return  null;
        }
    }

        @Override
        public long findCount(Class<T> entityClazz) {
            try{
                return dao.findCount(entityClazz);
            }catch (Exception e ){
                System.out.println("出错了");
                e.getStackTrace();
                return 0;
            }
    }
    @Override
    public long findCount(Class<T> entityClazz,Serializable id) {
        try{
            return dao.findCount(entityClazz ,id);
        }catch (Exception e ){
            System.out.println("出错了");
            e.getStackTrace();
            return 0;
        }
    }

    @Override
    public List<T> findAll(Class<T> entityClazz) {
        try{
            return dao.findAll(entityClazz);
        }catch (Exception e){
            System.out.println("出错了");
            e.getStackTrace();
            return  null;
        }
    }

    @Override
    public List<T> findByPage(Class<T> entityClazz) {
        String hql="";
        dao.findByPage(hql);
        return null;
    }

    @Override
    public List<T> findByPage(Class<T> entityClazz, Map<String, Object> params) {

        String hql=" from "+ entityClazz.getSimpleName() +" o";
        int i=0;
        Object [] parameters = new Object[params.size()];
        for (String str:params.keySet()){
            if (i==0){
                hql +=" where "+str+"=?"+i;
            }else{
                hql +=" and "+str+"=?"+i;
            }
            parameters[i++] =params.get(str);
        }
        hql +=" and o.delFlag =:delFlag";
        System.out.println(hql);
        try{
           return  dao.findByPage(hql,parameters);
       }catch (Exception ex){
           ex.getStackTrace();
            return  null;
       }

    }
}
