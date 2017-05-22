package cn.edu.zhk.jsj144.liao.service.ma_customer;

import java.sql.SQLException;
import java.util.List;

import cn.edu.zhk.jsj141.feng.entity.order.Order;
import cn.edu.zhk.jsj141.feng.entity.user.User;
import cn.edu.zhk.jsj141.yin.dao.customer.CustomerManagementDao;
import cn.edu.zhk.jsj144.liao.entity.ma_customer.Tr_record;
import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;

public class CustomerManagementService {

	CustomerManagementDao customerManagementDao = new CustomerManagementDao();

	@SuppressWarnings("unchecked")
	public <T> PageBean<T> getByPage(int op, PageBean<T> pBean, String[] params)
			throws SQLException {
        //查询总条数和当前页的数据
		List<T> records = null;
		int totalCount = 0;
		if(op == 1) {
			totalCount=customerManagementDao.getUserTotalCount(params);
			records=(List<T>) customerManagementDao.getUserCurrentPageBean((PageBean<User>) pBean, params);
		} else if(op == 2) {
			totalCount=customerManagementDao.getTrRecordTotalCount(params);
			records=(List<T>) customerManagementDao.getTrRecordCurrentPageBean((PageBean<Tr_record>) pBean, params);
		} else if(op == 3) {
			totalCount=customerManagementDao.getTrRecordTotalCount(params);
			records=(List<T>) customerManagementDao.getOrderCurrentPageBean((PageBean<Order>) pBean, params);
		}
        
        PageBean<T> pBean2=new PageBean<T>();
        pBean2.setTotalCount(totalCount);
        pBean2.setBean(records);
        pBean2.setCurrentPage(pBean.getCurrentPage());
        pBean2.setPageSize(pBean.getPageSize());
        return pBean2;
    }

	public void resetUserPwd(String uid) throws SQLException {
		// TODO Auto-generated method stub
		customerManagementDao.resetUserPwd(uid);
	}

	public boolean delUser(String uid) throws SQLException {
		// TODO Auto-generated method stub
		boolean hasShop = customerManagementDao.hasShop(uid);
		boolean hasOrder = customerManagementDao.hasOrder(uid);
		boolean allowDel = false;
		if(!hasShop && !hasOrder) {
			customerManagementDao.delUser(uid);
			allowDel = true;
		}
		return allowDel;
	}
}
