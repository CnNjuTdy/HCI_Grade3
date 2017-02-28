package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import entity.KDJ;
import entity.Stock;
import util.DBUtil;

public class KDJDAO {
	Connection conn = DBUtil.getConn();
	Statement state = null;
	ResultSet rs = null;
	int days = 60;

	public List<KDJ> getList(String id) {
		List<KDJ> list = new ArrayList<KDJ>();
		init(id);
		String sql = "select round(Kvalue,2) K,  round(Dvalue,2) D, round(Jvalue,2) J, date from(select * from kdj  where id = '"
				+ id + "' order by date desc limit 60) t order by date asc;";
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			while (rs.next()) {
				KDJ kdj = new KDJ();
				kdj.setKvalue(rs.getDouble("K"));
				kdj.setDvalue(rs.getDouble("D"));
				kdj.setJvalue(rs.getDouble("J"));
				kdj.setDate(rs.getString("date"));
				list.add(kdj);
			}
			if (list.size() > 0)
				deleteKDJ(id, list.get(0).getDate());
		} catch (Exception e) {
			System.out.println("KDJDAO getList 数据库报错");
		}
		// System.out.println(list.size());
		return list;
	}
	private void deleteKDJ(String id, String date) {
		// TODO Auto-generated method stub
		String sql = "delete from kdj where id = '" + id + "' and date < '" + date + "'";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void init(String id) {
		// TODO Auto-generated method stub
		String sql_date = "select * from kdj_update where id = '" + id + "'";
		try {
			state = conn.createStatement();
			ResultSet rs_date = state.executeQuery(sql_date);
			String begin = "";
			if (rs_date.next())
				begin = rs_date.getString("date").toString();
			else {
				String sql = "select min(date) begin from stock where id = '"+id+"' ";
				Statement st = conn.createStatement();
				ResultSet rs_begin = st.executeQuery(sql);
				if (rs_begin.next()) begin = rs_begin.getString("begin");
				sql = "insert into kdj_update values('" + id + "','" + begin + "')";
				PreparedStatement prestmt_update = conn.prepareStatement(sql);
				prestmt_update.execute();
				StockDAO dao = new StockDAO();
				Stock stock = dao.getStock(id, begin);
				double close = stock.getClose();
				sql = "insert into kdj values(50,50,50,'" + begin + "','" + id + "')";
				prestmt_update = conn.prepareStatement(sql);
				prestmt_update.execute();
			}
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			StockDAO stockDao = new StockDAO();
			List<Stock> stocks = stockDao.getDefaultList(id, begin);
			double pKvalue = 0;
			double pJvalue = 0;
			String sql = "select * from kdj where id = '" + id + "' and date <= '" + begin + "'";
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			if (rs.next()) {
				pKvalue = rs.getDouble("Kvalue");
				pJvalue = rs.getDouble("Jvalue");
			}
			for (int i = 0; i < stocks.size(); i++) {
				double m = stocks.get(i).getLow();
				double n = stocks.get(i).getHigh();
				double[] ans = stockDao.getMinAndMaxClose(id, stocks.get(i).getDate(), 9);
				double min = ans[1];
				double max = ans[0];
				double rsv = 0;
				if (min == max) { pKvalue = 100; pJvalue = 100; rsv = 100;}
				else rsv = (stocks.get(i).getClose() - min) / (max - min) * 100;
				KDJ kdj = new KDJ(pKvalue, pJvalue, rsv, stocks.get(i).getDate());
				sql = "insert into kdj values(" + kdj.getKvalue() + "," + kdj.getDvalue() + "," + kdj.getJvalue()
						+ ",'" + stocks.get(i).getDate() + "','" + id + "')";
				PreparedStatement prestmt_update = conn.prepareStatement(sql);
				prestmt_update.execute();
				pKvalue = kdj.getKvalue();
				pJvalue = kdj.getDvalue();

			}
			if (stocks.size() > 0) {
				String sql_update = "update kdj_update set date='" + stocks.get(stocks.size() - 1).getDate()
						+ "' where id = '" + id + "'";
				PreparedStatement prestmt_update = conn.prepareStatement(sql_update);
				prestmt_update.execute();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
