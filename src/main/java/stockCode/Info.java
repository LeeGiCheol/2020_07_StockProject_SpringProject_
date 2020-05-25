package stockCode;

public class Info {
	// 종목명	현재가	전일비	등락률	액면가	거래량	시가	고가	저가
	
	
	
	private String a; //종목명
	private String b; //현재가
	private String c; //전일비
	private String d; //등락률
	
	
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	@Override
	public String toString() {
		return "Info [a=" + a + ", b=" + b + ", c=" + c + ", d=" + d + "]";
	}
	
	
	
	
	
}
