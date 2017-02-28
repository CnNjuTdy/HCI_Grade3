package entity;

import java.util.ArrayList;

public class Condition {
	int market;
	int buyarea;		//超买区域
	int sellarea;		//超卖区域
	int buysiginal;		//买进信号
	int sellsiginal;	//卖出信号
	int change;
	
	public Condition(){
		market=0;
		buyarea=0;
		sellarea=0;
		buysiginal=0;
		sellsiginal=0;
		change=0;
	}

	public int getSellarea() {
		return sellarea;
	}

	public void setSellarea(int sellarea) {
		this.sellarea = sellarea;
	}

	public int getMarket() {
		return market;
	}

	public void setMarket(int market) {
		this.market = market;
	}

	public int getBuyarea() {
		return buyarea;
	}

	public void setBuyarea(int buyarea) {
		this.buyarea = buyarea;
	}

	public int getBuysiginal() {
		return buysiginal;
	}

	public void setBuysiginal(int buysiginal) {
		this.buysiginal = buysiginal;
	}

	public int getSellsiginal() {
		return sellsiginal;
	}

	public void setSellsiginal(int sellsiginal) {
		this.sellsiginal = sellsiginal;
	}

	public int getChange() {
		return change;
	}

	public void setChange(int change) {
		this.change = change;
	}
	
	public ArrayList<String> getResult(){
		ArrayList<String> result=new ArrayList<String>();
		if(market>0){
			String word="当前为多头市场，后市看涨。";
			result.add(word);
		}else if(market<0){
			String word="当前为空头市场，后市看跌。";
			result.add(word);
		}
		if(buyarea-sellarea>1){
			String word="行情呈现超买现象，宜卖出，卖出时机应与其他指标结合判断，防止损利。";
			result.add(word);
		}else if(buyarea-sellarea<-1){
			String word="行情呈现超卖现象，宜买入，买入时机应与其他指标相结合判断，防止套牢。";
			result.add(word);
		}else{
			String word="行情呈现买卖平衡,变化趋势不是很明显。";
			result.add(word);
		}
		if(buysiginal-sellsiginal>1){
			String word="出现金叉，为买进信号，后市股价可能会有相当的涨幅。";
			result.add(word);
		}else if(buysiginal-sellsiginal<-1){
			String word="出现死叉，为卖出信号，后市股价可能会有相当的跌幅。";
			result.add(word);
		}
		if(change==1){
			String word="随机指标倾斜度趋于平缓，可能发生短期转势。";
			result.add(word);
		}else if(change==2){
			String word="随机指标与股价出现背离，一般发生转势";
			result.add(word);
		}
		return result;
	}
}