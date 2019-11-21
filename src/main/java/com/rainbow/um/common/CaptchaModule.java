package com.rainbow.um.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import net.sf.json.JSONObject;

public class CaptchaModule{
	
	private String clientId = "mpgDiPdTMr7QFrB4NDVo";//애플리케이션 클라이언트 아이디값";
	private String clientSecret = "JVjAqikQz2";//애플리케이션 클라이언트 시크릿값";
	
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}

	public String makeCapcha(){
		String key = "";
        try {
            String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer responseBuffer = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	responseBuffer.append(inputLine);
            }
            br.close();
            System.out.println(responseBuffer.toString());
            key = responseBuffer.toString().substring(8,24); // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
        } catch (Exception e) {
            System.out.println(e);
        }
		
        return "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
	}
	
	public void authCap(HttpServletRequest request, HttpServletResponse response) {
		String value = request.getParameter("code");
		String key = request.getParameter("key");
		try {
            String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code +"&key="+ key + "&value="+ value;

            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer responseBuffer = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	responseBuffer.append(inputLine);
            }
            br.close();
            System.out.println(responseBuffer.toString());
            
            ObjectMapper mapper = new ObjectMapper();
            String buff = responseBuffer.toString();
            
            
            Map<String, String> map = mapper.readValue(buff, Map.class);
            		
            JSONObject obj = JSONObject.fromObject(map);
            
            PrintWriter out = response.getWriter();
            out.write(obj.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
	}
}