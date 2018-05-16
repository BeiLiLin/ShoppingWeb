package hibernateTest;

import domain.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import service.UserService;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.*;

public class UserDemo extends BaseTest {
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;
    @Autowired
    private UserService userService;
    @Test
    public void userTest(){
        Session session = sessionFactory.openSession();
        List<User> ulist =session.createQuery("from User").list();
        System.out.println(ulist.get(0).toString());
    }

    @Test
    public void orderTest(){
        Session session = sessionFactory.openSession();
        List<Order> olist =session.createQuery("from Order ").list();
        System.out.println(olist.get(0).toString());
    }
    @Test
    public void commodityTest(){
        Session session = sessionFactory.openSession();
        List<Commodity> ulist =session.createQuery("from Commodity ").list();
        System.out.println(ulist.get(0).toString());
    }
    @Test
    public void cartitemTest(){
        Session session = sessionFactory.openSession();
        List<Cartitem> ulist =session.createQuery("from Cartitem ").list();
        System.out.println(ulist.get(0).toString());
    }

    @Test
    public void OrderComTest(){
        Session session = sessionFactory.openSession();
        List<OrderCom> ulist =session.createQuery("from OrderCom ").list();
        System.out.println(ulist.get(0).toString());
    }
    @SuppressWarnings("unchecked")
    @Test
    public void ManyToOne_CartItem_Commodity_User_Test(){
        Session session = sessionFactory.openSession();
        List<Cartitem> ulist =session.createQuery(
                "from Cartitem c where c.commodityByComid.id=:comid and c.userByUid.id = :uid and c.delFlag=:delFlag")
                .setParameter("uid",2)
                .setParameter("comid",2)
                .setParameter("delFlag",0)
                .list();
        for (Cartitem c:ulist){
            System.out.println(c.toString());
            User u = c.getUserByUid();
            System.out.println(u.toString());
            Commodity commodity = c.getCommodityByComid();
            System.out.println(commodity.toString());
        }
    }

    @SuppressWarnings("unchecked")
    @Test
    public void OneToMany_User_CartItem_Test(){
        Session session = sessionFactory.openSession();
        List<User> ulist =session.createQuery(
                "from User u where u.id = :uid")
                .setParameter("uid",2)
                .list();
        for (User user:ulist){
            System.out.println(user.toString());
            Set<Cartitem> cartitems = user.getCartitemsById();
            for (Cartitem cartitem:cartitems)
                System.out.println(cartitem.toString());
            Set<Order> orders = user.getOrdersById();
            for (Order order:orders)
                System.out.println(order.toString());
        }
    }
    @SuppressWarnings("unchecked")
    @Test
    public void User_checkLogin_Test(){
        Session session = sessionFactory.openSession();
        User user =(User)session.createQuery(
                "select new User(u.id,u.uname) from User u where u.uid=?0 and u.password =?1 and u.delFlag=:delFlag")
                .setParameter("0","1001")
                .setParameter("1","1234")
              .list().get(0);
            System.out.println(user.getId());
            System.out.println(user.getUname());

    }
    @SuppressWarnings("unchecked")
    @Test
    public void User_checkLogin2_Test(){
        User user = new User(1,"ss");
            Map map = userService.get("1001","1234");
            if (map != null){
                System.out.println(map.get("uname"));
                System.out.println(map.get("id"));
            }
            else {
                System.out.println("找不到id");
            }
    }
    @SuppressWarnings("unchecked")
    @Test
    public void userInfo()
    {
        int id = 1;
        User user = userService.get(User.class,id);
        System.out.println(user.toString());
    }

    @Test
    public void userUpdate()
    {
        User user = userService.get(User.class,1);
        user.setUname("林思思");
        user.setAddress("皇后大道西");
        userService.update(user);
    }
    @Test
    public void UserfindByhql()
    {
        Map<String,Object> map = new HashMap<>();
        map.put("uid","1001");
        User user = userService.find(User.class,map).get(0);
        System.out.println(user.toString());
    }

    @Test
    public void userSave()
    {
        User user = new User();
        user.setUid("1003");
        user.setUname("林思思");
        user.setAddress("皇后大道西");
        user.setPassword("1234");
        user.setTele("15992696034");
        user.setCreateBy("林思思");
        user.setCreateDate(new Timestamp(new Date().getTime()));
        userService.save(user);
    }


}
