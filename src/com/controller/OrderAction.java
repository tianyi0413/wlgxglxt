package com.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Catelog;
import com.model.Goods;
import com.model.Order;
import com.model.User;
import com.service.CatelogService;
import com.service.GoodsService;
import com.service.OrderService;
import com.service.UserService;
import com.util.PageBean;
/**
 * 销售出库业务操作类
 * @author Administrator
 *
 */
@Controller
public class OrderAction{
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private CatelogService catelogService;
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;
	/**
	 * 出库订单信息列表
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/orderList")
	public String orderList(HttpServletRequest req)throws Exception{
		int type =Integer.parseInt(req.getParameter("type")) ;
		/** 分页代码   **/
		int offset = 0;  //记录偏移量
		int counts = 0;  //总记录数
		try {
			offset = Integer.parseInt(req.getParameter("pager.offset"));
		} catch (Exception e) {
		}
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String sfsh = req.getParameter("sfsh");

		PageBean page = new PageBean(offset);
		Order ser = new Order();
		ser.setType(type);
		ser.setStartdate(startDate);
		ser.setEnddate(endDate);

		counts=orderService.getCount(ser);
		List<Order> orderList=orderService.queryOrderList(ser, page);
		if(orderList!=null&&orderList.size()>0){
			for (Order order : orderList) {
				Goods good = goodsService.queryGoodsById(order.getGoodsid());
				if(good!=null){
					order.setGoodsname(good.getName());
					order.setGoodsbianhao(good.getBianhao());
				}
				User user = userService.queryUserById(order.getUid());
				if(user!=null){
					order.setUname(user.getName());
				}
				
			}
		}
		
		req.setAttribute("type", type);
		req.setAttribute("orderList", orderList);
		/** 分页代码  k开始**/
		req.setAttribute("itemSize",counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts / PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		req.setAttribute("pageItem",PageBean.PAGE_IETM);
		req.setAttribute("pageTotal",page_count);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		req.setAttribute("sfsh", sfsh);
		/** 分页代码  结束 **/
		return "/man/order/orderList.jsp";
	}


