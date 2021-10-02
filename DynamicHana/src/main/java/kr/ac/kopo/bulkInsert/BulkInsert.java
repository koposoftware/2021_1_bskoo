package kr.ac.kopo.bulkInsert;

import java.io.FileReader;
import java.io.IOException;
import java.sql.BatchUpdateException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import com.opencsv.CSVReader;

public class BulkInsert {

	public static void main(String[] args) throws Exception {
		/* Create Connection objects */
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//192.168.119.119:1521/dink", "scott", "tiger");
		PreparedStatement pstmt = null;
		String jdbc_insert_sql = "INSERT INTO TRANSACTION_HISTORY_NEW2" + "(HISTORY_DATE, AMOUNT, CATEGORY, HISTORY_TIME, STORE, CARD_NO) VALUES" + "(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(jdbc_insert_sql);
		String inputCSVFile = "c:/pytest/bigdata/transaction_history.csv";
		CSVReader reader = new CSVReader(new FileReader(inputCSVFile));
		String[] nextLine; 
		
		int batchSize = 5000;
		
		int line = 0; 
		
		long startTime = System.currentTimeMillis();
		
		while ((nextLine = reader.readNext()) != null) {
			line++;
			System.out.println(line);
			//sql_statement.setString(1, nextLine[0]); // index -> notuse
			pstmt.setString(1, nextLine[2]); // HISTORY_DATE
			pstmt.setString(2, nextLine[3]); // AMOUNT
			pstmt.setString(3, nextLine[4]); // CATEGORY
			pstmt.setString(4, nextLine[5]); // HISTORY_TIME
			pstmt.setString(5, nextLine[6]); // STORE
			pstmt.setString(6, nextLine[7]); // CARD_NO
			pstmt.addBatch();
			// sql_statement.setDouble(8, Double.parseDouble(nextLine[1])); // div->not use
			
			if(line%batchSize==0) {
				pstmt.executeBatch(); // 라인 / 배치사이즈의 몫이 0이면 execute
				
			}
		}
		pstmt.executeBatch(); // 나머지 자투리 행 execute
		pstmt.close();
		
		conn.commit();
		conn.close();
		
		long endTime = System.currentTimeMillis();
		long elapsedTime = (endTime - startTime)/1000;
		
		System.out.println(batchSize + "의 시간 : " + elapsedTime );
	}
}
