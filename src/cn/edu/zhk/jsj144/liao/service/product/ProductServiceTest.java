package cn.edu.zhk.jsj144.liao.service.product;

import static org.junit.Assert.*;

import java.util.List;
import java.sql.SQLException;

import org.junit.Test;

import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.entity.product.Product;

public class ProductServiceTest {

	@Test
	public void testGetByPage() {
		ProductService p = new ProductService();
		PageBean<Product> pBean = new PageBean<Product>();
		pBean.setCurrentPage(1);
        pBean.setPageSize(3);
		try {
			PageBean< Product> pBean2 = p.getByPage(pBean, "%");
			List<Product> l = pBean2.getBean();
			System.out.println(l.get(0));
			System.out.println(l.get(1));
			System.out.println(l.get(2));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
