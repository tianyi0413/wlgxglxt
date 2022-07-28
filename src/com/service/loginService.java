package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Admin;
import com.model.User;

@Service
@RemoteProxy
public class loginService {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	

	
	@SuppressWarnings("unchecked")
	public String login(String userName, String userPw, Integer userType) throws Exception {


		String result = "no";
		
		WebContext ctx = WebContextFactory.get();
		HttpSession session = ctx.getSession();


			Admin ser = new Admin();
			ser.setUname(userName);
			ser.setUpwd(userPw);

			List<Admin> adminList = adminService.queryAdminList(ser, null);
			if (adminList.size() == 0) {
				result = "no";
			} else {
				Admin admin = (Admin) adminList.get(0);
				 session.setAttribute("userType",userType);
				session.setAttribute("admin", admin);
				result = "yes";

			}

		
		
		session.setAttribute("userType",userType);
		
		
		return result;
	}



	
	
	
	
	public String adminPwEdit(String userPwNew) throws Exception {

		WebContext ctx = WebContextFactory.get();
		HttpSession session = ctx.getSession();

		Admin admin = (Admin) session.getAttribute("admin");
		admin.setUpwd(userPwNew);
		adminService.updateAdmin(admin);
		session.setAttribute("admin", admin);


		return "yes";
	}
	

	
	

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	

}
