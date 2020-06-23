package stockCode;


import java.util.Arrays;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.bitcamp.project.vo.Info;

public class TopStock {
	public Info topStock() {
//	public static void main(String[] args) {
			
		String[] topName = new String[5];
		String[] topCurrentPrice = new String[5];
		String[] topBefore = new String[5];
		String[] topUpDown = new String[5];
		
		String[] searchName_ = new String[5];

		String[] searchName = new String[5];
		String[] searchCurrentPrice = new String[5];
		String[] searchUpDown = new String[5];
		String[] searchBefore = new String[5];
		
		

		String[] searchSangHa = new String [5];
		int sang = 0;
		int ha = 0;
		
		
		int a = 0;
		int b = 0;
		int c = 0;
		int d = 0;
		int e = 0;
		int f = 0;
		int g = 0;
		int h = -1;
		
		try {
//			String topLists = doc.select("#_topItems2").text();
			String url = "https://finance.naver.com/sise/lastsearch2.nhn";
			Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get();
			for (int i = 0; i < 5; i++) {	
				String searchNameParse = doc.select("#contentarea > div.box_type_l > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(2) > a").text();
				//System.out.println(searchNameParse);
					searchName[i] = searchNameParse;
				
				String searchCurrentPriceParse = doc.select("#contentarea > div.box_type_l > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(4)").text();
				searchCurrentPrice[i] = searchCurrentPriceParse;
				
				String searchBeforeParse = doc.select("#contentarea > div.box_type_l > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(5)").text();
				searchBefore[i] = searchBeforeParse;
				
				String searchUpDownParse = doc.select("#contentarea > div.box_type_l > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(6)").html();
				if(searchUpDownParse.contains("+"))
					searchUpDown[i] = doc.select("#contentarea > div.box_type_l > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(6)").text();
				else if(searchUpDownParse.contains("-"))
					searchUpDown[i] = doc.select("#contentarea > div.box_type_l > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(6)").text();
			}

			int idx = 0;
			int count = 0;
			url = "https://finance.naver.com/sise/sise_upper.nhn";
			doc = null; // Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get();
			int cnt = 3;
			for (int i = 0; i < 5; i++) {
				
				if(idx >= 5)
					break;
				
				
				if (doc.select("#contentarea > div:nth-child("+cnt+") > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(4) > a").text().equals("")) {
					cnt = 4;
					count++;
					if(count == 1)
						i = 0;
					if(doc.select("#contentarea > div:nth-child("+cnt+") > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(4) > a").text().equals("")) {
						break;
					}
				}
				
			
					String topNameParse = doc.select("#contentarea > div:nth-child("+cnt+") > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(4) > a").text();
					//System.out.println(topNameParse);
					topName[idx] = topNameParse;
					
					String topCurrentPriceParse = doc.select("#contentarea > div:nth-child("+cnt+") > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(5)").text();
					topCurrentPrice[idx] = topCurrentPriceParse;
					
					String topBeforeParse = doc.select("#contentarea > div:nth-child("+cnt+") > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(6)").text();
					topBefore[idx] = topBeforeParse;
					
					String topUpDownParse = doc.select("#contentarea > div:nth-child("+cnt+") > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(7)").html();
					if(topUpDownParse.contains("+"))
						topUpDown[idx] = doc.select("#contentarea > div:nth-child("+cnt+") > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(7)").text();
					else if(topUpDownParse.contains("-"))
						topUpDown[idx] = doc.select("#contentarea > div:nth-child("+cnt+") > table > tbody > tr:nth-child("+(i+3)+") > td:nth-child(7)").text();
				
					idx++;
//					System.out.println(topNameParse);
			}
			
			
			
//			System.out.println(Arrays.toString(topName));
//			System.out.println(Arrays.toString(topCurrentPrice));
//			System.out.println(Arrays.toString(topBefore));
//			System.out.println(Arrays.toString(topUpDown));
//			System.out.println(Arrays.toString(searchName));
//			System.out.println(Arrays.toString(searchCurrentPrice));
//			System.out.println(Arrays.toString(searchBefore));
//			System.out.println(Arrays.toString(searchUpDown));

			url = "https://finance.naver.com/";
			doc = null; // Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get();
			
			int test = 0;
			String searchList = doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody").html();
			String[] searchSangHa_ = searchList.split("<tr class=");

			
			for (int i = 0; i < searchSangHa_.length; i++) {
				sang = searchSangHa_[i].indexOf("up");
				if(sang == -1) {
					ha = searchSangHa_[i].indexOf("down");
					if(ha == -1) {
						test = searchSangHa_[i].indexOf("same");
						if(test != -1) {
							searchSangHa[h] = "0";
							h++;
						}else {
							h++;
							continue;
						}
					}
					if(ha != -1) {
						searchSangHa[h] = searchSangHa_[i].substring(ha, ha+4);
//						System.out.println(searchSangHa[h]);
						h++;
					}
					
					}else {
						searchSangHa[h] = searchSangHa_[i].substring(sang, sang+2);
						h++;
					}
				}
			
//			System.out.println(Arrays.toString(searchSangHa));
			
			
			
//			System.out.println(Arrays.toString(searchName_));
//			for (int i = 0; i < searchName_.length; i++) {
//				
//				searchName[i] = searchName_[i].replace(i+1+".", "");
//			}
			
			
//			
//			TradeDAO tradeDAO = new TradeDAOImpl();
//			for (int i = 0; i < topName.length; i++) {
//				if(topName[i].contains("..")) {
//					topName[i].replace("..", "");
//					tradeDAO.stockSearch(topName[i]);
//				}
//				if(searchName[i].contains("..")) {
//					searchName[i].replace("..", "");
//					tradeDAO.stockSearch(searchName[i]);
//				}
//			}
			
//			System.out.println(Arrays.toString(topName));
//			System.out.println(Arrays.toString(searchName));
			Info inf = new Info();
			inf.setTopName(topName);
			inf.setTopCurrentPrice(topCurrentPrice);
			inf.setTopBefore(topBefore);
			inf.setTopUpDown(topUpDown);
			inf.setSearchName(searchName);
			inf.setSearchCurrentPrice(searchCurrentPrice);
			inf.setSearchBefore(searchBefore);
			inf.setSearchUpDown(searchUpDown);
			inf.setSearchSangHa(searchSangHa);
			return inf;
			
		} catch (Exception er) {
			er.printStackTrace();
		}
		
		return null;
		
		
	}
//	static boolean isStringDouble(String s) {
//		try {
//			Double.parseDouble(s);
//			return true;
//		} catch (NumberFormatException e) {
//			return false;
//		}
//	}
}