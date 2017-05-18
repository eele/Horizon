package cn.edu.zhk.jsj144.liao.service.product;

import java.sql.SQLException;

import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.entity.product.Product;

public class ProductService {
	private ProductDao productDao = new ProductDao();
	
	/**
	 * 删除商品
	 * @param bid
	 */
	public void delete(String bid) {
		try {
			productDao.delete(bid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 修改商品
	 * @param product
	 */
	public void edit(Product product) {
		try {
			productDao.edit(product);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 返回当前分类下商品个数
	 * @param cid
	 * @return
	 */
	public int findProductCountByCategory(String cid) {
		try {
			return productDao.findproductCountByCategory(cid);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 加载商品
	 * @param bid
	 * @return
	 */
	public Product load(String bid) {
		try {
			return productDao.findByBid(bid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
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
	
	/**
	 * 按名查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public PageBean<Product> findByBname(String bname, int pc) {
		try {
			return productDao.findByBname(bname, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按作者查
	 * @param author
	 * @param pc
	 * @return
	 */
	public PageBean<Product> findByAuthor(String author, int pc) {
		try {
			return productDao.findByAuthor(author, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按出版社查
	 * @param press
	 * @param pc
	 * @return
	 */
	public PageBean<Product> findByPress(String press, int pc) {
		try {
			return productDao.findByPress(press, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 多条件组合查询
	 * @param criteria
	 * @param pc
	 * @return
	 */
	public PageBean<Product> findByCombination(Product criteria, int pc) {
		try {
			return productDao.findByCombination(criteria, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 添加商品
	 * @param Product
	 */
	public void add(Product product) {
		try {
			productDao.add(product);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
