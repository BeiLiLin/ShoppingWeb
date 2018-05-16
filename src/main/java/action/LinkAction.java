package action;

import org.springframework.stereotype.Controller;

@Controller("linkAction")
public class LinkAction extends SuperAction {
    public String index(){
        System.out.println("index");
        return "index";
    }

    public String regist(){
        System.out.println("regist");
        return "regist";
    }
}
