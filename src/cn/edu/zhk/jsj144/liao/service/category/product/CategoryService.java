package cn.edu.zhk.jsj144.liao.service.category.product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import cn.edu.zhk.jsj144.liao.entity.category.product.Category;

/**
 * 商品类别业务层
 * @author ele
 *
 */
public class CategoryService {
//	private CategoryDao categoryDao = new CategoryDao();
//	
//	/**
//	 * 查询指定一级分类下二级分类的个数
//	 * @param pid
//	 * @return
//	 */
//	public int findChildrenCountByParent(String pid) {
//		try {
//			return categoryDao.findChildrenCountByParent(pid);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//	
//	/**
//	 * 删除分类
//	 * @param cid
//	 */
//	public void delete(String cid) {
//		try {
//			categoryDao.delete(cid);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//	
//	/**
//	 * 修改分类
//	 * @param category
//	 */
//	public void edit(Category category) {
//		try {
//			categoryDao.edit(category);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//	
//	/**
//	 * 加载分类
//	 * @param cid
//	 * @return
//	 */
//	public Category load(String cid) {
//		try {
//			return categoryDao.load(cid);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//	
//	/**
//	 * 添加分类
//	 * @param category
//	 */
//	public void add(Category category) {
//		try {
//			categoryDao.add(category);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
	
	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Category> findAll() {
//		try {
//			return categoryDao.findAll();
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
		
		List<Category> objectTypes = new ArrayList<Category>();
		List<Category> c = new ArrayList<Category>();
		Category e = new Category();
		Category e1 = new Category();
		Category e2 = new Category();
		e.setCname("aa");
		e.setDesc("aaa");
		e1.setParent(e);
		e1.setCname("aa1");
		e1.setDesc("aaa1");
		e2.setParent(e);
		e2.setCname("ab");
		e2.setDesc("abab");
		
        c.add(0, e1);
        c.add(1, e2);
        e.setChildren(c);
        objectTypes.add(0, e);
		return objectTypes;
	}
	
//	/**
//	 * 获取所有一级分类，不带二级分类
//	 * @return
//	 */
//	public List<Category> findParents() {
//		try {
//			return categoryDao.findParents();
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//	
//	/**
//	 * 查询指定一级分类下的所有二级分类
//	 * @param pid
//	 * @return
//	 */
//	public List<Category> findChildren(String pid) {
//		try {
//			return categoryDao.findByParent(pid);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
}
