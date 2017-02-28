package dao;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entity.Stock;
import util.DBUtil;

public class StockDAO {
    Connection conn = DBUtil.getConn();
    Statement state = null;
    ResultSet rs = null;
    int days = 30;

    /**
     * 更新该id的stock信息,并更新时间
     *
     * @param id
     */


    /**
     * 返回id的默认30天的信息(List)
     *
     * @param id
     * @return
     */
    public List<Stock> getDefaultList(String id) {
        // TODO Auto-generated method stub
        List<Stock> list = new ArrayList<Stock>();
        String sql = "select * from(select * from stock  where id = '" + id + "' order by date desc limit "
                + (days + 1) + ") t order by date asc";
        System.out.println(sql);
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            double close_yday = 0;
            String deleteDate = "";
            if (rs.next()) {
                close_yday = rs.getDouble("close");
                deleteDate = rs.getString("date");
            }

            while (rs.next()) {
                Stock stock = new Stock();
                stock.setId(rs.getString("id"));
                stock.setName(rs.getString("name"));
                stock.setDate(rs.getString("date"));
                stock.setOpen(rs.getDouble("open"));
                stock.setClose(rs.getDouble("close"));
                stock.setLow(rs.getDouble("low"));
                stock.setHigh(rs.getDouble("high"));
                stock.setVolume(rs.getLong("volume"));
                stock.setAdj_price(rs.getDouble("adj_price"));
                stock.setTurnover(rs.getDouble("turnover"));
                stock.setPb(rs.getDouble("pb"));
                stock.setClose_yday(close_yday);
                close_yday = rs.getDouble("close");
                stock.setChangeAndChg();
                // System.out.println(stock.getDate());
                list.add(stock);
            }

            // deleteStock(id,deleteDate); //删除使剩下day+1(31)条记录
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 返回id的从begin开始的信息
     *
     * @param id
     * @param begin
     * @return
     */
    public List<Stock> getDefaultList(String id, String begin) {
        // TODO Auto-generated method stub
        List<Stock> list = new ArrayList<Stock>();
        String sql = "select * from stock  where id = '" + id + "' and date > '" + begin + "' order by date asc";
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            double close_yday = 0;
            String deleteDate = "";
            if (rs.next()) {
                close_yday = rs.getDouble("close");
                deleteDate = rs.getString("date");
            }

            while (rs.next()) {
                Stock stock = new Stock();
                stock.setId(rs.getString("id"));
                stock.setName(rs.getString("name"));
                stock.setDate(rs.getString("date"));
                stock.setOpen(rs.getDouble("open"));
                stock.setClose(rs.getDouble("close"));
                stock.setLow(rs.getDouble("low"));
                stock.setHigh(rs.getDouble("high"));
                stock.setVolume(rs.getLong("volume"));
                stock.setAdj_price(rs.getDouble("adj_price"));
                stock.setTurnover(rs.getDouble("turnover"));
                stock.setPb(rs.getDouble("pb"));
                stock.setClose_yday(close_yday);
                close_yday = rs.getDouble("close");
                stock.setChangeAndChg();
                // System.out.println(stock.getDate());
                list.add(stock);
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 返回id的从end往前days天的信息
     *
     * @param id
     * @param end
     * @param days
     * @return
     */
    public List<Stock> getDefaultList(String id, Date end, int days) {
        // TODO Auto-generated method stub
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        List<Stock> list = new ArrayList<Stock>();
        try {
            String sql = "select * from(select * from stock  where id = '" + id + "' and date <= '" + df.format(end)
                    + "'order by date desc limit " + days + ") t order by date asc";
            state = conn.createStatement();
            rs = state.executeQuery(sql);

            while (rs.next()) {
                Stock stock = new Stock();
                stock.setId(rs.getString("id"));
                stock.setName(rs.getString("name"));
                stock.setDate(rs.getString("date"));
                stock.setOpen(rs.getDouble("open"));
                stock.setClose(rs.getDouble("close"));
                stock.setLow(rs.getDouble("low"));
                stock.setHigh(rs.getDouble("high"));
                stock.setVolume(rs.getLong("volume"));
                stock.setAdj_price(rs.getDouble("adj_price"));
                stock.setTurnover(rs.getDouble("turnover"));
                stock.setPb(rs.getDouble("pb"));
                // System.out.println(stock.getDate());
                list.add(stock);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 返回id的30天的信息(json)
     *
     * @param id
     * @return
     */
    public String getDefaultJsonList(String id) {
        // TODO Auto-generated method stub
        List<Stock> list = new ArrayList<Stock>();
        String sql = "select * from stock  where id = '" + id + "' order by date desc limit " + days;
        String ans = "[";
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            int flag = 0;
            while (rs.next()) {
                String stock = ",{";
                if (flag == 0) {
                    flag = 1;
                    stock = "{";
                }
                stock += "\"id\":\"" + rs.getString("id") + "\", ";
                stock += "\"name\":\"" + rs.getString("name") + "\", ";
                stock += "\"date\":\"" + rs.getString("date") + "\", ";
                stock += "\"open\":" + String.valueOf(rs.getDouble("open")) + ", ";
                stock += "\"close\":" + String.valueOf(rs.getDouble("close")) + ", ";
                stock += "\"low\":" + String.valueOf(rs.getDouble("low")) + ", ";
                stock += "\"high\":" + String.valueOf(rs.getDouble("high")) + ", ";
                stock += "\"volume\":" + String.valueOf(rs.getLong("volume")) + ", ";
                stock += "\"adj_price\":" + String.valueOf(rs.getDouble("adj_price")) + ", ";
                stock += "\"turnover\":" + String.valueOf(rs.getDouble("turnover")) + ", ";
                stock += "\"pb\":" + String.valueOf(rs.getDouble("pb")) + "}";
                // System.out.println(stock.getJson());
                ans += stock;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        ans += "]";
        // System.out.println(ans);
        return ans;
    }

    /**
     * 返回20天内平均值
     *
     * @param name
     * @return
     */
    public String getAverageValue(String name) {
        // TODO Auto-generated method stub
        String id = getIdByName(name);
        String sql = "select round(avg(open),2) avg_open,round(avg(close),2) avg_close, "
                + "round(avg(close*volume)/100000000,2) avg_amo,round(avg(volume)/100,0) "
                + "avg_volume,round(avg(adj_price),2) avg_adj,round(avg(turnover),2) avg_turnover, round(avg(pb),2) avg_pb "
                + "from stock  where id = '" + id + "' order by date desc limit 20";
        String ans = "{";
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if (rs.next()) {
                ans += "'id':'" + id + "',";
                ans += "'name':'" + name + "',";
                ans += "'open':'" + rs.getDouble("avg_open") + "',";
                ans += "'close':'" + rs.getDouble("avg_close") + "',";
                ans += "'amo':'" + rs.getDouble("avg_amo") + "',";
                ans += "'volume':'" + rs.getLong("avg_volume") + "',";
                ans += "'adj_price':'" + rs.getDouble("avg_adj") + "',";
                ans += "'turnover':'" + rs.getDouble("avg_turnover") + "',";
                ans += "'pb':'" + rs.getDouble("avg_pb") + "'}";
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // System.out.println(ans);
        return ans;
    }

    /**
     * @param name
     * @return
     */
    private String getIdByName(String name) {
        String id = "";
        String sql = "select * from stocklist where name = '" + name + "'";
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if (rs.next())
                id = rs.getString("id");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
//		System.out.println(id);
        return id;
    }

    private String getNameById(String id) {
        String name = "";
        String sql = "select * from stocklist where id = '" + id + "'";
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if (rs.next())
                name = rs.getString("name");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
//		System.out.println(name);
        return name;
    }

    /**
     * 查找id是否存在,返回true/false
     */
    public boolean findID(String value) {
        // TODO Auto-generated method stub
        String sql = "select * from stocklist where id = '" + value + "'";
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    /**
     * 查找id是否存在,返回true/false
     */
    private boolean checkName(String value) {
        // TODO Auto-generated method stub
        String sql = "select * from stocklist where name = '" + value + "'";
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    /**
     * 模糊查找名字，返回符合的名字列表
     */
    public String findName(String value) {
        // TODO Auto-generated method stub
        String sql = "select * from stocklist where name like '%" + value + "%'";
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            String ans = "[";
            if (rs.next())
                ans += "{'name':'" + rs.getString("name") + "','id':'" + rs.getString("id") + "'}";
            else
                return "fail";
            while (rs.next()) {
                ans += ", {'name':'" + rs.getString("name") + "','id':'" + rs.getString("id") + "'}";
            }
            ans += "]";
            return ans;
        } catch (Exception e) {

        }
        return "fail";
    }

    public static void main(String[] args) {
        // System.out.print("???");
        StockDAO dao = new StockDAO();
        System.out.println(dao.findID("sh600050"));

    }

    public Stock getStock(String id, String date) {
        // TODO Auto-generated method stub
        String sql = "select * from stock where id = '" + id + "' and date = '" + date + "'";
        Stock stock = new Stock();
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if (rs.next()) {
                stock.setId(rs.getString("id"));
                stock.setName(rs.getString("name"));
                stock.setDate(rs.getString("date"));
                stock.setOpen(rs.getDouble("open"));
                stock.setClose(rs.getDouble("close"));
                stock.setLow(rs.getDouble("low"));
                stock.setHigh(rs.getDouble("high"));
                stock.setVolume(rs.getLong("volume"));
                stock.setAdj_price(rs.getDouble("adj_price"));
                stock.setTurnover(rs.getDouble("turnover"));
                stock.setPb(rs.getDouble("pb"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return stock;
    }

    public double[] getMinAndMaxClose(String id, String date, int days) {
        // TODO Auto-generated method stub
        String sql = "select max(close) max ,min(close) min from stock where id = '" + id + "' and date <= '" + date + "' limit " + days;
        double[] ans = new double[2];
        ans[0] = 0;
        ans[1] = 0;
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if (rs.next()) {
                ans[0] = rs.getDouble("max");
                ans[1] = rs.getDouble("min");
            }
        } catch (Exception e) {
            System.out.println("StockDAO getMinAndMaxClose 数据库报错");
        }
        return ans;

    }

    public String checkInput(String input) {
        if (findID(input)) return getNameById(input);
        if (checkName(input)) return input;
        return "error";
    }

}
