package action;

//import domain.User;
//import service.serviceImpl.UserServiceImpl;

import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.UserService;
import service.serviceImpl.UserServiceImpl;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;
@Controller("userAction")
public class UserAction extends SuperAction
{
	private static final long serialVersionUID = 1L;
    @Autowired
	private UserService userSevice;
    @Resource(name = "user")
    private User user;
    // getter setter方法
    public User getUser()
    {
        return user;
    }
    public void setUser(User user)
    {
        this.user = user;
    }
	public String put()
	{
		session.invalidate();
		return "put";
	}
    public String userInfo()
    {
        int id = Integer.parseInt(session.getAttribute("id").toString());
        user = userSevice.get(User.class,id);
        session.setAttribute("userInfo",user);
        System.out.println(user.toString());
        return "edit";
    }
    public String regist()
    {
        System.out.println(user.toString());
        user.setCreateBy(user.getUid());
        user.setCreateDate(new Timestamp(new Date().getTime()));
        if(userSevice.save(user))   request.setAttribute("loginResult","true");
        else                        request.setAttribute("loginResult","false");
        return "regist";
    }
}
