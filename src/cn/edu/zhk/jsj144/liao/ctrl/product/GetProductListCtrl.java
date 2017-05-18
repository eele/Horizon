package cn.edu.zhk.jsj144.liao.ctrl.product;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.entity.product.Product;
import cn.edu.zhk.jsj144.liao.service.product.ProductService;

public class GetProductListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public GetProductListCtrl() {
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

		try {
			PageBean<Product> pBean = new PageBean<Product>();
			int currentPage = Integer.parseInt(request.getParameter("currentPage")); // 获取当前页码
			pBean.setCurrentPage(currentPage);
			pBean.setPageSize(8);  // 每页8条记录
	        
	        ProductService proService = new ProductService();
	        PageBean<Product> pb= proService.getByPage(pBean, "%");  //获取该页所有商品信息列表
	        pb.setUrl("/Horizon/product/GetProductListCtrl?cid=%");
			request.setAttribute("pb", pb);
			RequestDispatcher rd=request.getRequestDispatcher("/Back_Shop/ma_product/productList.jsp");
			rd.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
