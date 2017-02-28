package dao;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBUtil;

public class RankDAO {
	Connection conn = DBUtil.getConn();
	Statement state = null;
	ResultSet rs = null;

	public static void main(String[] args) {
		System.out.println("RankDAO 数据库 初始化 _(:зゝ∠)_");
//		RankDAO dao = new RankDAO();
//		System.out.println(dao.getList("red", "change"));
		try {
			System.out.println(InetAddress.getLocalHost());
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("结束啦(*￣▽￣)y ");
	}

	public String getList(String type, String keyword) {
		String ans = "[";
		String sql = "select * from rank where type = '"+type+"' and keyword = '"+keyword+"'";
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			if (rs.next())
				ans += "{'id':'" + rs.getString("id") + "', 'name':'" + rs.getString("name") + "', 'data':"
						+ rs.getString("data") + "}";
			while (rs.next()) {
				ans += ",{'id':'" + rs.getString("id") + "', 'name':'" + rs.getString("name") + "', 'data':"
						+ rs.getString("data") + "}";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ans += "]";
		return ans;
	}

	

}
