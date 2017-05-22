package cn.edu.zhk.jsj144.liao.ctrl.ma_customer;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.zhk.jsj141.feng.entity.user.User;
import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.service.ma_customer.CustomerManagementService;

public class CustomerManagementCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CustomerManagementService cuService = new CustomerManagementService();

	/**
	 * Constructor of the object.
	 */
	public CustomerManagementCtrl() {
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
		String method = request.getParameter("method");
		if(method.equals("getUserList")) {
			try {
				getUserList(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if(method.equals("resetUserPwd")) {
			try {
				resetUserPwd(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
	
	public void getUserList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		PageBean<User> pBean = new PageBean<User>();
		int currentPage = Integer.parseInt(request.getParameter("currentPage")); // 获取当前页码
		pBean.setCurrentPage(currentPage);
		pBean.setPageSize(15);  // 每页15条记录

		String keyword = request.getParameter("keyword");
		PageBean<User> pb = null;
		if (keyword.equals("_all_")) {
			pb= cuService.getByPage(pBean, "%");  //获取该页所有商品信息列表
			pb.setUrl("/Horizon/ma_customer/CustomerManagementCtrl?method=getUserList&keyword=_all_");
		} else {
			pb= cuService.getByPage(pBean, keyword);  //获取该页指定种类的商品信息列表
			pb.setUrl("/Horizon/ma_customer/CustomerManagementCtrl?method=getUserList&keyword=" + keyword);
		}
		request.setAttribute("pb", pb);
		request.setAttribute("keyword", keyword);
		RequestDispatcher rd=request.getRequestDispatcher("/Back_Admin/ma_customer/per_info.jsp");
		rd.forward(request,response);
	}
	
	public void resetUserPwd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String uid = request.getParameter("uid");
		cuService.resetUserPwd(uid);
	}

}
