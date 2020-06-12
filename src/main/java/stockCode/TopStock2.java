//package stockCode;
//
//import java.util.Arrays;
//
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//
//import com.bitcamp.project.vo.Info;
//
//public class TopStock2 {
////	public Info topStock() {
//	public static void main(String[] args) {
//			
//		String[] topName = new String[5];
//		String[] topCurrentPrice = new String[5];
//		String[] topBefore = new String[5];
//		String[] topUpDown = new String[5];
//		
//		String[] searchName_ = new String[5];
//
//		String[] searchName = new String[5];
//		String[] searchCurrentPrice = new String[5];
//		String[] searchUpDown = new String[5];
//		String[] searchBefore = new String[5];
//		
//		
//
//		String[] searchSangHa = new String [5];
//		int sang = 0;
//		int ha = 0;
//		
//		
//		int a = 0;
//		int b = 0;
//		int c = 0;
//		int d = 0;
//		int e = 0;
//		int f = 0;
//		int g = 0;
//		int h = -1;
//		
//		try {
//			String url = "https://finance.naver.com/";
////		String url = "https://finance.naver.com/item/main.nhn?code=" + "005930";
//			Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
//			doc = Jsoup.connect(url).get();
////			String topLists = doc.select("#_topItems2").text();
//			for (int i = 0; i < 5; i++) {	
//				String searchNameParse = doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > th > a").text();
//				System.out.println(searchNameParse);
//				if(searchNameParse.contains("..")) {
//					String searchNameParse2 = doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > th > a").attr("href");
//					searchName[i] = searchNameParse2.substring(19);
//					StockParsing sp = new StockParsing();
//					Info name = sp.parse(searchName[i]);
//					searchName[i] = name.getStockName();
////					System.out.println("1 " +searchName[i]);
//				}
//				else {
//					searchName[i] = searchNameParse;
////					System.out.println("2 " + searchName[i]);
//					
//				}
//				
//				String searchBeforeParse = doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > td:nth-child(2)").text();
//				searchBefore[i] = searchBeforeParse;
//				
//				String searchUpDownParse = doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > td:nth-child(3)").html();
//				if(searchUpDownParse.contains("상승") || searchUpDownParse.contains("상한가") )
//					searchUpDown[i] = "+"+doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > td:nth-child(3)").text();
//				else if(searchUpDownParse.contains("하락") || searchUpDownParse.contains("하한가"))
//					searchUpDown[i] = "+"+doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > td:nth-child(3)").text();
//			}
//
////			System.out.println(Arrays.toString(topName));
////			System.out.println(Arrays.toString(topCurrentPrice));
////			System.out.println(Arrays.toString(topBefore));
////			System.out.println(Arrays.toString(topUpDown));
//			
//			for (int i = 0; i < 5; i++) {	
//				String topNameParse = doc.select("#_topItems1 > tr:nth-child("+(i+1)+") > th > a").text();
//				System.out.println(topNameParse);
//				if(topNameParse.contains("..")) {
//					String searchNameParse2 = doc.select("#_topItems1 > tr:nth-child("+(i+1)+") > th > a").attr("href");
//					topName[i] = searchNameParse2.substring(19);
//					StockParsing sp = new StockParsing();
//					Info name = sp.parse(topName[i]);
//					topName[i] = name.getStockName();
//					System.out.println("1 " +topName[i]);
//				}
//				else {
//					topName[i] = topNameParse;
//					System.out.println("2 " + topName[i]);
//					
//				}
//				
//				String topBeforeParse = doc.select("#_topItems1 > tr:nth-child("+(i+1)+") > td:nth-child(3)").text();
//				topBefore[i] = topBeforeParse;
//				
//				String topUpDownParse = doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > td:nth-child(3)").html();
//				if(topUpDownParse.contains("상승") || topUpDownParse.contains("상한가") )
//					topUpDown[i] = "+"+doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > td:nth-child(3)").text();
//				else if(topUpDownParse.contains("하락") || topUpDownParse.contains("하한가"))
//					topUpDown[i] = "+"+doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody > tr:nth-child("+(i+1)+") > td:nth-child(3)").text();
//			}
//
//			int test = 0;
//			String searchList = doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody").html();
//			String[] searchSangHa_ = searchList.split("<tr class=");
//
//			
//			for (int i = 0; i < searchSangHa_.length; i++) {
//				sang = searchSangHa_[i].indexOf("up");
//				if(sang == -1) {
//					ha = searchSangHa_[i].indexOf("down");
//					if(ha == -1) {
//						test = searchSangHa_[i].indexOf("same");
//						if(test != -1) {
//							searchSangHa[h] = "0";
//							h++;
//						}else {
//							h++;
//							continue;
//						}
//					}
//					if(ha != -1) {
//						searchSangHa[h] = searchSangHa_[i].substring(ha, ha+4);
////						System.out.println(searchSangHa[h]);
//						h++;
//					}
//					
//					}else {
//						searchSangHa[h] = searchSangHa_[i].substring(sang, sang+2);
//						h++;
//					}
//				}
//			
////			System.out.println(Arrays.toString(searchSangHa));
//			
//			
//			
////			System.out.println(Arrays.toString(searchName_));
//			for (int i = 0; i < searchName_.length; i++) {
//				
//				searchName[i] = searchName_[i].replace(i+1+".", "");
//			}
//			
//			
////			
////			TradeDAO tradeDAO = new TradeDAOImpl();
////			for (int i = 0; i < topName.length; i++) {
////				if(topName[i].contains("..")) {
////					topName[i].replace("..", "");
////					tradeDAO.stockSearch(topName[i]);
////				}
////				if(searchName[i].contains("..")) {
////					searchName[i].replace("..", "");
////					tradeDAO.stockSearch(searchName[i]);
////				}
////			}
//			
//			System.out.println(Arrays.toString(topName));
//			System.out.println(Arrays.toString(searchName));
//			Info inf = new Info();
//			inf.setTopName(topName);
//			inf.setTopCurrentPrice(topCurrentPrice);
//			inf.setTopBefore(topBefore);
//			inf.setTopUpDown(topUpDown);
//			inf.setSearchName(searchName);
//			inf.setSearchCurrentPrice(searchCurrentPrice);
//			inf.setSearchUpDown(searchUpDown);
//			inf.setSearchSangHa(searchSangHa);
//			
////			return inf;
//			
//		} catch (Exception er) {
//			er.printStackTrace();
//		}
//		
////		return null;
//		
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