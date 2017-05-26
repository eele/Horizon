import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.dbutils.QueryRunner;

import cn.edu.zhk.jsj141.yin.util.BeanMapUtil;
import cn.edu.zhk.jsj141.yin.util.JDBCUtils;


public class DB {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		for(int i=2;i<80;i++) {
		String sql = "INSERT INTO `horizon`.`product` (`productid`, `shopid`, `productName`, `image_b`, `image_w`, `price`, `currPrice`, `brand`, `productNum`, `salesNum`, `proDate`, `purDate`, `cid`, `productDesc`, `orderBy`) VALUES (?, 'a0a42d69-e6e4-4072-8a0a-0777a3dac587', 'U盘"+i+"', '/Horizon/Back_Shop/ma_product/product_img/5b9a1d61-121b-4ba3-8a48-76c91028ae89_Udisk1.jpg', '/Horizon/Back_Shop/ma_product/product_img/af0fc0c0-28f0-484a-bd62-d4590ce478b4_Udisk2.jpg', '50', '30', '品质U盘', '100', '0', '2016-12-01', '2016-12-10', '92bce0f0-4f53-4994-97b6-42a3eb7d13c8', '这是U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1U盘1', '83');";
		try {
			qr.update(sql,UUID.randomUUID().toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

}
