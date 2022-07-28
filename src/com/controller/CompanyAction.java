package com.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Company;
import com.model.User;
import com.service.CompanyService;
import com.util.PageBean;
/**
 * 供应商信息业务操作类
 * @author Administrator
 *
 */
@Controller
public class CompanyAction{
	
	@Autowired
	private CompanyService companyService;
	/**
	 * 供应商信息列表
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/companyList")
	public String companyList(HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (Exception e) {
		}
		User user = (User) req.getSession().getAttribute("user");
		PageBean page = new PageBean(offset);
		Company ser = new Company();
		counts=companyService.getCount(ser);
		List<Company> companyList=companyService.queryCompanyList(ser, page);

		req.setAttribute("companyList", companyList);
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/man/company/companyList.jsp";
	}
	/**
	 * 跳转到新增供应商界面
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/companyToAdd")
	public String companyToAdd(HttpServletRequest req){
		return "/man/company/companyAdd.jsp";
	}
	/**
	 * 保存新增供应商
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/companyAdd")
	public String companyAdd(Company company,HttpServletRequest request)throws Exception{
		
		companyService.insertCompany(company);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","companyList.action");
		return "common/succeed.jsp";
	}
	/**
	 * 删除供应商
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/companyDel")
	public String companyDel(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		companyService.deleteCompany(id);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","companyList.action");
		return "common/succeed.jsp";
	}
	
	/**
	 * 跳转到修改供应商界面
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tocompanyEdit")
	public String tocompanyEdit(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Company company=companyService.queryCompanyById(id);
		request.setAttribute("company", company);
		return "/man/company/companyEdit.jsp";
	}
	
 
	/**
	 * 保存修改供应商信息
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/companyEdit")
	public String companyEdit(Company company,HttpServletRequest request)throws Exception{
		companyService.updateCompany(company);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","companyList.action");
		return "common/succeed.jsp";
	}
	

	
	
}
