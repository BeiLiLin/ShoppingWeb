package action;

import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.UserService;
import service.serviceImpl.UserServiceImpl;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("userAjaxAction")
public class UserAjaxAction extends SuperAction {
    private static final long serialVersionUID = 1L;
    @Autowired
    private UserService userSevice;
    @Resource(name = "user")
    private User user;
    private String result;
    // getter setter方法
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public User getUser()
    {
        return user;
    }
    public void setUser(User user)
    {
        this.user = user;
    }
    //检查登录
    public String login(){
        System.out.println("sdsd");
        System.out.println("uid:"+user.getUid());
        System.out.println("pass:"+user.getPassword());
//        int id;
        Map map= userSevice.get(user.getUid(),user.getPassword());
        if(map !=null)
        {
            //登陆成功
            result = "success";
            session.setAttribute("id",map.get("id"));//主键值
            session.setAttribute("username",map.get("uname"));//昵称
            session.setAttribute("uid",user.getUid());//登录账号
            user.setUname(map.get("uname").toString());
        }else{
            //登录失败
            result = "flase";
        }
        return SUCCESS;
    }
    //////////////////////////////////////////////////注册界面
    //修改个人信息
    public String changeInfo(){
        System.out.println("changeInfo");
        System.out.println(user.toString());
        User userInfo =(User)session.getAttribute("userInfo");
        if ((userInfo.getUname()).equals(user.getUname())&&(userInfo.getPassword()).equals(user.getPassword())&&(userInfo.getAddress()).equals(user.getAddress())&&(userInfo.getTele()).equals(user.getTele()))
        {
            result = "noUpdate";
        }else{
            userInfo.setUname(user.getUname());
            userInfo.setTele(user.getTele());
            userInfo.setPassword(user.getPassword());
            userInfo.setAddress(user.getAddress());
            System.out.println("保存的实体信息"+userInfo.toString());
            //修改学生信息
           if(userSevice.update(userInfo)) result= "true";
           else                            result= "false";
        }
        return SUCCESS;
    }
    //检测uid
    public String checkUid(){
        System.out.println(user.getUid());
        Map<String,Object> map = new HashMap<>();
        map.put("o.uid",user.getUid());
        List<User> users = userSevice.find(User.class,map);
        if (users == null && users.get(0).getUid()==null){
            System.out.println("false");
            result = "true";
        }
        else    result = "false";
        return SUCCESS;
    }
}