    /**
           * 热销物料统计
     * @param req
     * @param ginfo
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/toWeclome")
	public String toWeclome(HttpServletRequest req,Goods ginfo)throws Exception{
		List<Catelog> clist = catelogService.queryCatelogList(new Catelog(), null);
		req.setAttribute("clist", clist);
	 
		List<Goods> glist = goodsService.reportSales(ginfo, null);
		
		req.setAttribute("title", "热销物料");
		String items="";
		String score="";
		if(glist!=null && glist.size()>0){
			for (Goods goods : glist) {
				items = items + "'"+goods.getName()+"',";
				score = score + goods.getNum() + ",";
			}
			items = items.substring(0, items.length()-1);
			score = score.substring(0, score.length()-1);
		
		}
		req.setAttribute("ginfo", ginfo);
		req.setAttribute("items", items);
		req.setAttribute("score", score);
		return "/man/welcome.jsp";
	}

   

	/**
	 * 跳转到新增出库界面
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/orderToAdd")
	public String orderToAdd(HttpServletRequest req) throws Exception{
		List<Goods> goodsList =  goodsService.queryGoodsList(null, null);
		req.setAttribute("goodsList", goodsList);
		
		List<User> userList =  userService.queryUserList(null, null);
		req.setAttribute("userList", userList);
		int type =Integer.parseInt(req.getParameter("type")) ;
		req.setAttribute("type", type);
		
		return "/man/order/orderAdd.jsp";
	}
	/**
	 * 跳转到退货界面
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/orderToAdd2")
	public String orderToAdd2(HttpServletRequest req) throws Exception{
		List<Goods> goodsList =  goodsService.queryGoodsList(null, null);
		req.setAttribute("goodsList", goodsList);
		
		List<User> userList = userService.queryUserList(null, null);
		req.setAttribute("userList", userList);
		int type =Integer.parseInt(req.getParameter("type")) ;
		req.setAttribute("type", type);
		
		return "/man/order/tuihuoAdd.jsp";
	}
	/**
	 * 保存或修改订单信息
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/orderAdd")
	public String orderAdd(Order order,HttpServletRequest request)throws Exception{
		Goods good = goodsService.queryGoodsById(order.getGoodsid());
		order.setDanjia(Integer.parseInt(good.getShoujia()));
		order.setBianhao(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		if(order.getType()==0){ 
			int num = good.getKcnum()+order.getNum();
			good.setKcnum(num);
			goodsService.updateGoods(good);
		}else{  
			if(good.getKcnum()<order.getNum()){  
				request.setAttribute("message","库存数量只有"+good.getKcnum()+",请重新输入");
				request.setAttribute("path","jinhuoToAdd.action");
				request.setAttribute("type",order.getType());
				return "common/succeed1.jsp";
			}else{
				int num = good.getKcnum()-order.getNum();
				good.setKcnum(num);
				goodsService.updateGoods(good);
			}
		}

		orderService.insertOrder(order);
		request.setAttribute("type",order.getType());
		request.setAttribute("message","操作成功");
		request.setAttribute("path","orderList.action");
		return "common/succeed1.jsp";
	}
	/**
	 * 删除订单信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/orderDel")
	public String orderDel(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Order order=orderService.queryOrderById(id);
		//更改库存存储
		Goods good = goodsService.queryGoodsById(order.getGoodsid());
		if(good!=null){
			int num =0;
			if(order.getType()==0){
				num = good.getKcnum()-order.getNum();
			}else{
				num = good.getKcnum()+ order.getNum();
			}
			good.setKcnum(num);
			goodsService.updateGoods(good);
		}
		orderService.deleteOrder(id);
		request.setAttribute("type",order.getType());
		request.setAttribute("message","操作成功");
		request.setAttribute("path","orderList.action");
		return "common/succeed1.jsp";
	}
	
	
 
	
	 
	
 
	/**
	 * 物料退货 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/orderTui")
	public String orderTui(HttpServletRequest request)throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Order order=orderService.queryOrderById(id);
		// 将销售单改成已退货
		String tuihuodan = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		order.setTuihuodan(tuihuodan);
		orderService.updateOrder(order);
		//更改库存存储
		Goods good = goodsService.queryGoodsById(order.getGoodsid());
		if(good!=null){
			int num = good.getKcnum()+ order.getNum();
			good.setKcnum(num);
			goodsService.updateGoods(good);
		}
		//生成退货售单
		order.setType(0);
		order.setBianhao(tuihuodan);
		order.setCdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		order.setId(null);
		order.setTuihuodan(null);
		orderService.insertOrder(order);
		
		request.setAttribute("type",1);
		request.setAttribute("message","操作成功");
		request.setAttribute("path","orderList.action");
		return "common/succeed1.jsp";
	}
 
	/**
	 * 采购金额统计
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/report1")
	public String report1(HttpServletRequest req)throws Exception{
		List<Order> orderList= orderService.report1();
		 
		req.setAttribute("title", "采购金额统计");
		String items="";
		String score="";
		if(orderList!=null && orderList.size()>0){
			for (Order order : orderList) {
				items = items + "'"+order.getCdate()+"',";
				score = score + order.getDanjia() + ",";
			}
			items = items.substring(0, items.length()-1);
			score = score.substring(0, score.length()-1);
		
		}
		req.setAttribute("items", items);
		req.setAttribute("score", score);
		return "/man/order/report1.jsp";
	}
	
	
	/**
	 * 销售金额统计
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/report2")
	public String report2(HttpServletRequest req)throws Exception{
		List<Order> orderList= orderService.report2();
		 
		req.setAttribute("title", "销售金额统计");
		String items="";
		String score="";
		if(orderList!=null && orderList.size()>0){
			for (Order order : orderList) {
				items = items + "'"+order.getCdate()+"',";
				score = score + order.getDanjia() + ",";
			}
			items = items.substring(0, items.length()-1);
			score = score.substring(0, score.length()-1);
		
		}
		req.setAttribute("items", items);
		req.setAttribute("score", score);
		return "/man/order/report2.jsp";
	}
	
	
}
