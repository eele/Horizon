package cn.edu.zhk.jsj144.liao.service.shop;

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
		return shopDao.getShopInfo(uid);
	}
	
	/**
	 * 添加店铺信息
	 * @param shopInfo
	 */
	public void addShopInfo(ShopInfo shopInfo) {
		shopDao.addShopInfo(shopInfo);
	}
	
	/**
	 * 修改店铺信息
	 * @param shopInfo
	 */
	public void editShopInfo(ShopInfo shopInfo) {
		shopDao.editShopInfo(shopInfo);
	}
}
