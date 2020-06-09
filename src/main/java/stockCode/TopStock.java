package stockCode;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.bitcamp.project.vo.Info;

public class TopStock {
	public Info topStock() {
//	public static void main(String[] args) {
			
		String[] topName = new String[6];
		String[] topCurrentPrice = new String[6];
		String[] topBefore = new String[6];
		String[] topUpDown = new String[6];
		
		String[] searchName_ = new String[5];

		String[] searchName = new String[5];
		String[] searchCurrentPrice = new String[5];
		String[] searchUpDown = new String[5];
		
		

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
			String url = "https://finance.naver.com/";
//		String url = "https://finance.naver.com/item/main.nhn?code=" + "005930";
			Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get();
			String topLists = doc.select("#_topItems2").text();

			
			String[] topList_ = topLists.split(" ");
			
		
			
			for (int i = 0; i < topList_.length; i++) {
				if(i % 5 == 0) {
					topName[a] = topList_[i];
					a++;
				}
				if(i % 5 == 1) {
					topCurrentPrice[b] = topList_[i];
					b++;
				}
				if(i % 5 == 3) {
					topBefore[c] = topList_[i];
					c++;
				}

				if(i % 5 == 4) {
					topUpDown[d] = topList_[i];
					d++;
				}
				
			}
//			System.out.println(Arrays.toString(topName));
//			System.out.println(Arrays.toString(topCurrentPrice));
//			System.out.println(Arrays.toString(topBefore));
//			System.out.println(Arrays.toString(topUpDown));
			
			
			
			
			String searchLists = doc.select("#container > div.aside > div.group_aside > div.aside_area.aside_popular > table > tbody").text();
			
			
			String[] searchList_ = searchLists.split(" ");
			
			
//			System.out.println("test"+Arrays.toString(searchList_));

			for (int i = 0; i < searchList_.length; i++) {
				if(i % 3 == 0) {
					searchName_[e] = searchList_[i];
					e++;
				}
				if(i % 3 == 1) {
					searchCurrentPrice[f] = searchList_[i];
					f++;
				}
				if(i % 3 == 2) {
					searchUpDown[g] = searchList_[i];
					g++;
				}
				
			}

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
						searchSangHa[h] = searchSangHa_[i].substring(ha, ha+2);
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
			for (int i = 0; i < searchName_.length; i++) {
				
				searchName[i] = searchName_[i].replace(i+1+".", "");
			}
			
			
//			System.out.println(Arrays.toString(searchName));
			
			
			Info inf = new Info();
			inf.setTopName(topName);
			inf.setTopCurrentPrice(topCurrentPrice);
			inf.setTopBefore(topBefore);
			inf.setTopUpDown(topUpDown);
			inf.setSearchName(searchName);
			inf.setSearchCurrentPrice(searchCurrentPrice);
			inf.setSearchUpDown(searchUpDown);
			inf.setSearchSangHa(searchSangHa);
			
			return inf;
			
		} catch (Exception er) {
			er.printStackTrace();
		}
		
		return null;
	}
}