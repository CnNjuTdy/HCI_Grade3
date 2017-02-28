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


import entity.MACD;
import entity.Stock;
import util.DBUtil;

public class MACDDAO {
	Connection conn = DBUtil.getConn();
	Statement state = null;
	ResultSet rs = null;
	int days = 60;	
	
	public List<MACD> getList(String id){
		List<MACD> list = new ArrayList<MACD>();
		init(id);
		String sql = "select round(MACD,2) macd, round(DEA,2) dea, round(DIF,2) dif, round(EMA12,2) ema12, round(EMA26,2) ema26, date from(select * from macd  where id = '" + id + "' order by date desc limit "
				+ days + ") t order by date asc";
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			while (rs.next()) {
				MACD macd = new MACD();
				macd.setMACD(rs.getDouble("macd"));
				macd.setDEA(rs.getDouble("dea"));
				macd.setDIF(rs.getDouble("dif"));
				macd.setEMA12(rs.getDouble("ema12"));
				macd.setEMA26(rs.getDouble("ema26"));
				macd.setDate(rs.getString("date"));
				list.add(macd);
			}
		}catch(Exception e){
			System.out.println("MACDDAO getList 数据库出错");
		}
		return list;
	}
	private void deleteMACD(String id, String date) {
		// TODO Auto-generated method stub
		String sql = "delete from macd where id = '"+id+"' and date < '"+date+"'";
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
		String sql_date = "select * from macd_update where id = '"+id+"'";
		try {
			state = conn.createStatement();
			ResultSet rs_date = state.executeQuery(sql_date);
			String begin = "";
			if (rs_date.next())
				begin = rs_date.getString("date").toString();
			else{
				String sql = "select min(date) begin from stock where id = '"+id+"'";
				Statement st = conn.createStatement();
				ResultSet rs_begin = st.executeQuery(sql);
				if (rs_begin.next()) begin = rs_begin.getString("begin");
				rs_begin.close();
				sql = "insert into macd_update values('"+id+"','"+begin+"')";
				PreparedStatement prestmt_update = conn.prepareStatement(sql);
				prestmt_update.execute();
				StockDAO dao = new StockDAO();
				Stock stock = dao.getStock(id, begin);
				double close = stock.getClose();
				sql = "insert into macd values(0,0,"+close+","+close+",0,'"+begin+"','"+id+"')";
				prestmt_update = conn.prepareStatement(sql);
				prestmt_update.execute();
			}			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			
			StockDAO stockDao = new StockDAO();
			List<Stock> stocks = stockDao.getDefaultList(id, begin);
			double EMA12 = 0;
			double EMA26 = 0;
			double DEA = 0;
			String sql = "select * from macd where id = '"+id+"' and date <= '"+begin+"'";
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			if (rs.next()) {
				EMA12 = rs.getDouble("EMA12");
				EMA26 = rs.getDouble("EMA26");
				DEA = rs.getDouble("DEA");
			}
			for (int i = 0; i <stocks.size(); i++){
				MACD macd=new MACD(stocks.get(i).getClose(),EMA12,EMA26,DEA,stocks.get(i).getDate());
				sql = "insert into macd values("+macd.getMACD()+","+macd.getDIF()+","+macd.getEMA12()+","+macd.getEMA26()+","+macd.getDEA()+",'"+stocks.get(i).getDate()+"','"+id+"')";
				PreparedStatement prestmt_update = conn.prepareStatement(sql);
				prestmt_update.execute();
				EMA12=macd.getEMA12();
				EMA26=macd.getEMA26();
				DEA=macd.getDEA();
			}
			if (stocks.size()>0) {
				String sql_update = "update macd_update set date='" + stocks.get(stocks.size()-1).getDate() + "' where id = '"+id+"'";
				PreparedStatement prestmt_update = conn.prepareStatement(sql_update);
				prestmt_update.execute();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
