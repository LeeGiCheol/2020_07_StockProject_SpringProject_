package stockCode;


import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
 
public class DBInsertStockCodeName {

	public static void main(String[] args) {
		
	
        // File
        BufferedReader bin = null;
        BufferedReader bin2 = null;
        // DB
        Connection conn = null;
        PreparedStatement pstmt = null;
 
        String squery = null;
        try {
            // File 
            //bin = new BufferedReader(new FileReader("E://db2.txt"));
            String path="/Users/ekkkk1/Desktop/MainProject/stock.txt";
            String path2="/Users/ekkkk1/Desktop/MainProject/stockCode.txt";
            bin = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
            bin2 = new BufferedReader(new InputStreamReader(new FileInputStream(path2), "UTF-8"));
            
            String b = null;
            String[] list = null;
            String[] codeList = new String[1558];
            String[] nameList = new String[1558];
			int n = 0;
			
        	DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

            conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/stock?serverTimezone=UTC", // 5.1.x 이후
					"stock",						  // id
					"stock");	
            
            squery = "insert into stocklist (stockCode, stockName)"
                    + " values (?, ?)";
 
            pstmt = conn.prepareStatement(squery);
        	while((b = bin.readLine()) != null){
				list = b.split("ㅇ");
//				System.out.println(Arrays.toString(list));
				//byte[] by=(Arrays.deepToString(list).getBytes());
				//output.write(by);
				Info inf = null;
				int k = 0;
				for (int i = 0; i < list.length; i++) {
					if(!list[i].equals("")) {
						++n;
					}
					else {
						continue;
					}
					
					if(n%12 == 2) {
						nameList[k++] = list[i];
		            }
				}
        	}
        	
        	while((b = bin2.readLine()) != null){
        		codeList = b.split(",");
        		for (int j = 0; j < codeList.length; j++) {
        			System.out.println(codeList[j]);
        			System.out.println(nameList[j]);
        			pstmt.setString(1, codeList[j]);
        			pstmt.setString(2, nameList[j]);
        			pstmt.addBatch();
        			pstmt.clearParameters();
				}
        	}            
        	
        	pstmt.executeBatch();
        	System.out.println("DB insert success");
        	
 
        } catch (SQLException se) {
            System.out.println("SQL Exception :" + se);
        } catch (FileNotFoundException fnfe) {
            System.out.println("FileNotFoundException :" + fnfe);
        } catch (IOException ioe) {
            System.out.println("IOException  :" + ioe);
        } finally {
            try {
                pstmt.close();
            } catch (Exception ee) {
            }
            try {
                conn.close();
            } catch (Exception eee) {
            }
            try {
                bin.close();
            } catch (Exception e) {
                System.out.println("Exception :" + e);
            }
        }
    }
 
}