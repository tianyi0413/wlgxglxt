package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.User;
import com.service.UserService;
import com.util.PageBean;
/**
 * 客户信息管理操作类
 * @author Administrator
 *
 */
@Controller
public class UserAction {

	@Autowired
	private UserService userService;
    /**
          * 客户信息列表
     * @param req
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/userList")
	public String userList(HttpServletRequest req) throws Exception {

		int offset = 0; // 记录偏移量
		int counts = 0; // 总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (Exception e) {
		}

		PageBean page = new PageBean(offset);
		counts = userService.getCount(null);
		List<User> userList = userService.queryUserList(null, page);
		if (userList != null && userList.size() > 0) {

		}

		req.setAttribute("userList", userList);
		/** 分页代码 开始 **/
		req.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem", PageBean.PAGE_IETM);
		req.setAttribute("pageTotal", page_count);
		/** 分页代码 结束 **/
		return "/man/user/userList.jsp";
	}
    /**
     * 删除客户信息
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/userDel")
	public String userDel(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		userService.deleteUser(id);

		request.setAttribute("message", "操作成功");
		request.setAttribute("path", "userList.action");
		return "common/succeed.jsp";
	}

	 
    /**
     * 保存会员信息
     * @param user
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/userAdd")
	public String userAdd(User user, HttpServletRequest request) throws Exception {
		user.setHuiyuanhao("HY" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		request.setAttribute("message", "添加成功");
		request.setAttribute("path", "userList.action");
		userService.insertUser(user);

		return "/common/succeed.jsp";

	}
    
    /**
     * 跳转到新增客户界面
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/userToAdd")
	public String userToAdd(HttpServletRequest req) throws Exception {
		return "/man/user/userAdd.jsp";
	}
    /**
     * 跳转到修改客户界面
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/touserEdit")
	public String touserEdit(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userService.queryUserById(id);
		request.setAttribute("user", user);
		return "/man/user/userEdit.jsp";
	}
    /**
     *  保存修改用户信息
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/userEdit")
	public String userEdit(User user, HttpServletRequest request) throws Exception {
		userService.updateUser(user);
		request.setAttribute("message", "操作成功");
		request.setAttribute("path", "userList.action");
		return "common/succeed.jsp";
	}
 
 

}
