package cn.edu.zhk.jsj144.liao.ctrl.shop;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.zhk.jsj144.liao.service.category.product.CategoryService;
import cn.edu.zhk.jsj144.liao.service.shop.ShopService;

/**
 * 获取店铺信息
 * @author ele
 *
 */
public class GetShopInfoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GetShopInfoCtrl() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        response.setContentType("text/html");
		ShopService shopService = new ShopService();
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("uid");
        request.setAttribute("shopInfo", shopService.getShopInfo(uid));
        RequestDispatcher rd=request.getRequestDispatcher("/Back_Shop/ma_shopInfo/infoMain.jsp");
        rd.forward(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
