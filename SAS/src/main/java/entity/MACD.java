package entity;

public class MACD{
	double EMA12;
	double EMA26;
	double DIF;
	double DEA;
	double MACD;
	String date;
	
	public MACD(){
		
	}
	
	public MACD(double close,double perEMA12,double perEMA26,double perDEA,String date){
		this.EMA12=perEMA12*11/13+close*2/13;
		this.EMA26=perEMA26*25/27+close*2/27;
		this.DIF=this.EMA12-this.EMA26;
		this.DEA=perDEA*8/10+this.DIF*2/10;
		this.MACD=2*(this.DIF-this.DEA);
		this.date=date;
	}	
	public String getDate() {
		return date;
	}
	
	public double getEMA12() {
		return EMA12;
	}
	public double getEMA26() {
		return EMA26;
	}
	public double getDIF() {
		return DIF;
	}
	public double getDEA() {
		return DEA;
	}
	public double getMACD() {
		return MACD;
	}

	public void setEMA12(double eMA12) {
		EMA12 = eMA12;
	}

	public void setEMA26(double eMA26) {
		EMA26 = eMA26;
	}

	public void setDIF(double dIF) {
		DIF = dIF;
	}

	public void setDEA(double dEA) {
		DEA = dEA;
	}

	public void setMACD(double mACD) {
		MACD = mACD;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
