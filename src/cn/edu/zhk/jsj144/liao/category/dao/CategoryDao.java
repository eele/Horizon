package cn.edu.zhk.jsj144.liao.category.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.edu.zhk.jsj141.yin.util.ConnectionManager;
import cn.edu.zhk.jsj144.liao.category.Category;

public class CategoryDao {
	
	//把一个Map中的数据映射到Category中
	private Category toCategory(Map<String,Object> map) {
		/*
		 * map {cid:xx, cname:xx, pid:xx, desc:xx, orderBy:xx}
		 * Category{cid:xx, cname:xx, parent:(cid=pid), desc:xx}
		 */
		Category category = new Category();
		category.setCid((String)map.get("cid"));
		category.setCname((String)map.get("cname"));
		category.setDesc((String)map.get("desc"));
		String pid = (String)map.get("pid");  // 如果是一级分类，那么pid是null
		if(pid != null) {
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
	
	/**
	 * 返回所有分类
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Category> findAll() throws SQLException, ClassNotFoundException {
		Connection conn = ConnectionManager.getConnection();
		//查询出所有一级分类
		String sql = "select * from t_category where pid is null order by orderBy";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		List<Map<String,Object>> mapList = ConnectionManager.resultSetToList(rs);
		
		List<Category> parents = toCategoryList(mapList);
		
		//循环遍历所有的一级分类，为每个一级分类添加它的二级分类 
		for(Category parent : parents) {
			// 查询出当前一级分类的所有二级分类
			List<Category> children = findByParent(parent.getCid());
			// 设置给一级分类
			parent.setChildren(children);
		}
		
		conn.close();
		return parents;
	}
	
	/**
	 * 通过一级分类查询二级分类
	 * @param pid
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public List<Category> findByParent(String pid) throws SQLException, ClassNotFoundException {
		Connection conn = ConnectionManager.getConnection();
		
		String sql = "select * from t_category where pid=? order by orderBy";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, pid);
		ResultSet rs = statement.executeQuery();
		List<Map<String,Object>> mapList = ConnectionManager.resultSetToList(rs);
		
		conn.close();
		return toCategoryList(mapList);
	}
	
	/**
	 * 添加分类
	 * @param category
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public void add(Category category) throws SQLException, ClassNotFoundException {
		Connection conn = ConnectionManager.getConnection();
		
		String sql = "insert into t_category(cid,cname,pid,`desc`) values(?,?,?,?)";
		String pid = null;//一级分类
		if(category.getParent() != null) {
			pid = category.getParent().getCid();
		}
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, category.getCid());
		statement.setString(2, category.getCname());
		statement.setString(3, pid);
		statement.setString(4, category.getDesc());
		statement.executeUpdate();
		
		conn.close();
	}
	
	/**
	 * 获取所有不带二级分类的一级分类
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException 
	 */
	public List<Category> findParents() throws SQLException, ClassNotFoundException {
		Connection conn = ConnectionManager.getConnection();
		
		String sql = "select * from t_category where pid is null order by orderBy";
		PreparedStatement statement = conn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		List<Map<String,Object>> mapList = ConnectionManager.resultSetToList(rs);
		
		conn.close();
		return toCategoryList(mapList);
	}
	
	/**
	 * 获取一级分类或二级分类
	 * @param cid
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public Category load(String cid) throws SQLException, ClassNotFoundException {
		Connection conn = ConnectionManager.getConnection();
		
		String sql = "select * from t_category where cid=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, cid);
		ResultSet rs = statement.executeQuery();
		List<Map<String,Object>> mapList = ConnectionManager.resultSetToList(rs);
		
		conn.close();
		return toCategory(mapList.get(0));
	}
	
	/**
	 * 修改一级分类或二级分类
	 * @param category
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public void edit(Category category) throws SQLException, ClassNotFoundException {
		Connection conn = ConnectionManager.getConnection();
		
		String sql = "update t_category set cname=?, pid=?, `desc`=? where cid=?";
		String pid = null;
		if(category.getParent() != null) {
			pid = category.getParent().getCid();
		}
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, category.getCname());
		statement.setString(2, pid);
		statement.setString(3, category.getDesc());
		statement.setString(4, category.getCid());
		statement.executeUpdate();
		
		conn.close();
	}
	
	/**
	 * 查询指定一级分类下二级分类的个数
	 * @param pid
	 * @return
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public int findChildrenCountByParent(String pid) throws SQLException, ClassNotFoundException {
		Connection conn = ConnectionManager.getConnection();
		
		String sql = "select count(*) from t_category where pid=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, pid);
		ResultSet rs = statement.executeQuery();
		
		Number cnt = rs.getInt(0);

		conn.close();
		return cnt == null ? 0 : cnt.intValue();
	}
	
	/**
	 * 删除分类
	 * @param cid
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public void delete(String cid) throws SQLException, ClassNotFoundException {
		Connection conn = ConnectionManager.getConnection();
		
		String sql = "delete from t_category where cid=?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setString(1, cid);
		statement.executeUpdate();

		conn.close();
	}
}
