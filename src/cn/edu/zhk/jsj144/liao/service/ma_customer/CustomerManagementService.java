package cn.edu.zhk.jsj144.liao.service.ma_customer;

import java.sql.SQLException;
import java.util.List;

import cn.edu.zhk.jsj141.feng.entity.user.User;
import cn.edu.zhk.jsj141.yin.dao.customer.CustomerManagementDao;
import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;

public class CustomerManagementService {

	CustomerManagementDao customerManagementDao = new CustomerManagementDao();

	public PageBean<User> getByPage(PageBean<User> pBean, String param)
			throws SQLException {
        //查询总条数
        int totalCount=customerManagementDao.getTotalCount(param);
        
        //查询当前页的数据
        List<User> Users=customerManagementDao.getCurrentPageBean(pBean, param);
        
        PageBean< User> pBean2=new PageBean<User>();
        pBean2.setTotalCount(totalCount);
        pBean2.setBean(Users);
        pBean2.setCurrentPage(pBean.getCurrentPage());
        pBean2.setPageSize(pBean.getPageSize());
        return pBean2;
    }

	public void resetUserPwd(String uid) {
		// TODO Auto-generated method stub
		customerManagementDao.resetUserPwd(uid);
	}
}
