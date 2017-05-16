package cn.edu.zhk.jsj141.yin.test;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Test;

import cn.edu.zhk.jsj141.yin.dao.shop.ShopDao;
import cn.edu.zhk.jsj144.liao.entity.shop.ShopInfo;

public class ShopDaoTest {
	ShopDao shopdao = new ShopDao();
	@Test
	public void testGetShopInfo() {
		try {
			System.out.println(shopdao.getShopInfo("123"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Test
	public void testAddShopInfo() {
		try {
			shopdao.addShopInfo(new ShopInfo());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testEditShopInfo() {
		fail("Not yet implemented");
	}

}
