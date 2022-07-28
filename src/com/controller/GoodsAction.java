package com.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Catelog;
import com.model.Company;
import com.model.Goods;
import com.model.User;
import com.service.CatelogService;
import com.service.CompanyService;
import com.service.GoodsService;
import com.util.PageBean;
/**
 * 物料信息业务操作类
 * @author Administrator
 *
 */
@Controller
public class GoodsAction{
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CompanyService companyService;
	@Autowired
	private CatelogService catelogService;
	/**
	 * 物料信息列表
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsList")
	public String goodsList(HttpServletRequest req)throws Exception{
		
		/** 分页代码   **/
		int offset = 0;  //记录偏移量
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (Exception e) {
		}
		User user = (User) req.getSession().getAttribute("user");
		String name  = req.getParameter("name");
		PageBean page = new PageBean(offset);
		Goods ser = new Goods();
		ser.setName(name);
		counts=goodsService.getCount(ser);
		List<Goods> goodsList=goodsService.queryGoodsList(ser, page);
		if(goodsList!=null&&goodsList.size()>0){
			for (Goods goods : goodsList) {
				Company company = companyService.queryCompanyById(goods.getCompanyid());
				if(company!=null){
					goods.setCompanyname(company.getName());
				}
			}
		}
		

		req.setAttribute("goodsList", goodsList);
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		req.setAttribute("name",name);
		/** 分页代码  结束 **/
		return "/man/goods/goodsList.jsp";
	}
	/**
	 * 跳转到新增物料界面
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsToAdd")
	public String goodsToAdd(HttpServletRequest req) throws Exception{
		List<Company> companyList =  companyService.queryCompanyList(null, null);
		req.setAttribute("companyList", companyList);
		List<Catelog> clist = catelogService.queryCatelogList(new Catelog(), null);
		req.setAttribute("clist", clist);
		return "/man/goods/goodsAdd.jsp";
	}
	/**
	 * 保存新增物料
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsAdd")
	public String goodsAdd(Goods goods,HttpServletRequest request)throws Exception{
		
		goodsService.insertGoods(goods);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","goodsList.action");
		return "common/succeed.jsp";
	}
	/**
	 * 删除物料
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsDel")
	public String goodsDel(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		goodsService.deleteGoods(id);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","goodsList.action");
		return "common/succeed.jsp";
	}
	
	/**
	 * 跳转到修改物料界面
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/togoodsEdit")
	public String togoodsEdit(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Goods goods=goodsService.queryGoodsById(id);
		request.setAttribute("goods", goods);
		List<Company> companyList =  companyService.queryCompanyList(null, null);
		request.setAttribute("companyList", companyList);
		List<Catelog> clist = catelogService.queryCatelogList(new Catelog(), null);
		request.setAttribute("clist", clist);
		return "/man/goods/goodsEdit.jsp";
	}
	/**
	 * 查看物料详情
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/togoodsView")
	public String togoodsView(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Goods goods=goodsService.queryGoodsById(id);
		Company company = companyService.queryCompanyById(goods.getCompanyid());
		if(company!=null){
			goods.setCompanyname(company.getName());
		}
		request.setAttribute("goods", goods);
		return "/man/goods/goodsView.jsp";
	}
	/**
	 * 保存修改物料信息
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goodsEdit")
	public String goodsEdit(Goods goods,HttpServletRequest request)throws Exception{
		goodsService.updateGoods(goods);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","goodsList.action");
		return "common/succeed.jsp";
	}
	

	
	
}
