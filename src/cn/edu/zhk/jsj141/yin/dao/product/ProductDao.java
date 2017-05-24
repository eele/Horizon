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
	 * @param op 商品类别cid或搜索关键字
	 * @param shopid
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public int getTotalCount(int op, String shopid, String param) throws SQLException {
		// TODO Auto-generated method stub
		String sql = null;
		Object[] params = null;
		if(op == 0) {
			sql="SELECT count(*) FROM product WHERE shopid like ? and cid like ?";
			Object[] params1 = {shopid, param};
			params = params1;
		} else {
			sql="SELECT count(*) FROM product WHERE shopid like ? and ( productName like ? or brand like ? )";
			Object[] params1 = {shopid, "%"+param+"%", "%"+param+"%"};
			params = params1;
		}
		Map<String,Object> map = qr.query(sql, new MapHandler(), params);
		return Integer.parseInt(String.valueOf(map.get("count(*)")));
	}

	/**
	 * 获取某店铺当前页的指定商品
	 * @param op 商品类别cid或搜索关键字
	 * @param pBean
	 * @param shopid
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public List<Product> getCurrentPageBean(int op, PageBean<Product> pBean, String shopid, String param) throws SQLException {
		// TODO Auto-generated method stub
		String sql = null;
		Object[] params = null;
		if(op == 0) {
			sql="SELECT * FROM product WHERE shopid like ? and cid like ? ORDER BY orderBy DESC LIMIT ?,?";
			Object[] params1 = {shopid, param, (pBean.getCurrentPage()-1)*pBean.getPageSize(), pBean.getPageSize()};
			params = params1;
		} else {
			sql="SELECT * FROM product WHERE shopid like ? and ( productName like ? or brand like ? ) ORDER BY orderBy DESC LIMIT ?,?";
			Object[] params1 = {shopid, "%"+param+"%", "%"+param+"%", (pBean.getCurrentPage()-1)*pBean.getPageSize(), pBean.getPageSize()};
			params = params1;
		}
		
        return qr.query(sql, new BeanListHandler<Product>(Product.class), params);
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
		
		String sql = "insert into product(" + attr + ") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		qr.update(sql, map.values().toArray());
	}

	/**
	 * 修改商品
	 * @param product
	 * @throws SQLException 
	 */
	public void updateProduct(Product product) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = (Map<String, Object>) BeanMapUtil.beanToMap(product);
		
		String attr = "";
		for (int i = 0; i < 14; i++) {  // 拼接属性字段
			attr = attr + (String) map.keySet().toArray()[i] + "=?, ";
		}
		attr = attr.substring(0, attr.length()-2); //去除最后的逗号
		
		String sql = "update product set " + attr + "where productid = '" + product.getProductid() + "'";
		qr.update(sql, map.values().toArray());
	}

	public void delProduct(String productid) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from product where productid=?";
		qr.update(sql, productid);
	}
}
