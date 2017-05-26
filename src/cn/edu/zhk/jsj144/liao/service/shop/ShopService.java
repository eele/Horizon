package cn.edu.zhk.jsj144.liao.service.shop;

import java.sql.SQLException;
import java.util.Map;

import cn.edu.zhk.jsj141.yin.dao.shop.ShopDao;
import cn.edu.zhk.jsj144.liao.entity.shop.ShopInfo;
import cn.edu.zhk.jsj144.liao.entity.shop.ShopVerify;

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

	public void setUpShop(ShopVerify shopVerify) {
		// TODO Auto-generated method stub
		try {
			shopDao.setUpShop(shopVerify);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Map<String, Object> CheckShopApplicationStatus(String loginname) {
		// TODO Auto-generated method stub
		try {
			Map<String, Object> map = shopDao.CheckShopApplicationStatus(loginname);
			if(map != null && map.get("status").equals("")) {
				map.put("status","w");
			}
			return map;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException();
		}
	}
}
