package hibernateTest;

import dao.CartDao;
import domain.Cartitem;
import domain.Commodity;
import domain.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import service.CartService;
import shop.Page;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
@Component("cartDemo")
public class CartItemDemo extends BaseTest {
    @Autowired
    private CartService cartService;
    @Resource(name = "page")
    private  Page page;
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;
    @Test
    public void CartitemTest(){
        List<Cartitem> cartitemList = cartService.find(1);
        for (Cartitem c:cartitemList){
          System.out.println(c.toString());
          System.out.println(c.getCommodityByComid().toString());
          System.out.println(c.getUserByUid().toString());
    }
    }
    @Test
    public void CartitemFindByPageTest(){
        Map<String,Object> map = new HashMap<>();
        map.put("o.userByUid.id",2);
        map.put("o.statu",0);
        page.setPageNo(2);
        List<Cartitem> cartitemList = cartService.findByPage(Cartitem.class,map);
        System.out.println("sdsasd");
        for (Cartitem c:cartitemList){
            System.out.println(c.toString());
            System.out.println(c.getCommodityByComid().toString());
            System.out.println(c.getUserByUid().toString());
        }
    }
    @Test
    public void CartitemUpdateByHql(){
        int[] ids = new int[]{4,5};
        cartService.payAll(ids);
    }
    @Test
    public void CartSaveByid(){
        if(cartService.save(2,2,5)){
            System.out.println("true");
        }else{
            System.out.println("false");
        }
    }
}
