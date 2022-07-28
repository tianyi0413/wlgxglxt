package com.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Admin;

import com.service.AdminService;
import com.util.PageBean;
/**
 * 员工管理员信息业务操作类
 * @author Administrator
 *
 */
@Controller
public class AdminAction {
	
	
	@Autowired
	private AdminService adminService;

	/**
	 * 员工信息列表
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/adminList")
	public String adminList(HttpServletRequest req) throws Exception{

		/** 分页代码  拷贝这一段  开始 **/
		int offset = 0;  //记录偏移量
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (Exception e) {
		
		}
		PageBean page = new PageBean(offset);
		int counts = adminService.getCount(null); 
		List adminList = adminService.queryAdminList(null,page);
		req.setAttribute("adminList", adminList);
		/** 分页代码  拷贝这一段  开始 **/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  拷贝这一段  结束 **/
		
		return "/man/admin/adminList.jsp";
	}
	
    /**
     * 添加员工信息
     * @param admin
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/adminAdd")
	public String adminAdd(Admin admin,HttpServletRequest request)throws Exception{
		
		Admin query = new Admin();
		query.setUname(admin.getUname());
		List list = adminService.queryAdminList(query,null);
		if(list!=null && list.size()>0){
			request.setAttribute("message","账户已存在");
			request.setAttribute("path","/man/admin/adminAdd.jsp");
			
		}else{
			adminService.insertAdmin(admin);
			request.setAttribute("message","操作成功");
			request.setAttribute("path","adminList.action");
		}
		
		return "common/succeed.jsp";
		
	}
	/**
	 * 删除员工信息
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/adminDel")
	public String adminDel(HttpServletRequest request){
		int userId = Integer.parseInt(request.getParameter("id"));
		try {
			adminService.deleteAdmin(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("message","操作成功");
		request.setAttribute("path","adminList.action");
		return "common/succeed.jsp";
	}
	/**
	 * 跳转到新增员工信息界面
	 * @return
	 */
	@RequestMapping(value="/adminToAdd")
	public String adminToAdd(){
		
		return "/man/admin/adminAdd.jsp";
	}
	/**
	 * 跳转到修改员工信息界面
	 * @return
	 */
	@RequestMapping(value="/toadminEdit")
	public String toadminEdit(HttpServletRequest request)throws Exception{
		
		int id = Integer.parseInt(request.getParameter("id"));
		Admin admin=adminService.queryAdminById(id);
 
		request.setAttribute("admin",admin);
	 
		return "/man/admin/adminEdit.jsp";
	}
	/**
	 * 保存修改员工信息
	 * @return
	 */
	@RequestMapping(value="/adminEdit")
	public String adminEdit(Admin admin,HttpServletRequest request)throws Exception{
		adminService.updateAdmin(admin);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","adminList.action");
		return "common/succeed.jsp";
	}
	


	
	
	


}
