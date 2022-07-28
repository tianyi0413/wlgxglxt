package com.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Catelog;
import com.model.User;
import com.service.CatelogService;
import com.util.PageBean;
/**
 * 物料分类信息业务操作类
 * @author Administrator
 *
 */
@Controller
public class CatelogAction{
	
	@Autowired
	private CatelogService catelogService;
	/**
	 * 物料分类信息列表
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/catelogList")
	public String catelogList(HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (Exception e) {
		}
		User user = (User) req.getSession().getAttribute("user");
		PageBean page = new PageBean(offset);
		Catelog ser = new Catelog();
		counts=catelogService.getCount(ser);
		List<Catelog> catelogList=catelogService.queryCatelogList(ser, page);

		req.setAttribute("catelogList", catelogList);
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/man/catelog/catelogList.jsp";
	}
	/**
	 * 跳转到新增物料分类信息界面
	 * @return
	 */
	@RequestMapping(value="/catelogToAdd")
	public String catelogToAdd(HttpServletRequest req){
		return "/man/catelog/catelogAdd.jsp";
	}
	/**
	 * 保存新增物料分类信息
	 * @return
	 */
	@RequestMapping(value="/catelogAdd")
	public String catelogAdd(Catelog catelog,HttpServletRequest request)throws Exception{
		
		catelogService.insertCatelog(catelog);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","catelogList.action");
		return "common/succeed.jsp";
	}
	/**
	 * 删除物料分类信息
	 * @return
	 */
	@RequestMapping(value="/catelogDel")
	public String catelogDel(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		catelogService.deleteCatelog(id);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","catelogList.action");
		return "common/succeed.jsp";
	}
	
	/**
	 * 跳转到修改物料分类信息
	 * @return
	 */
	@RequestMapping(value="/tocatelogEdit")
	public String tocatelogEdit(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Catelog catelog=catelogService.queryCatelogById(id);
		request.setAttribute("catelog", catelog);
		return "/man/catelog/catelogEdit.jsp";
	}
	
	
	/**
	 * 保存修改物料分类信息
	 * @return
	 */
	@RequestMapping(value="/catelogEdit")
	public String catelogEdit(Catelog catelog,HttpServletRequest request)throws Exception{
		catelogService.updateCatelog(catelog);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","catelogList.action");
		return "common/succeed.jsp";
	}
	

	
	
}
