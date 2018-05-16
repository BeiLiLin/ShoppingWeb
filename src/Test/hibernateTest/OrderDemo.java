package hibernateTest;

import domain.Cartitem;
import domain.Commodity;
import domain.Order;
import domain.OrderCom;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Set;

public class OrderDemo extends BaseTest {
    @Autowired
    private SessionFactory sessionFactory;
    @Test
    public void OrderTest(){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        List<OrderCom> list =session.createQuery("from OrderCom oc where oc.commodityByComid.id=1 and oc.orderByOid.id=1").list();
        Order orderByOid = list.get(0).getOrderByOid();
        Set<OrderCom> orderComsById = orderByOid.getOrderComsById();
        Commodity commodity = list.get(0).getCommodityByComid();
        Set<Cartitem> cartitemsById = commodity.getCartitemsById();
        System.out.println(list);
    }
}
