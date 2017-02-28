package entity;

import org.junit.experimental.max.MaxCore;

public class Tendency {
	double priceone;
	double pricetwo;
	double pricethree;
	double pricetoday;
	String analysis;
	
	public Tendency(){
		priceone=0;
		pricetwo=0;
		pricethree=0;
		pricetoday=0;
		analysis="";
	}
	
	public double getPricetoday() {
		return pricetoday;
	}

	public void setPricetoday(double pricetoday) {
		this.pricetoday = pricetoday;
	}

	public double getPricethree() {
		return pricethree;
	}

	public void setPricethree(double pricethree) {
		this.pricethree = pricethree;
	}

	public double getPriceone() {
		return priceone;
	}

	public void setPriceone(double priceone) {
		this.priceone = priceone;
	}

	public double getPricetwo() {
		return pricetwo;
	}

	public void setPricetwo(double pricetwo) {
		this.pricetwo = pricetwo;
	}

	public String getAnalysis() {
		if(priceone>=pricetoday){
			if(pricetwo>=pricetoday){
				if(pricethree>=pricetoday){
					double min,max,mid,temp;
					min=priceone;
					mid=pricetwo;
					max=pricethree;
					if(min>mid){
						temp=min;
						min=mid;
						mid=temp;
					}
					if(mid>max){
						temp=mid;
						mid=max;
						max=temp;
					}
					if(min>mid){
						temp=min;
						min=mid;
						mid=temp;
					}
					analysis="明日第一压力位为"+String.valueOf(min)+"，"+"第二压力位为"+String.valueOf(mid)+","
							+"明日第三压力位为"+String.valueOf(max)+"。";
				}else if(pricethree<pricetoday){
					if(priceone>=pricetwo){
						analysis="明日第一压力位为"+String.valueOf(pricetwo)+"，"+"第二压力位为"+String.valueOf(priceone)+","
								+"明日支撑位为"+String.valueOf(pricethree)+"。";
					}else if(priceone<pricetwo){
						analysis="明日第一压力位为"+String.valueOf(priceone)+"，"+"第二压力位为"+String.valueOf(pricetwo)+","
								+"明日支撑位为"+String.valueOf(pricethree)+"。";
					}
				}
			}else if(pricetwo<pricetoday){
				if(pricethree>=pricetoday){
					if(pricethree>=priceone){
						analysis="明日第一压力位为"+String.valueOf(priceone)+"，"+"第二压力位为"+String.valueOf(pricethree)+","
								+"明日支撑位为"+String.valueOf(pricetwo)+"。";
					}else if(pricethree<priceone){
						analysis="明日第一压力位为"+String.valueOf(pricethree)+"，"+"第二压力位为"+String.valueOf(priceone)+","
								+"明日支撑位为"+String.valueOf(pricetwo)+"。";
					}
				}else if(pricethree<pricetoday){
					if(pricethree>=pricetwo){
						analysis="明日第一支撑位为"+String.valueOf(pricethree)+"，"+"第二支撑位为"+String.valueOf(pricetwo)+","
								+"明日压力位为"+String.valueOf(priceone)+"。";
					}else if(pricethree<pricetwo){
						analysis="明日第一支撑位为"+String.valueOf(pricetwo)+"，"+"第二支撑位为"+String.valueOf(pricethree)+","
								+"明日压力位为"+String.valueOf(priceone)+"。";
					}
				}
			}
		}else if(priceone<pricetoday){
			if(pricetwo>=pricetoday){
				if(pricethree>=pricetoday){
					if(pricethree>=pricetwo){
						analysis="明日第一压力位为"+String.valueOf(pricetwo)+"，"+"第二压力位为"+String.valueOf(pricethree)+","
								+"明日支撑位为"+String.valueOf(priceone)+"。";
					}else if(pricethree<pricetwo){
						analysis="明日第一压力位为"+String.valueOf(pricethree)+"，"+"第二压力位为"+String.valueOf(pricetwo)+","
								+"明日支撑位为"+String.valueOf(priceone)+"。";
					}
				}else if(pricethree<pricetoday){
					if(pricethree>=priceone){
						analysis="明日第一支撑位为"+String.valueOf(pricethree)+"，"+"第二支撑位为"+String.valueOf(priceone)+","
								+"明日压力位为"+String.valueOf(pricetwo)+"。";
					}else if(pricethree<priceone){
						analysis="明日第一支撑位为"+String.valueOf(priceone)+"，"+"第二支撑位为"+String.valueOf(pricethree)+","
								+"明日压力位为"+String.valueOf(pricetwo)+"。";
					}
				}
			}else if(pricetwo<pricetoday){
				if(pricethree>=pricetoday){
					if(pricetwo>=priceone){
						analysis="明日第一支撑位为"+String.valueOf(pricetwo)+"，"+"第二支撑位为"+String.valueOf(priceone)+","
								+"明日压力位为"+String.valueOf(pricethree)+"。";
					}else if(pricetwo<priceone){
						analysis="明日第一支撑位为"+String.valueOf(priceone)+"，"+"第二支撑位为"+String.valueOf(pricetwo)+","
								+"明日压力位为"+String.valueOf(pricethree)+"。";
					}
				}else if(pricethree<pricetoday){
					double min,max,mid,temp;
					min=priceone;
					mid=pricetwo;
					max=pricethree;
					if(min>mid){
						temp=min;
						min=mid;
						mid=temp;
					}
					if(mid>max){
						temp=mid;
						mid=max;
						max=temp;
					}
					if(min>mid){
						temp=min;
						min=mid;
						mid=temp;
					}
					analysis="明日第一支撑位为"+String.valueOf(max)+"，"+"第二支撑位为"+String.valueOf(mid)+","
							+"明日第三支撑位为"+String.valueOf(min)+"。";
				}
			}
		}
		return analysis;
	}

}
