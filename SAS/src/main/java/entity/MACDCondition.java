package entity;

import java.util.ArrayList;

public class MACDCondition {
	int market;
	int tendency;		//趋势
	int siginal;		//买进信号
	int change;
	int marketchange;
	
	public MACDCondition(){
		market=0;
		tendency=0;
		siginal=0;
		change=0;
		marketchange=0;
	}

	public int getMarketchange() {
		return marketchange;
	}

	public void setMarketchange(int marketchange) {
		this.marketchange = marketchange;
	}

	public int getMarket() {
		return market;
	}

	public void setMarket(int market) {
		this.market = market;
	}

	public int getTendency() {
		return tendency;
	}

	public void setTendency(int tendency) {
		this.tendency = tendency;
	}

	public int getSiginal() {
		return siginal;
	}

	public void setSiginal(int siginal) {
		this.siginal = siginal;
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
			String word="当前行情处于多头行情中，可以买入开仓或多头持仓。";
			result.add(word);
		}else if(market<0){
			String word="当前行情处于空头行情中，可以卖出开仓或观望。";
			result.add(word);
		}
		if(tendency>0){
			String word="当前行情即将上涨，可以买入开仓或多头持仓。";
			result.add(word);
		}else if(tendency<0){
			String word="当前行情处于下跌阶段，可以卖出开仓和观望。";
			result.add(word);
		}
		if(siginal>0){
			String word="出现金叉，买进信号参考，大势属多头市场，后市股价可能会有相当的涨幅。";
			result.add(word);
		}else if(siginal<0){
			String word="出现死叉，卖出信号参考，大势属空头市场，后市股价可能会有相当的跌幅。";
			result.add(word);
		}else{
			String word="行情波动幅度小,变化趋势不是很明显。";
			result.add(word);
		}
		if(change==1){
			String word="DIF线与K线发生背离，行情可能出现反转信号。";
			result.add(word);
		}
		if(marketchange>0){
			String word="MACD由负变正，市场由空头转为多头。";
			result.add(word);
		}else if(marketchange<0){
			String word="MACD由正变负，市场由多头转为空头。";
			result.add(word);
		}
		return result;
	}
}