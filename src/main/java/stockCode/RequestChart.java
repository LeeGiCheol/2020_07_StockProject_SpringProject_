package stockCode;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RequestChart {
	public static void main(String[] args) {
		BufferedReader bin;
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		String squery;
		String stockCode = null;
		try {
			// 127.0.0.1 : 현재 나의 Host의 주소, loop 주소
			// Socket sock = new Socket("192.168.0.13", 9000);
			// Socket생성자에서 내부적으로 connect를 진행
			// 객체가 만들어지면 서버와 이미 연결 상태
			Socket sock = new Socket("192.168.0.33", 8000);
			// 키보드 데이터 입력 객체 생성
			InputStreamReader inK = new InputStreamReader(System.in);
			BufferedReader keyboard = new BufferedReader(inK);

			// 통신 스트림 객체
			OutputStream out = sock.getOutputStream();
			OutputStreamWriter outW = new OutputStreamWriter(out);
			PrintWriter pw = new PrintWriter(outW);

			InputStream in = sock.getInputStream();
			InputStreamReader inR = new InputStreamReader(in);
			BufferedReader br = new BufferedReader(inR);

//	         
//	         String path = "/Users/ekkkk1/Desktop/MainProject/stock.txt";
//	         bin = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
//	         
//	          conn = DriverManager.getConnection(
//	                  "jdbc:mysql://localhost/stock?serverTimezone=UTC", // 5.1.x 이후
//	                  "stock",                    // id
//	                  "stock");   
//	               
//	               squery = "SELECT stockCode FROM stock WHERE stockName = \"삼성전자\"";
//	                       
			//
//	               pstmt = conn.prepareStatement(squery);
//	               rs = pstmt.executeQuery();
//	               while (rs.next()) { 
//	                  stockCode = rs.getString("stockCode");
//	               }

			// String line = keyboard.readLine();
//	            if(line.equals("quit")) {
//	               System.out.println("클라이언트 종료");
//	               break;
//	            }
			// System.out.println("서버로 전송 : " + line);

			long start = System.currentTimeMillis();

			pw.print("005930");

			pw.flush();
			// 서버가 echo하는 것을 받아서 출력
			// Thread.sleep(5000);
			String echo = br.readLine();
			System.out.println("서버로부터 수신 : " + echo);

			long end = System.currentTimeMillis();

			System.out.println(end / 1000);
			System.out.println(end - start);

			pw.close();
			outW.close();
			out.close();
			br.close();
			inR.close();
			in.close();
			sock.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
}
