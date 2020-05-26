//package stockCode;
//
//import java.util.Arrays;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.Map;
//
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//
//public class NameTest2 {
//
//	public static void main(String[] args) {
//		
//		Map<String, Info> info = new HashMap<String, Info>();
//
//		try {
//			long beforeTime = System.currentTimeMillis();
////			CodeSource codeSource = TradingCheck.class.getProtectionDomain().getCodeSource();
////	          File jarFile = new File(codeSource.getLocation().toURI().getPath());
////	          String jarDir = jarFile.getParentFile().getPath();
////	          FileOutputStream output = new FileOutputStream(jarDir+"/StockTest.txt", true);
//
//			for (int j = 1; j <= 32; j++) {
//				String url = "https://finance.naver.com/sise/sise_market_sum.nhn?&page=" + j; // 크롤링할 url지정
//				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
//
//				doc = Jsoup.connect(url).get();
//				Elements element = doc.select("table.type_2");
//
//				Iterator<Element> ie1 = element.select("td").iterator();
//				String by = "";
//				while (ie1.hasNext()) {
//					by += (ie1.next().text() + "ㅇ");
//
//					String b = null;
//					int n = 0;
//					String[] list = null;
//
//					Info inf = null;
//
//					list = by.split("ㅇ");
//					//System.out.println(Arrays.deepToString(list));
//					// byte[] by=(Arrays.deepToString(list).getBytes());
//					// output.write(by);
//					
//
//					for (int k = 0; k < list.length; k++) {
//						if (!list[k].equals("")) {
//							++n;
//						} else {
//							continue;
//						}
//
//						for (int i = 0; i < list.length; i++) {
//							if(!list[i].equals("")) {
//								
//								++n;
//							}
//							else {
//								continue;
//							}
//							
//							if(n%12 == 2) {
//								inf = new Info();
//								//System.out.println(1);
//								inf.setA(list[i]);
//								list[i] = inf.getA(); 
//								
//							}
//							else if(n%12 == 3) {
//								//System.out.println(1);
//								//System.out.println(2);
//								inf.setB(list[i]);
//							}
//							
//							else if(n%12 == 4) {
//								//System.out.println(3);
//								inf.setC(list[i]);
//							}
//							else if(n%12 == 5) {
//								//System.out.println(4);
//								inf.setD(list[i]);
////								System.out.println("test"+inf.getD());
//								info.put(inf.getA(), inf);
//							}
//						}
//					}
////					System.out.println(inf.getA());
//
//					
//					//System.out.println(Arrays.deepToString(list));
//				}
//			}
//			System.out.println(info.get("삼성전자").toString());
//			System.out.println(info.size());
//			long afterTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기
//			long secDiffTime = (afterTime - beforeTime) / 1000; // 두 시간에 차 계산
//			System.out.println("시간차이(m) : " + secDiffTime);
//			// System.out.println(jarDir);
//		} catch (Exception e) {
//
//			e.printStackTrace();
//		}
//	}
//}
