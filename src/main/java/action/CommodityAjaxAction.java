package action;

import domain.Cartitem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.CartService;
import service.CommodityService;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("commodityAjaxAction")
public class CommodityAjaxAction extends SuperAction{
    @Autowired
    private CommodityService commodityService;
    @Autowired
    private CartService cartService;
    @Resource(name = "cartItem")
    private Cartitem cartitem;
    private String num;
    private String result;

    public Cartitem getCartitem() {
        return cartitem;
    }

    public void setCartitem(Cartitem cartitem) {
        this.cartitem = cartitem;
    }

    public String getResult() {
        return result;
    }
    public void setResult(String result) {
        this.result = result;
    }
    public String getNum() {
        return num;
    }
    public void setNum(String num) {
        this.num = num;
    }
    public String addCart(){
        int cid = Integer.parseInt(session.getAttribute("cid").toString());
        int uid = Integer.parseInt(session.getAttribute("id").toString());
        if (cartService.BeforeSave(uid,cid,Integer.parseInt(num))){
            result = "true";
        }else{
            result = "false";
        }
        return SUCCESS;
    }
}
