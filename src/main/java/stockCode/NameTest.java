package stockCode;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;



public class NameTest {

   public static void main(String[] args) {

      Map<String, Info> info = new HashMap<String, Info>();

      try {
         String crwaling  = "";
         for (int i = 1; i <= 32; i++) {
            String url = "https://finance.naver.com/sise/sise_market_sum.nhn?&page=" + i; // 크롤링할 url지정
            Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
            doc = Jsoup.connect(url).get();
            Elements element = doc.select("table.type_2");
            Iterator<Element> ie1 = element.select("td").iterator();
            while (ie1.hasNext()) {
               crwaling += ie1.next().text()+"ㅇ";
            }
         }
         String[] list = null;
         int n = 0;
         list = crwaling.split("ㅇ");
         //byte[] by=(Arrays.deepToString(list).getBytes());
         //output.write(by);
         Info inf = null;
         
         for (int i = 0; i < list.length; i++) {
            if(!list[i].equals("")) {
               ++n;
            }
            else {
               continue;
            }
            
            if(n%12 == 2) {
               inf = new Info();
               inf.setA(list[i]);
               list[i] = inf.getA(); 
               
            }
            else if(n%12 == 3) {
               inf.setB(list[i]);
            }
            
            else if(n%12 == 4) {
               inf.setC(list[i]);
            }
            else if(n%12 == 5) {
               inf.setD(list[i]);
               info.put(inf.getA(), inf);
               System.out.println(inf.getA());
            }
         }
      System.out.println(info.get("삼성전자").toString());
      System.out.println(info.size());
      } catch (Exception e) {

         e.printStackTrace();
      }
   }
}