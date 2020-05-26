package stockCode;

public class Info {
	// 종목명	현재가	전일비	등락률	액면가	거래량	시가	고가	저가
	
	
	
	private String stockName; //종목명
	private String currentPrice; //현재가
	private String before; //전일비
	private String upDown; //등락률
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public String getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(String currentPrice) {
		this.currentPrice = currentPrice;
	}
	public String getBefore() {
		return before;
	}
	public void setBefore(String before) {
		this.before = before;
	}
	public String getUpDown() {
		return upDown;
	}
	public void setUpDown(String upDown) {
		this.upDown = upDown;
	}
	@Override
	public String toString() {
		return "Info [stockName=" + stockName + ", currentPrice=" + currentPrice + ", before=" + before + ", upDown="
				+ upDown + "]";
	}
	
	
	
	
	
	
}
