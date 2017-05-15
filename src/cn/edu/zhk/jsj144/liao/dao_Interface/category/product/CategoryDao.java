package cn.edu.zhk.jsj144.liao.dao_Interface.category.product;

import java.sql.SQLException;
import java.util.List;

import cn.edu.zhk.jsj144.liao.entity.category.product.Category;

public interface CategoryDao {

	/**
	 * 返回所有分类
	 * @return
	 * @throws SQLException 
	 */
	public abstract List<Category> findAll() throws SQLException;

	/**
	 * 通过一级分类查询二级分类
	 * @param pid
	 * @return
	 * @throws SQLException 
	 */
	public abstract List<Category> findByParent(String pid) throws SQLException;

	/**
	 * 添加分类
	 * @param category
	 * @throws SQLException 
	 */
	public abstract void add(Category category) throws SQLException;

	/**
	 * 获取所有不带二级分类的一级分类
	 * @return
	 * @throws SQLException
	 */
	public abstract List<Category> findParents() throws SQLException;

	/**
	 * 加载分类
	 * 即可加载一级分类，也可加载二级分类
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public abstract Category load(String cid) throws SQLException;

	/**
	 * 修改分类
	 * 即可修改一级分类，也可修改二级分类
	 * @param category
	 * @throws SQLException 
	 */
	public abstract void edit(Category category) throws SQLException;

	/**
	 * 查询指定一级分类下二级分类的个数
	 * @param pid
	 * @return
	 * @throws SQLException 
	 */
	public abstract int findChildrenCountByParent(String pid)
			throws SQLException;

	/**
	 * 删除分类
	 * @param cid
	 * @throws SQLException 
	 */
	public abstract void delete(String cid) throws SQLException;

}