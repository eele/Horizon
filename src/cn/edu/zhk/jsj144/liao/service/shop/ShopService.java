package cn.edu.zhk.jsj144.liao.service.shop;

import java.sql.SQLException;

import cn.edu.zhk.jsj141.yin.dao.shop.ShopDao;
import cn.edu.zhk.jsj144.liao.entity.shop.ShopInfo;

/**
 * 店铺信息业务层
 * @author ele
 *
 */
public class ShopService {
	private ShopDao shopDao = new ShopDao();
	
	/**
	 * 获取店铺信息
	 * @param uid
	 * @return
	 */
	public ShopInfo getShopInfo(String uid) {
		ShopInfo shopInfo = null;
		try {
			shopInfo = shopDao.getShopInfo(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shopInfo;
	}
	
	/**
	 * 添加店铺信息
	 * @param shopInfo
	 */
	public void addShopInfo(ShopInfo shopInfo) {
		try {
			shopDao.addShopInfo(shopInfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改店铺信息
	 * @param shopInfo
	 */
	public void editShopInfo(ShopInfo shopInfo) {
		try {
			shopDao.editShopInfo(shopInfo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
