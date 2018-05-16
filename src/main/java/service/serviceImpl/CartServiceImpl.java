package service.serviceImpl;

import dao.CartDao;
import dao.CommodityDao;
import dao.UserDao;
import domain.Cartitem;
import domain.Commodity;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CartService;

import javax.annotation.Resource;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("cartService")
public class CartServiceImpl extends BaseServiceImpl<Cartitem> implements CartService {
    @Autowired
    private CartDao cartDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private CommodityDao commodityDao;
    @Resource(name="cartItem")
    private Cartitem cartitem;
    @Resource(name="cartItem")
    private Cartitem cartitem2;
    @Resource(name = "user")
    private User user;
    @Resource(name = "commodity")
    private Commodity  commodity;
    @Override
    public List<Cartitem> find(Serializable uid) {
        try {
            String hql = "from Cartitem c where c.userByUid.id=?0 and c.delFlag =:delFlag and c.statu=?1";
            Object[] obj = new Object[2];
            obj[0] = uid;
            obj[1] = 0;
            return cartDao.find(hql, obj);
        }catch (Exception ex){
            ex.getStackTrace();
            return  null;
        }
    }
    @Override
    public Boolean changeNum(int id, int num) {
        try {
            cartitem = get(Cartitem.class, id);
            cartitem.setNum(num);
            cartDao.update(cartitem);
            return true;
        }catch (Exception ex){
            return false;
        }

    }

    @Override
    public Boolean payAll(int[] ids) {
        String hql ="update Cartitem c set c.statu =?0  where c.id IN( ";
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
        try{
        cartDao.updateByHql(hql,params);
        return true;
        }catch (Exception ex){
            ex.getStackTrace();
            return false;
        }
    }

    @Override
    public Boolean save(int uid, int cid, int num) {
        try {
            user = userDao.get(User.class, uid);
            commodity = commodityDao.get(Commodity.class, cid);
            cartitem2.setUserByUid(user);
            cartitem2.setCommodityByComid(commodity);
            cartitem2.setNum(num);
            cartitem2.setCreateBy(uid + "");
            cartitem2.setCreateDate(new Timestamp(new Date().getTime()));
            cartDao.save(cartitem2);
            return true;
        }catch (Exception ex){
            ex.getStackTrace();
            return  false;
        }
    }

    @Override
    public Boolean BeforeSave(int uid, int cid, int num) {
        Map<String,Object> map = new HashMap<>();
        map.put("o.commodityByComid.id",cid);
        map.put("o.userByUid.id",uid);
        map.put("o.statu",0);
        //判断该用户的购物车是否已经有该商品的记录，有的话改变数量，没有的话增加一条记录
        try {
            List<Cartitem> cartitemList =find(Cartitem.class, map);
            if (cartitemList.size()>0)
                cartitem = cartitemList.get(0);
            else
                cartitem = null;
        }catch (Exception ex){
            ex.getStackTrace();
            //判断该用户的购物车是否已经有该商品的记录，有的话改变数量，没有的话增加一条记录
            System.out.println("Exception");
            cartitem = null;
        }
        if(cartitem == null){
            System.out.println("该用户无该商品的记录");
            //该用户无该商品的记录
            if(save(uid,cid,num)){
                System.out.println("result = true1");
                return true;
            }else{
                System.out.println("result = false1");
                return false;
            }
        }else {
            //该用户有该商品的记录,修改数量
            System.out.println("该用户有该商品的记录,修改数量");
            //之前删除过改购物车项,需改动删除标志还有数量、版本号
            if (cartitem.getDelFlag() == 0){
                cartitem.setNum(cartitem.getNum() + num);
                cartitem.setVersion(cartitem.getVersion() + 1);
            }else if(cartitem.getDelFlag() == 1){
                cartitem.setNum(num);
                cartitem.setVersion(1);
                cartitem.setDelFlag(0);
            }
            cartitem.setUpdateBy(uid + "");
            cartitem.setUpdateDate(new Timestamp(new Date().getTime()));
            if (update(cartitem)) {
                System.out.println("result = true2");
                return true;
            } else {
                System.out.println("result = false2");
                return false;
            }
        }
    }
}
