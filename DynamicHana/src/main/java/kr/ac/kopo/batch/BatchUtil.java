package kr.ac.kopo.batch;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Controller
public class BatchUtil {

	@Scheduled(cron = "0 10 0 1 * *")
	public void updatePCA() {
	
		try {
			RConnection conn = new RConnection();
			conn.eval("source('‪D:/DynamicHana/DynamicHana/r/pca_test.R')"); // 스크립트 실행
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
