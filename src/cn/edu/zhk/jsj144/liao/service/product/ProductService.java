package cn.edu.zhk.jsj144.liao.service.product;

import java.sql.SQLException;

import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.entity.product.Product;

public class ProductService {
	private ProductDao productDao = new ProductDao();
	
	/**
	 * 获取所有商品列表
	 * @return
	 */
	public PageBean<Product> getProductList(int pc) {
		try {
			return productDao.getProductList(pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按分类查
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Product> findByCategory(String cid, int pc) {
		try {
			return productDao.findByCategory(cid, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
