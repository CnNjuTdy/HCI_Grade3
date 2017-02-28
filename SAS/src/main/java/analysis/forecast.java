package analysis;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.StockDAO;
import entity.KDJ;
import entity.Stock;
import entity.Tendency;

public class forecast {
	public Tendency getTomorrow(String id){
		Tendency tendency=new Tendency();
		List<Stock> stocks = new ArrayList<Stock>();
		StockDAO stockDAO=new StockDAO();
		stockDAO=new StockDAO();
		stocks=stockDAO.getDefaultList(id,new Date(),8);
		double min=stocks.get(0).getLow();
		double max=stocks.get(0).getHigh();
		for(int i=0;i<stocks.size();i++){
			min=Math.min(min, stocks.get(i).getLow());
			max=Math.max(max, stocks.get(i).getHigh());
		}
		double distance=max-min;
		analysis analysis=new analysis();
		List<KDJ> list = analysis.getKDJ(id);
		double k=list.get(list.size()-1).getKvalue();
		double price1=k*distance+stocks.get(stocks.size()-1).getClose();
		int klen=list.size();
		int klocat=list.size()-1;

		int kten=0;
		if(list.get(klen-1).getKvalue()<=list.get(klen-2).getKvalue()){
			while(list.get(klocat).getKvalue()<=list.get(klocat-1).getKvalue()){
				if(kten>0){break;}
				if(list.get(klocat).getKvalue()<list.get(klocat-1).getKvalue()){
					kten=-1;
				}
				klocat--;
			}
		}
		if(list.get(klen-1).getKvalue()>=list.get(klen-2).getKvalue()){
			while(list.get(klocat).getKvalue()>=list.get(klocat-1).getKvalue()){
				if(kten<0){break;}
				if(list.get(klocat).getKvalue()>list.get(klocat-1).getKvalue()){
					kten=1;
				}
				klocat--;
			}
		}
		System.out.println(5);
		double speed=(list.get(klen-1).getKvalue()-list.get(klocat).getKvalue())/(klen-klocat);
		double price2=(k+speed)*distance+stocks.get(stocks.size()-1).getClose();
		int slen=stocks.size();
		int slocat=stocks.size()-1;
		int sten=0;
		if(stocks.get(slen-1).getClose()<=stocks.get(slen-2).getClose()){
			while(stocks.get(slocat).getClose()<=stocks.get(slocat-1).getClose()){
				if(sten>0){break;}
				if(stocks.get(slocat).getClose()<stocks.get(slocat-1).getClose()){
					sten=-1;
				}
				slocat--;
			}
		}
		if(stocks.get(slen-1).getClose()>=stocks.get(slen-2).getClose()){
			while(stocks.get(slocat).getClose()>=stocks.get(slocat-1).getClose()){
				if(sten<0){break;}
				if(stocks.get(slocat).getClose()>stocks.get(slocat-1).getClose()){
					sten=1;
				}
				slocat--;
			}
		}
		System.out.println(7);
		int days=slen-slocat;
		if(days>5){
			days=5;
		}
		System.out.println(6);
		double stockspeed=(stocks.get(slen-1).getClose()-stocks.get(slocat).getClose())/days;
		double price3=stocks.get(stocks.size()-1).getClose()+stockspeed*5;
		tendency.setPriceone(price1);
		tendency.setPricetwo(price2);
		tendency.setPricethree(price3);
		tendency.setPricetoday(stocks.get(stocks.size()-1).getClose());
		return tendency;
	} 
}
