package stockCode;
//// 나중에 시간날때 하기 다른방법으로 완료
//
//
//package stockCode;
//
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.util.Arrays;
//
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//
//import com.bitcamp.project.vo.Info;
//
//public class News3 {
////	public Info news() {
//	public static void main(String[] args) {
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		String squery = null;
//
//		try {
////			for (int i= 0; i < 30; i++) {
//
//				String url = "http://www.paxnet.co.kr/news/main?newsSetId=4975&currentPageNo=1&genDate=20200616&objId=N4975";
//				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
//				doc = Jsoup.connect(url).get();
//				
//				String[] newsTitle = new String[20];
//				String[] newsContent = new String[20];
//				String[] img = new String[20];
//				String[] writer = new String[20];
//				String[] date = new String[20];
//	
//				for (int j = 0; j < 20; j++) {
//					String newsTitle_ = doc.select("#contents > div.cont-area > div.board-thumbnail > ul > li:nth-child("
//							+ (j + 1) + ") > dl > dt > a").text();
//					if(newsTitle_.equals("") && newsTitle_ == null) 
//						break;
//					
//					newsTitle[j] = newsTitle_;
//	
//					String newsContent_ = doc.select("#contents > div.cont-area > div.board-thumbnail > ul > li:nth-child("
//							+ (j + 1) + ") > dl > dd.cont").text();
//					newsContent[j] = newsContent_;
//	
//					String img_ = doc.select("#_img_span_" + (j + 1)).html();
//					if (!(img_.equals("")) && img_ != null) {
//						int imgIdx = img_.indexOf("src=");
//						int imgIdx2 = img_.indexOf("alt");
//						img_ = img_.substring(imgIdx + 7, imgIdx2 - 2);
//	
//						img[j] = img_;
//					}
//	
//					String writer_ = doc.select("#contents > div.cont-area > div.board-thumbnail > ul > li:nth-child("
//							+ (j + 1) + ") > dl > dd.date > span:nth-child(1)").text();
//					writer[j] = writer_;
//	
//					String date_ = doc.select("#contents > div.cont-area > div.board-thumbnail > ul > li:nth-child("
//							+ (j + 1) + ") > dl > dd.date > span:nth-child(2)").text();
//					date[j] = date_;
//				
//					System.out.println(Arrays.toString(newsTitle));
//					System.out.println(Arrays.toString(newsContent));
//					System.out.println(Arrays.toString(img));
//					System.out.println(Arrays.toString(writer));
//					System.out.println(Arrays.toString(date));
//				
//					
//					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
//		
//					conn = DriverManager.getConnection("jdbc:mysql://localhost/stock?serverTimezone=UTC", // 5.1.x 이후
//							"stock", // id
//							"stock");
//		
//					squery = "insert into news (ntitle, ncontent, uploadedfile, writer, ndatetime)" + " values (?, ?, ?, ?, ?)";
//		
//					pstmt = conn.prepareStatement(squery);
//		
//					pstmt.setString(1, newsTitle[j]);
//					pstmt.setString(2, newsContent[j]);
//					pstmt.setString(3, img[j]);
//					pstmt.setString(4, writer[j]);
//					pstmt.setString(5, date[j]);
////					pstmt.addBatch();
////					pstmt.executeBatch();
//			}
//				System.out.println("DB insert success");
//
//		} catch (SQLException se) {
//			System.out.println("SQL Exception :" + se);
//		} catch (FileNotFoundException fnfe) {
//			System.out.println("FileNotFoundException :" + fnfe);
//		} catch (IOException ioe) {
//			System.out.println("IOException  :" + ioe);
//		} finally {
//			try {
//				pstmt.close();
//			} catch (Exception ee) {
//			}
//			try {
//				conn.close();
//			} catch (Exception eee) {
//
//			}
//		}
////		return null;
//
//	}
////	static boolean isStringDouble(String s) {
////		try {
////			Double.parseDouble(s);
////			return true;
////		} catch (NumberFormatException e) {
////			return false;
////		}
////	}
//}