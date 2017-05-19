package cn.edu.zhk.jsj144.liao.service.product;

import java.sql.SQLException;
import java.util.List;

import cn.edu.zhk.jsj141.yin.dao.product.ProductDao;
import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.entity.product.Product;

public class ProductService {
	private ProductDao productDao = new ProductDao();
	
	public PageBean<Product> getByPage(PageBean<Product> pBean, String cid) throws SQLException {
        
        //查询总条数
        int totalCount=productDao.getTotalCount(cid);
        
        //查询当前页的数据
        List<Product> products=productDao.getCurrentPageBean(pBean,cid);
        
        PageBean< Product> pBean2=new PageBean<Product>();
        pBean2.setTotalCount(totalCount);
        pBean2.setBean(products);
        pBean2.setCurrentPage(pBean.getCurrentPage());
        pBean2.setPageSize(pBean.getPageSize());
        return pBean2;
    }

	public Product getProductByID(String productid) {
		// TODO Auto-generated method stub
		Product product = null;
		try {
			product = productDao.getProductByID(productid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	
	
}
