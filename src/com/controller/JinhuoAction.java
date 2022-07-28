package com.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Company;
import com.model.Goods;
import com.model.Jinhuo;
import com.service.CompanyService;
import com.service.GoodsService;
import com.service.JinhuoService;
import com.util.PageBean;
/**
 * 物料入库业务操作类
 * @author Administrator
 *
 */
@Controller
public class JinhuoAction{
	
	@Autowired
	private JinhuoService jinhuoService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CompanyService companyService;
	/**
	 * 入库信息列表
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/jinhuoList")
	public String jinhuoList(HttpServletRequest req)throws Exception{
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		/** 分页代码   **/
		int offset = 0;  //记录偏移量
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (Exception e) {
		}
		
		PageBean page = new PageBean(offset);
		Jinhuo ser = new Jinhuo();
		ser.setStartdate(startDate);
		ser.setEnddate(endDate);
		counts=jinhuoService.getCount(ser);
		List<Jinhuo> jinhuoList=jinhuoService.queryJinhuoList(ser, page);
		if(jinhuoList!=null&&jinhuoList.size()>0){
			for (Jinhuo jinhuo : jinhuoList) {
				Goods good = goodsService.queryGoodsById(jinhuo.getGoodsid());
				if(good!=null){
					jinhuo.setGoodsname(good.getName());
					jinhuo.setBianhao(good.getBianhao());
				}
				Company company = companyService.queryCompanyById(jinhuo.getCompanyid());
				if(company!=null){
					jinhuo.setCompanyname(company.getName());
				}
			}
		}
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		req.setAttribute("jinhuoList", jinhuoList);
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		/** 分页代码  结束 **/
		return "/man/jinhuo/jinhuoList.jsp";
	}
	/**
	 *  跳转到入库界面
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/jinhuoToAdd")
	public String jinhuoToAdd(HttpServletRequest req) throws Exception{
		List<Goods> goodsList =  goodsService.queryGoodsList(null, null);
		req.setAttribute("goodsList", goodsList);
		return "/man/jinhuo/jinhuoAdd.jsp";
	}
	/**
	 * 保存物料入库
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/jinhuoAdd")
	public String jinhuoAdd(Jinhuo jinhuo,HttpServletRequest request)throws Exception{
		
		
		Goods good = goodsService.queryGoodsById(jinhuo.getGoodsid());
		jinhuo.setCompanyid(good.getCompanyid());
		int num = good.getKcnum()+jinhuo.getNum();
		good.setKcnum(num);
		goodsService.updateGoods(good);
		jinhuoService.insertJinhuo(jinhuo);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","jinhuoList.action");
		return "common/succeed1.jsp";
	}
	/**
	 * 删除入库信息
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/jinhuoDel")
	public String jinhuoDel(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Jinhuo jinhuo=jinhuoService.queryJinhuoById(id);
		//更改库存存储
		Goods good = goodsService.queryGoodsById(jinhuo.getGoodsid());
		if(good!=null){
			int num = good.getKcnum()-jinhuo.getNum();
			
			
			good.setKcnum(num);
			goodsService.updateGoods(good);
		}
		
		jinhuoService.deleteJinhuo(id);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","jinhuoList.action");
		return "common/succeed1.jsp";
	}
	
	 
	

	
	
}
