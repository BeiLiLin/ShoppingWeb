package action;

import domain.Cartitem;
import domain.Commodity;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.CartService;
import service.serviceImpl.CartServiceImpl;
import shop.Page;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("shoppingCartAction")
public class ShoppingCartAction extends SuperAction {
    @Resource(name = "cartService")
    private CartService cartService;
    //cartItem实体类
    @Resource(name = "cartItem")
    private Cartitem cartitem;
    @Resource(name = "page")
    private Page page;
    private String statu;
    private  List<Cartitem> cartitemList;
    //set||get
    public Cartitem getCartitem() {
        return cartitem;
    }
    public void setCartitem(Cartitem cartitem) {
        this.cartitem = cartitem;
    }

    public List<Cartitem> getCartitemList() {
        return cartitemList;
    }

    public void setCartitemList(List<Cartitem> cartitemList) {
        this.cartitemList = cartitemList;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }

    public String showCart(){
            int userid =Integer.parseInt(session.getAttribute("id").toString());
            Map<String,Object> map = new HashMap<>();
            map.put("o.userByUid.id",userid);
            if (statu == null){
                statu ="0";
                map.put("o.statu",0);
            }else{
                map.put("o.statu",Integer.parseInt(statu));
            }
            page.setPageNo(1);
            cartitemList= cartService.findByPage(Cartitem.class,map);
            //获取不同状态的购物车项目数
            int count = (int) cartService.findCount(Cartitem.class,userid);
            System.out.println("count:"+count);
            //获取全部商品和已购买商品的数值
            int allitems=0,sold=0;
            map.put("o.delFlag",0);
            if (statu != null &&statu.equals("1")){
                sold = cartService.find(Cartitem.class,map).size();
                allitems= count-sold;
                System.out.println("allitems:"+allitems);
                System.out.println("sold:"+sold);
            }else{
                allitems = cartService.find(Cartitem.class,map).size();
                sold= count-allitems;
                System.out.println("allitems:"+allitems);
                System.out.println("sold:"+sold);
            }
            //保存allitems、sold 到session
            session.setAttribute("allitems",allitems);
            session.setAttribute("sold",sold);

        return "success";
    }
}
