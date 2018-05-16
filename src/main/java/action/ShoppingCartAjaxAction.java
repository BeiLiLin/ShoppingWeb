package action;

import domain.Cartitem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.CartService;
import shop.Page;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("shoppingCartAjaxAction")
public class ShoppingCartAjaxAction extends SuperAction  {
    @Autowired
    private CartService cartService;
    @Resource(name = "page")
    private Page page;
    @Resource(name = "cartItem")
    private Cartitem cartitem;
    private String result;
    private List<Cartitem> cartItemList;
    private String abid;
    private String statu;

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }

    public String getAbid() {
        return abid;
    }

    public void setAbid(String abid) {
        this.abid = abid;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<Cartitem> getCartItemList() {
        return cartItemList;
    }

    public void setCartItemList(List<Cartitem> cartItemList) {
        this.cartItemList = cartItemList;
    }

    public Cartitem getCartitem() {
        return cartitem;
    }
    public void setCartitem(Cartitem cartitem) {
        this.cartitem = cartitem;
    }

    public String checkMore(){
        System.out.println("checkMore");
        page.setPageNo(page.getPageNo()+1);
        int userid =Integer.parseInt(session.getAttribute("id").toString());
        Map<String,Object> map = new HashMap<>();
        map.put("o.userByUid.id",userid);
        if (statu != null && statu.equals("1")) {
            map.put("o.statu", 1);
            cartItemList = cartService.findByPage(Cartitem.class, map);
        }else{
            map.put("o.statu", 0);
            cartItemList = cartService.findByPage(Cartitem.class, map);
        }
        if (cartItemList.size()>0){
            result="true";
        }else{
            result="false";
        }
        return SUCCESS;
    }
    public String changeNum(){
        System.out.println("changeNum");
        System.out.println(cartitem.toString());
        cartService.changeNum(cartitem.getId(),cartitem.getNum());
        return SUCCESS;
    }
    public String delete(){
        System.out.println("delete");
        System.out.println(cartitem.toString());
        int ids[] = new int[1];
        ids[0]=cartitem.getId();
        if(cartService.Logic_deleteAll(Cartitem.class,ids)){
            //更新未购买的购物车项目数
            int allitems = Integer.parseInt(session.getAttribute("allitems").toString());
            session.setAttribute("allitems",allitems);
            result="true";
        }else{
            result="false";
        }
        return SUCCESS;
    }
    public String payAll(){
        System.out.println("payAll");
        String params[] =abid.split(",");
        int ids[] = new int[params.length];
        int i=0;
        for (String str:params){
            System.out.println(str);
            ids[i] = Integer.parseInt(params[i++]);
        }
       if(cartService.payAll(ids)){
           int allitems = Integer.parseInt(session.getAttribute("allitems").toString());
           int sold = Integer.parseInt(session.getAttribute("sold").toString());
           allitems -= ids.length;
           sold     += ids.length;
           session.setAttribute("allitems",allitems);
           session.setAttribute("sold",sold);
            result="true";
        }else{
            result="false";
        }
        return SUCCESS;
    }
    public String deleteAll(){
        System.out.println("deleteAll");
        String params[] =abid.split(",");
        int ids[] = new int[params.length];
        int i=0;
        for (String str:params){
            System.out.println(str);
            ids[i] = Integer.parseInt(params[i++]);
        }
        if(cartService.Logic_deleteAll(Cartitem.class,ids)){
            //获取不同状态的购物车项目数
            int allitems = Integer.parseInt(session.getAttribute("allitems").toString());
            int sold = Integer.parseInt(session.getAttribute("sold").toString());
            allitems -= ids.length;
            sold     += ids.length;
            session.setAttribute("allitems",allitems);
            session.setAttribute("sold",sold);
            result="true";
        }else{
            result="false";
        }
        return SUCCESS;
    }

}
