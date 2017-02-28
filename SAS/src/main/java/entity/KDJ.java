package entity;

public class KDJ{
	double Jvalue;
	double Dvalue;
	double Kvalue;
	double Rsv;
	double preDvalue;
	double preKvalue;
	String date;
	public KDJ(){
		
	}
	public KDJ(double pK,double pD,double r,String date){
		this.preDvalue=pD;
		this.preKvalue=pK;
		this.Rsv=r;
		this.Kvalue=this.preKvalue*2/3+this.Rsv/3;
		this.Dvalue=this.preDvalue*2/3+this.Kvalue/3;
		this.Jvalue=this.Kvalue*3-Dvalue*2;
		this.date=date;
	}
	
	public String getDate() {
		return date;
	}

	public double getJvalue() {
		return Jvalue;
	}

	public double getDvalue() {
		return Dvalue;
	}

	public double getKvalue() {
		return Kvalue;
	}

	public double getRsv() {
		return Rsv;
	}

	public double getPreDvalue() {
		return preDvalue;
	}

	public double getPreKvalue() {
		return preKvalue;
	}
	public void setJvalue(double jvalue) {
		Jvalue = jvalue;
	}
	public void setDvalue(double dvalue) {
		Dvalue = dvalue;
	}
	public void setKvalue(double kvalue) {
		Kvalue = kvalue;
	}
	public void setDate(String date) {
		this.date = date;
	}
	

}