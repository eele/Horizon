package cn.edu.zhk.jsj141.feng.ctrl.comment;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhk.jsj141.feng.service.comment.CommentService;
import cn.edu.zhk.jsj141.feng.servlet.BaseServlet;

public class CommentServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private CommentService commentService = new CommentService();
	
	/**
	 * 加载多个comment
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
//	public String loadComments(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//		/*
//		 * 1. 获取cartItemIds参数
//		 */
//		String cartItemIds = req.getParameter("cartItemIds");
//		double total = Double.parseDouble(req.getParameter("total"));
//		/*
//		 * 2. 通过service得到List<CartItem>
//		 */
//		List<CartItem> cartItemList = cartItemService.loadCartItems(cartItemIds);
//		/*
//		 * 3. 保存，然后转发到/cart/showitem.jsp
//		 */
//		req.setAttribute("cartItemList", cartItemList);
//		req.setAttribute("total", total);
//		req.setAttribute("cartItemIds", cartItemIds);
//		return "f:/Front/cart/showitem.jsp";
//	}
	
	
	/**
	 * 添加评论
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cm = req.getParameter("comm");
		String oid = req.getParameter("orderid");
		String loginname=req.getParameter("lname");
		String []cmlist = cm.split(",");
		commentService.add(oid, cmlist,loginname);
		req.setAttribute("msg", "上传评论成功！");
		req.setAttribute("code", "success");
		return "f:/Front/msg3.jsp";
	}
		/*
		 * 1. 封装表单数据到CartItem(productid, quantity)
		 */
//		Map map = req.getParameterMap();
//		CartItem orderitem = CommonUtils.toBean(map, CartItem.class);
//		Product product = CommonUtils.toBean(map, Product.class);
//		User user = (User)req.getSession().getAttribute("sessionUser");
//		cartItem.setProduct(product);
//		cartItem.setUser(user);
//		
//		/*
//		 * 2. 调用service完成添加
//		 */
//		cartItemService.add(cartItem);
//		/*
//		 * 3. 查询出当前用户的所有条目，转发到list.jsp显示
//		 */
//		return myCart(req, resp);
	}
	
//	/**
//	 * 商品评论
//	 * @param req
//	 * @param resp
//	 * @return
//	 * @throws ServletException
//	 * @throws IOException
//	 */
//	public String pComments(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//		/*
//		 * 1. 得到uid
//		 */
//		User user = (User)req.getSession().getAttribute("sessionUser");
//		String uid = user.getUid();
//		/*
//		 * 2. 通过service得到当前用户的所有购物车条目
//		 */
//		List<CartItem> cartItemLIst = cartItemService.myCart(uid);
//		/*
//		 * 3. 保存起来，转发到/cart/list.jsp
//		 */
//		req.setAttribute("cartItemList", cartItemLIst);
//		return "f:/Front/cart/list.jsp";
//	}
//}
