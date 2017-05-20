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

	public int getTotalCount(String cid) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT count(*) FROM product WHERE cid like ?";
		Map<String,Object> map = qr.query(sql, new MapHandler(), cid);
		return Integer.parseInt(String.valueOf(map.get("count(*)")));
	}

	public List<Product> getCurrentPageBean(PageBean<Product> pBean, String cid) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM product WHERE cid like ? ORDER BY purDate DESC LIMIT ?,?";
        return qr.query(sql, new BeanListHandler<Product>(Product.class), 
        		cid, 
        		(pBean.getCurrentPage()-1)*pBean.getPageSize(), pBean.getPageSize());
	}

	public Product getProductByID(String productid) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM product WHERE productid = ?";
		Map<String,Object> map = qr.query(sql, new MapHandler(), productid);
		Product product = new Product();
		BeanMapUtil.mapToBean(map, product);
		return product;
	}

	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		
	}
}
