package com.rainbow.um.common;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;

import org.json.simple.JSONObject;

public class TossAPI {
	
	@SuppressWarnings("unchecked")
	public String doToss() {
		URL url = null;
		URLConnection connection = null;
		StringBuilder responseBody = new StringBuilder();
		try {
			url = new URL("https://pay.toss.im/api/v1/payments");
			connection = url.openConnection();
			connection.addRequestProperty("Content-Type", "application/json");
			connection.setDoOutput(true);
			connection.setDoInput(true);

			org.json.simple.JSONObject jsonBody = new JSONObject();
			jsonBody.put("orderNo", "124235124325"); // 거래 주문번호 임의로 설정하면 됨 최대 50자
			jsonBody.put("amount", 10); // 결제 금액 (입력 받아야함)
			jsonBody.put("amountTaxFree", 0); // 결제금액 중 비과세금액(?)
			jsonBody.put("productDesc", "테스트 결제"); // 상품 설명
			jsonBody.put("apiKey", "sk_test_w5lNQylNqa5lNQe013Nq"); // 가맹점 키 (추후 실 거래시 발급받은 키 사용)
		    jsonBody.put("autoExecute", true); // 자동 승인 여부 (true 를 사용하는 경우, 구매자 인증이 완료되면 토스가 알아서 승인을 진행합니다. 가맹점의 판매 상품에 따라 활용해 주시면 됩니다.)
		    jsonBody.put("resultCallback", "http://YOUR-SITE.COM/callback");
		    jsonBody.put("retUrl", "https://www.naver.com"); // Web 결제 완료 후 연결할 웹페이지의 URL
		    jsonBody.put("retCancelUrl", "http://YOUR-SITE.COM/close"); // 토스 브릿지 페이지에서 사용자가 결제를 중단할때 사용자를 이동시킬 가맹점 페이지

			BufferedOutputStream bos = new BufferedOutputStream(connection.getOutputStream());
			
		    bos.write(jsonBody.toJSONString().getBytes(StandardCharsets.UTF_8));
			bos.flush();
			bos.close();

			
		    BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8));
			String line = null;
			while ((line = br.readLine()) != null) {
				responseBody.append(line);
			}
			br.close();
		} catch (Exception e) {
			responseBody.append(e);
		}
		return responseBody.toString();
	}

}
