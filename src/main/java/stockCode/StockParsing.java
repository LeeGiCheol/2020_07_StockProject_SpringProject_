package stockCode;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

public class StockParsing {
	public static void main(String[] args) {
		BufferedReader bin;
		
		Map<String, Info> info = new HashMap<String, Info>();
		try {
			OutputStream output = new FileOutputStream("./test.txt");

			String path = "./stock.txt";
			bin = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
			//OutputStream output = new FileOutputStream("/Users/ekkkk1/Desktop/MainProject/test.txt");


			String b = null;
			String[] list = null;
			String[] list2 = null;
			int n = 0;
			
			
			while((b = bin.readLine()) != null){
				list = b.split("ㅇ");
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
						list2[i] = inf.getA(); 
						
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
					}
				}
			}
			System.out.println(info.get("삼성전자").toString());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}