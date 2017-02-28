package entity;

import java.util.ArrayList;

public class ROLLCondition {
	int priceten;
	int reorganize;
	int upanddown;
	int characteristic;
	int amer;
	int mid;
	int USAten;
	public ROLLCondition(){
		priceten=0;
		reorganize=0;
		characteristic=0;
		amer=0;
		mid=0;
		USAten=0;
	}
	public int getPriceten() {
		return priceten;
	}
	public void setPriceten(int priceten) {
		this.priceten = priceten;
	}
	public int getReorganize() {
		return reorganize;
	}
	public void setReorganize(int reorganize) {
		this.reorganize = reorganize;
	}
	public int getUpanddown() {
		return upanddown;
	}
	public void setUpanddown(int upanddown) {
		this.upanddown = upanddown;
	}
	public int getCharacteristic() {
		return characteristic;
	}
	public void setCharacteristic(int characteristic) {
		this.characteristic = characteristic;
	}
	public int getAmer() {
		return amer;
	}
	public void setAmer(int amer) {
		this.amer = amer;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getUSAten() {
		return USAten;
	}
	public void setUSAten(int uSAten) {
		USAten = uSAten;
	}
	public ArrayList<String> getResult(){
		ArrayList<String> result=new ArrayList<String>();
		if(priceten>0){
			String word="股价强势特征非常明显，股价短期内将继续上涨，投资者应坚决持股待涨或逢低买入。";
			result.add(word);
		}else if(priceten<0){
			String word="股价的弱势特征非常明显，股价短期内将继续下跌，投资者应坚决持币观望或逢高卖出。";
			result.add(word);
		}
		if(reorganize>0){
			String word="股价是上涨途中的强势整理，投资者可以持股观望或逢低短线买入。";
			result.add(word);
		}else if(reorganize<0){
			String word="股价是下跌途中的弱势整理，投资者应以持币观望或逢高减仓为主。";
			result.add(word);
		}
		if(upanddown>0){
			String word="股价将经历一轮下跌，下跌的幅度将由开口的大小决定。";
			result.add(word);
		}else if(upanddown<0){
			String word="股价将经历一轮上涨，上涨的幅度将由开口的大小决定。";
			result.add(word);
		}
		if(characteristic==1){
			String word="股价的强势特征开始出现，股价将上涨，投资者应以中长线买入股票为主。";
			result.add(word);
		}else if(characteristic==2){
			String word="股价的强势特征已经确立，股价将可能短线大涨，投资者应以持股待涨或短线买入为主。";
			result.add(word);
		}else if(characteristic==-1){
			String word="股价的短期行情可能回暖，投资者可以及时适量买进股票，作短线反弹行情。";
			result.add(word);
		}else if(characteristic==-2){
			String word="股价处于极度弱势行情，投资者应坚决以持币观望为主，尽量不买入股票。";
			result.add(word);
		}
		if(amer>0){
			String word="股市的强势特征依旧，股价短期内还将上涨，投资者应坚决持股待涨，直到股价的运动方向开始有向下的迹象时，密切注意行情是否转势。";
			result.add(word);
		}else if(amer<0){
			String word="股价短期的强势行情可能结束，股价短期内将大跌，投资者应及时短线卖出股票、离场观望。特别是对于短线涨幅很大的股票。";
			result.add(word);
		}
		if(mid>0){
			String word="股价处于强势上涨过程中，只要股价不跌破中轨线，投资者坚决一路持股。";
			result.add(word);
		}else if(mid<0){
			String word="股价处于弱势下跌过程中，只要股价不向上反转突破中轨线，稳健的投资者都可一路观望。";
			result.add(word);
		}
		if(USAten==1){
			String word="股价的短期强势行情即将结束，股价的短期走势不容乐观，投资者应以逢高减仓为主。";
			result.add(word);
		}else if(USAten==2){
			String word="股价前期的强势行情已经结束，股价的中期下跌趋势已经形成，投资者应中线及时卖出股票。";
			result.add(word);
		}else if(USAten==3){
			String word="股价的短期行情可能回暖，投资者可以及时适量买进股票，作短线反弹行情。";
			result.add(word);
		}else if(USAten==4){
			String word="股价短期内将止跌企稳，投资者可以少量逢低建仓。";
			result.add(word);
		}
		return result;
	}
}
