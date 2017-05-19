package cn.edu.zhk.jsj141.yin.dao.product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.zhk.jsj141.yin.util.JDBCUtils;
import cn.edu.zhk.jsj144.liao.entity.category.product.Category;
import cn.edu.zhk.jsj144.liao.entity.pager.Expression;
import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.entity.pager.PageConstants;
import cn.edu.zhk.jsj144.liao.entity.product.Product;

public class ProductDao {
private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
	
//	/**
//	 * 按bid查询
//	 * @param bid
//	 * @return
//	 * @throws SQLException
//	 */
//	public Product findByBid(String bid) throws SQLException {
//		String sql = "SELECT * FROM t_product b, t_category c WHERE b.cid=c.cid AND b.bid=?";
//		// 一行记录中，包含了很多的product的属性，还有一个cid属性
//		Map<String,Object> map = qr.query(sql, new MapHandler(), bid);
//		// 把Map中除了cid以外的其他属性映射到product对象中
//		Product product = CommonUtils.toBean(map, Product.class);
//		// 把Map中cid属性映射到Category中，即这个Category只有cid
//		Category category = CommonUtils.toBean(map, Category.class);
//		// 两者建立关系
//		product.setCategory(category);
//		
//		// 把pid获取出来，创建一个Category parnet，把pid赋给它，然后再把parent赋给category
//		if(map.get("pid") != null) {
//			Category parent = new Category();
//			parent.setCid((String)map.get("pid"));
//			category.setParent(parent);
//		}
//		return product;
//	}
	
	/**
	 * 查询指定分类下商品的个数
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public int findproductCountByCategory(String cid) throws SQLException {
		String sql = "select count(*) from t_product where cid=?";
		Number cnt = (Number)qr.query(sql, new ScalarHandler(), cid);
		return cnt == null ? 0 : cnt.intValue();
	}
	
	/**
	 * 获取所有商品列表
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException 
	 */
	public PageBean<Product> getProductList(int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("cid", "like", "&"));
		return findByCriteria(exprList, pc);
	}
	
	/**
	 * 按分类查询
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException 
	 */
	public PageBean<Product> findByCategory(String cid, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("cid", "=", cid));
		return findByCriteria(exprList, pc);
	}
	
	/**
	 * 按名模糊查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Product> findByBname(String bname, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("bname", "like", "%" + bname + "%"));
		return findByCriteria(exprList, pc);
	}
	
//	/**
//	 * 多条件组合查询
//	 * @param combination
//	 * @param pc
//	 * @return
//	 * @throws SQLException
//	 */
//	public PageBean<Product> findByCombination(Product criteria, int pc) throws SQLException {
//		List<Expression> exprList = new ArrayList<Expression>();
//		exprList.add(new Expression("bname", "like", "%" + criteria.getBname() + "%"));
//		exprList.add(new Expression("author", "like", "%" + criteria.getAuthor() + "%"));
//		exprList.add(new Expression("press", "like", "%" + criteria.getPress() + "%"));
//		return findByCriteria(exprList, pc);
//	}
	
	/**
	 * 通用的查询方法
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException 
	 */
	private PageBean<Product> findByCriteria(List<Expression> exprList, int pc) throws SQLException {
		/*
		 * 1. 得到ps
		 * 2. 得到tr
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.PRO_PAGE_SIZE;//每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder(" where 1=1"); 
		List<Object> params = new ArrayList<Object>();//SQL中有问号，它是对应问号的值
		for(Expression expr : exprList) {
			/*
			 * 添加一个条件上，
			 * 1) 以and开头
			 * 2) 条件的名称
			 * 3) 条件的运算符，可以是=、!=、>、< ... is null，is null没有值
			 * 4) 如果条件不是is null，再追加问号，然后再向params中添加一与问号对应的值
			 */
			whereSql.append(" and ").append(expr.getName())
				.append(" ").append(expr.getOperator()).append(" ");
			// where 1=1 and bid = ?
			if(!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数 
		 */
		String sql = "select count(*) from t_product" + whereSql;
		Number number = (Number)qr.query(sql, new ScalarHandler(), params.toArray());
		int tr = number.intValue();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from t_product" + whereSql + " order by orderBy limit ?,?";
		params.add((pc-1) * ps);//当前页首行记录的下标
		params.add(ps);//一共查询几行，就是每页记录数
		
		List<Product> beanList = qr.query(sql, new BeanListHandler<Product>(Product.class), 
				params.toArray());
		
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Product> pb = new PageBean<Product>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		return pb;
	}
}
