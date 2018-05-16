package action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;
//封装常用的servlet对象
public  class SuperAction extends ActionSupport implements ServletRequestAware,ServletResponseAware,ServletContextAware
{
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected ServletContext application;
	protected HttpSession session;
	public void setServletContext(ServletContext application)
	{
		this.application=application;
		
	}

	public void setServletResponse(HttpServletResponse response)
	{
	this.response=response;
		
	}

	public void setServletRequest(HttpServletRequest request)
	{
		this.request=request;
		this.session=request.getSession();
		
	}

}
