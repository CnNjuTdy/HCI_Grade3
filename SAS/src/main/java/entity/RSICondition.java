package entity;

import java.util.ArrayList;

public class RSICondition {
	int market;
	int appearance;
	int buyarea;		//超买区域
	int sellarea;		//超卖区域
	int buysiginal;		//买进信号
	int sellsiginal;	//卖出信号
	int change;
	int headmarket;
	int value;
	int siginal912;

	public RSICondition(){
		market=0;
		buyarea=0;
		sellarea=0;
		buysiginal=0;
		sellsiginal=0;
		change=0;
		appearance=0;
		headmarket=0;
		value=0;
		siginal912=0;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
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
	
	public int getAppearance() {
		return appearance;
	}

	public int getSiginal912() {
		return siginal912;
	}

	public void setSiginal912(int siginal912) {
		this.siginal912 = siginal912;
	}

	public void setAppearance(int appearance) {
		this.appearance = appearance;
	}

	public int getHeadmarket() {
		return headmarket;
	}

	public void setHeadmarket(int headmarket) {
		this.headmarket = headmarket;
	}

	public ArrayList<String> getResult(){
		ArrayList<String> result=new ArrayList<String>();
		if(value==1){
			String word="RSI值在50附近波动,该指标失去参考价值。";
			result.add(word);
		}
		if(market>0){
			String word="当前为强势市场。";
			result.add(word);
		}else if(market<0){
			String word="当前为弱势市场。";
			result.add(word);
		}
		if(headmarket>0){
			String word="当前市场属于多头市场。";
			result.add(word);
		}else if(headmarket<0){
			String word="当前市场属于空头市场。";
			result.add(word);
		}
		if(appearance>0){
			String word="6日指标上升到达80，股市已有超买现象。";
			result.add(word);
		}else if(appearance<0){
			String word="6日强弱指标下降至20，表示股市有超卖现象。";
			result.add(word);
		}
		if(buyarea-sellarea>1){
			String word="已到严重超买的警戒区，股价已形成头部，极可能在短期内反转回转。";
			result.add(word);
		}else if(buyarea-sellarea<-1){
			String word="已到严重超卖区域，股价极可能有止跌回升的机会。";
			result.add(word);
		}else{
			String word="行情呈现买卖平衡,变化趋势不是很明显。";
			result.add(word);
		}
		if(buysiginal-sellsiginal>1){
			String word="短期RSI线在低位向上突破长期RSI线，一般为RSI指标的“黄金交叉”，为买入信号。";
			result.add(word);
		}else if(buysiginal-sellsiginal<-1){
			String word="短期RSI线在高位向下突破长期RSI线，一般为RSI指标的“死亡交叉”，为卖出信号。";
			result.add(word);
		}
		if(change==1){
			String word="随机指标倾斜度趋于平缓，可能发生短期转势。";
			result.add(word);
		}else if(change==2){
			String word="随机指标与股价出现背离，一般发生转势";
			result.add(word);
		}
		if(siginal912==1){
			String word="市场的多头力量开始增强，股价将向上攀升，为中线买入信号。当前期股价经过了在一段狭小的价位区间整理，然后带量突破时，这种买入信号比较准确。投资者应及时买入市场。";
			result.add(word);
		}else if(siginal912==2){
			String word="市场的多头力量开始衰弱，股价面临向下调整的压力，为短线卖出信号。对于那些短期涨幅较大的市场，这种卖出信号更加强烈。投资者应及时短线离场观望。";
			result.add(word);
		}else if(siginal912==3){
			String word="空头力量开始强大，股价将面临大幅下跌的可能，为中线卖出信号。对于那些高位盘整的市场，这种卖出信号更加强烈。";
			result.add(word);
		}
		return result;
	}
}
