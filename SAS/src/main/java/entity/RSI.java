package entity;

public class RSI {
	int n;
	double RS;
	double RSI;
	String date;
	public RSI(double[] closelist,String date){
		this.n=closelist.length-1;
		double increase=0;
		double decrease=0;
		double[] change=new double[n];
		for(int i=0;i<n;i++){
			change[i]=closelist[i+1]-closelist[i];
		}
		for(int i=0;i<n;i++){
			if(change[i]>=0)
				increase=increase+change[i];
			if(change[i]<0)
				decrease=decrease-change[i];
		}
		this.RS=increase/decrease;
		this.RSI=100-100/(1+RS);
		this.date=date;
	}
	public String getDate() {
		return date;
	}
	public int getN() {
		return n;
	}
	public double getRSI() {
		return RSI;
	}
}
