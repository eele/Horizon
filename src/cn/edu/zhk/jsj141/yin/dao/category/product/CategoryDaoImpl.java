package cn.edu.zhk.jsj141.yin.dao.category.product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.zhk.jsj141.yin.entity.category.product.Category;
import cn.edu.zhk.jsj141.yin.util.JDBCUtils;

public class CategoryDaoImpl implements CategoryDao {
	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
	
	/*
	 * 把Map中的数据映射到Category中
	 */
	private Category toCategory(Map<String,Object> map) {
		Category category = new Category();
		category.setCid((String)map.get("cid"));
		category.setCname((String)map.get("cname"));
		category.setDesc((String)map.get("desc"));
		
		String pid = (String)map.get("pid");// 如果是一级分类，那么pid是null
		if(pid != null) {//如果一级分类ID不为空，
			Category parent = new Category();
			parent.setCid(pid);
			category.setParent(parent);
		}
		return category;
	}
	
	/*
	 * 可以把多个Map(List<Map>)映射成多个Category(List<Category>)
	 */
	private List<Category> toCategoryList(List<Map<String,Object>> mapList) {
		List<Category> categoryList = new ArrayList<Category>();//创建一个空集合
		for(Map<String,Object> map : mapList) {//循环遍历每个Map
			Category c = toCategory(map);//把一个Map转换成一个Category
			categoryList.add(c);//添加到集合中
		}
		return categoryList;//返回集合
	}
	
	/* (non-Javadoc)
	 * @see cn.edu.zhk.jsj141.yin.dao.category.product.CategoryDao#findAll()
	 */
	@Override
	public List<Category> findAll() throws SQLException {
		//查询出所有一级分类
		String sql = "select * from category where pid is null order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		
		List<Category> parents = toCategoryList(mapList);
		
		//循环遍历所有的一级分类，为每个一级分类添加它的二级分类 
		for(Category parent : parents) {
			// 查询出当前一级分类的所有二级分类
			List<Category> children = findByParent(parent.getCid());
			// 设置给一级分类
			parent.setChildren(children);
		}
		return parents;
	}
	
	/* (non-Javadoc)
	 * @see cn.edu.zhk.jsj141.yin.dao.category.product.CategoryDao#findByParent(java.lang.String)
	 */
	@Override
	public List<Category> findByParent(String pid) throws SQLException {
		String sql = "select * from category where pid=? order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(), pid);
		return toCategoryList(mapList);
	}
	
	/* (non-Javadoc)
	 * @see cn.edu.zhk.jsj141.yin.dao.category.product.CategoryDao#add(cn.edu.zhk.jsj141.yin.entity.category.product.Category)
	 */
	@Override
	public void add(Category category) throws SQLException {
		String sql = "insert into category(cid,cname,pid,`desc`) values(?,?,?,?)";
		String pid = null;//一级分类
		if(category.getParent() != null) {
			pid = category.getParent().getCid();
		}
		Object[] params = {category.getCid(), category.getCname(), pid, category.getDesc()};
		qr.update(sql, params);
	}
	
	/* (non-Javadoc)
	 * @see cn.edu.zhk.jsj141.yin.dao.category.product.CategoryDao#findParents()
	 */
	@Override
	public List<Category> findParents() throws SQLException {
		String sql = "select * from category where pid is null order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		
		return toCategoryList(mapList);
	}
	
	/* (non-Javadoc)
	 * @see cn.edu.zhk.jsj141.yin.dao.category.product.CategoryDao#load(java.lang.String)
	 */
	@Override
	public Category load(String cid) throws SQLException {
		String sql = "select * from category where cid=?";
		return toCategory(qr.query(sql, new MapHandler(), cid));
	}
	
	/* (non-Javadoc)
	 * @see cn.edu.zhk.jsj141.yin.dao.category.product.CategoryDao#edit(cn.edu.zhk.jsj141.yin.entity.category.product.Category)
	 */
	@Override
	public void edit(Category category) throws SQLException {
		String sql = "update category set cname=?, pid=?, `desc`=? where cid=?";
		String pid = null;
		if(category.getParent() != null) {
			pid = category.getParent().getCid();
		}
		Object[] params = {category.getCname(), pid, category.getDesc(), category.getCid()};
		qr.update(sql, params);
	}
	
	/* (non-Javadoc)
	 * @see cn.edu.zhk.jsj141.yin.dao.category.product.CategoryDao#findChildrenCountByParent(java.lang.String)
	 */
	@Override
	public int findChildrenCountByParent(String pid) throws SQLException {
		String sql = "select count(*) from category where pid=?";
		Number cnt = (Number)qr.query(sql, new ScalarHandler(), pid);
		return (cnt == null ? 0 : cnt.intValue());
	}
	
	/* (non-Javadoc)
	 * @see cn.edu.zhk.jsj141.yin.dao.category.product.CategoryDao#delete(java.lang.String)
	 */
	@Override
	public void delete(String cid) throws SQLException {
		String sql = "delete from category where cid=?";
		qr.update(sql, cid);
	}
}
