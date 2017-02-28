package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import entity.Market;
import util.DBUtil;

public class MarketDAO {
	Connection conn = DBUtil.getConn();
	Statement state = null;
	ResultSet rs = null;
	int days = 30;
	
	public List<Market> getDefaultList() {
		// TODO Auto-generated method stub
		List<Market> list = new ArrayList<Market>();
		String sql = "select * from (select * from market order by date desc limit "+days+")t order by date asc";
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			while(rs.next()){
				Market market = new Market();
				market.setDate(rs.getString("date"));
				market.setOpen(rs.getDouble("open"));
				market.setClose(rs.getDouble("close"));
				market.setLow(rs.getDouble("low"));
				market.setHigh(rs.getDouble("high"));
				market.setVolume(rs.getLong("volume"));
				market.setAdj_price(rs.getDouble("adj_price"));
//				System.out.println(market.getDate());
				list.add(market);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return list;
	}
	
	public static void main(String[] args){
//		System.out.print("???");
		MarketDAO dao = new MarketDAO();
		dao.getDefaultList();
	}
}
