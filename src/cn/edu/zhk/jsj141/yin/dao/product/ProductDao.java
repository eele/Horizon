package cn.edu.zhk.jsj141.yin.dao.product;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;

import cn.edu.zhk.jsj141.yin.util.BeanMapUtil;
import cn.edu.zhk.jsj141.yin.util.JDBCUtils;
import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.entity.product.Product;

public class ProductDao {
	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

	/**
	 * 获取商品总数
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public int getTotalCount(String cid) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT count(*) FROM product WHERE cid like ?";
		Map<String,Object> map = qr.query(sql, new MapHandler(), cid);
		return Integer.parseInt(String.valueOf(map.get("count(*)")));
	}

	/**
	 * 获取当前页的指定种类商品
	 * @param pBean
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public List<Product> getCurrentPageBean(PageBean<Product> pBean, String cid) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM product WHERE cid like ? ORDER BY purDate DESC LIMIT ?,?";
        return qr.query(sql, new BeanListHandler<Product>(Product.class), 
        		cid, 
        		(pBean.getCurrentPage()-1)*pBean.getPageSize(), pBean.getPageSize());
	}

	/**
	 * 根据商品ID获取商品
	 * @param productid
	 * @return
	 * @throws SQLException
	 */
	public Product getProductByID(String productid) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM product WHERE productid = ?";
		Map<String,Object> map = qr.query(sql, new MapHandler(), productid);
		Product product = new Product();
		BeanMapUtil.mapToBean(map, product);
		return product;
	}

	/**
	 * 添加商品
	 * @param product
	 * @throws SQLException 
	 */
	public void addProduct(Product product) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = (Map<String, Object>) BeanMapUtil.beanToMap(product);
		
		String attr = (String) map.keySet().toArray()[0];
		for (int i = 1; i < 14; i++) {  // 拼接属性字段
			attr = attr + "," + (String) map.keySet().toArray()[i];
		}
		
		String sql = "insert into shop(" + attr + ") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		qr.update(sql, map.values().toArray());
	}
}
