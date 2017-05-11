package cn.edu.zhk.jsj144.liao.category.service;

import java.sql.SQLException;
import java.util.List;

import cn.edu.zhk.jsj144.liao.category.Category;
import cn.edu.zhk.jsj144.liao.category.dao.CategoryDao;

public class CategoryService {
	private CategoryDao categoryDao = new CategoryDao();
	
	/**
	 * 查询指定父分类下子分类的个数
	 * @param pid
	 * @return
	 * @throws ClassNotFoundException 
	 */
	public int findChildrenCountByParent(String pid) throws ClassNotFoundException {
		try {
			return categoryDao.findChildrenCountByParent(pid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 删除分类
	 * @param cid
	 * @throws ClassNotFoundException 
	 */
	public void delete(String cid) throws ClassNotFoundException {
		try {
			categoryDao.delete(cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 修改分类
	 * @param category
	 * @throws ClassNotFoundException 
	 */
	public void edit(Category category) throws ClassNotFoundException {
		try {
			categoryDao.edit(category);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 加载分类
	 * @param cid
	 * @return
	 * @throws ClassNotFoundException 
	 */
	public Category load(String cid) throws ClassNotFoundException {
		try {
			return categoryDao.load(cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 添加分类
	 * @param category
	 * @throws ClassNotFoundException 
	 */
	public void add(Category category) throws ClassNotFoundException {
		try {
			categoryDao.add(category);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 查询所有分类
	 * @return
	 * @throws ClassNotFoundException 
	 */
	public List<Category> findAll() throws ClassNotFoundException {
		try {
			return categoryDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 获取所有父分类，不带子分类
	 * @return
	 * @throws ClassNotFoundException 
	 */
	public List<Category> findParents() throws ClassNotFoundException {
		try {
			return categoryDao.findParents();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 查询指定父分类下的所有子分类
	 * @param pid
	 * @return
	 * @throws ClassNotFoundException 
	 */
	public List<Category> findChildren(String pid) throws ClassNotFoundException {
		try {
			return categoryDao.findByParent(pid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
