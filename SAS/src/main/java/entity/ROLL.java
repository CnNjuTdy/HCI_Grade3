package entity;

public class ROLL {
	double MA;
	double MD;
	double MB;
	double UP;
	double DN;
	String date;
	
	public ROLL(double[] closelist,double MD,String d){
		double sum=0;
		for(int i=0;i<closelist.length;i++){
			sum=sum+closelist[i];
		}
		MA=sum/closelist.length;
		this.MD=MD;
		MB=(sum-closelist[0])/(closelist.length-1);
		UP=MB+2*MD;
		DN=MB-2*MD;
		date=d;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


	public double getMA() {
		return MA;
	}

	public void setMA(double mA) {
		MA = mA;
	}

	public double getMD() {
		return MD;
	}

	public void setMD(double mD) {
		MD = mD;
	}

	public double getMB() {
		return MB;
	}

	public void setMB(double mB) {
		MB = mB;
	}

	public double getUP() {
		return UP;
	}

	public void setUP(double uP) {
		UP = uP;
	}

	public double getDN() {
		return DN;
	}

	public void setDN(double dN) {
		DN = dN;
	}
	
}
