package com.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Goods;

import com.service.GoodsService;
import com.util.PageBean;
/**
 * 库存业务操作类
 * @author Administrator
 *
 */
@Controller
public class KucunAction{
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="/kucunList")
	public String kucunList(HttpServletRequest req)throws Exception{
		/** 分页代码   **/
		int offset = 0;  //记录偏移量
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (Exception e) {
			
		}
		PageBean page = new PageBean(offset);
		Goods ser = new Goods();
		String name  = req.getParameter("name");
		ser.setName(name);
		counts=goodsService.getCount(ser);
		List<Goods> kucunList=goodsService.queryGoodsList(ser, page);

		req.setAttribute("kucunList", kucunList);
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		req.setAttribute("name",name);
		/** 分页代码  结束 **/
		return "/man/kucun/kucunList.jsp";
	}
	/**
	 * 跳转到入库界面
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/kucunToAdd")
	public String kucunToAdd(HttpServletRequest req){
		return "/man/kucun/kucunAdd.jsp";
	}
	/**
	 * 保存入库信息
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/kucunAdd")
	public String kucunAdd(Goods kucun,HttpServletRequest request)throws Exception{
		
		goodsService.insertGoods(kucun);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","kucunList.action");
		return "common/succeed.jsp";
	}
 
	/**
	 * 跳转到修改库存信息
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/tokucunEdit")
	public String tokucunEdit(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Goods goods=goodsService.queryGoodsById(id);
		request.setAttribute("goods", goods);
		return "/man/kucun/kucunEdit.jsp";
	}
	
 
	/**
	 * 保存修改库存信息
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/kucunEdit")
	public String kucunEdit(Goods goods,HttpServletRequest request)throws Exception{
		Goods po = goodsService.queryGoodsById(goods.getId());
		po.setKcnum(goods.getKcnum());
		goodsService.updateGoods(po);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","kucunList.action");
		return "common/succeed.jsp";
	}
	


	
	
}
