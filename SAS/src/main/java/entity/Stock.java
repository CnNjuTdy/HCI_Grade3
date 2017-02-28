package entity;

public class Stock {
	
	private String id;
	private String name;
	private String date;
	private double open;
	private double close;
	private double low;
	private double high;
	private long volume;
	private double adj_price;
	private double turnover;
	private double pb;
	private double close_yday;
	private double change;
	private double chg;	
	public Stock(){
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public double getOpen() {
		return open;
	}
	public void setOpen(double open) {
		this.open = open;
	}
	public double getClose() {
		return close;
	}
	public void setClose(double close) {
		this.close = close;
	}
	public double getClose_yday() {
		return close_yday;
	}
	public void setClose_yday(double close_yday) {
		this.close_yday = close_yday;
	}
	public double getLow() {
		return low;
	}
	public void setLow(double low) {
		this.low = low;
	}
	public double getHigh() {
		return high;
	}
	public void setHigh(double high) {
		this.high = high;
	}
	public long getVolume() {
		return volume;
	}
	public void setVolume(long volume) {
		this.volume = volume;
	}
	public double getAdj_price() {
		return adj_price;
	}
	public void setAdj_price(double adj_price) {
		this.adj_price = adj_price;
	}
	public double getTurnover() {
		return turnover;
	}
	public void setTurnover(double turnover) {
		this.turnover = turnover;
	}
	public double getPb() {
		return pb;
	}
	public void setPb(double pb) {
		this.pb = pb;
	}
	public void setChangeAndChg(){
		change = close - close_yday;
		chg = change / close_yday;
	}
	public double getChange(){
		return change;
	}
	public double getChg(){
		return chg;
	}
	
}
