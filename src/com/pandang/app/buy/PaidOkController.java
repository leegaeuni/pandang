package com.pandang.app.buy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pandang.app.Execute;
import com.pandang.app.buy.dao.BuyDAO;
import com.pandang.app.buy.dto.BuyDTO;

public class PaidOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BuyDAO buyDAO = new BuyDAO()	;
		BuyDTO buyDTO = new BuyDTO();
		HttpSession session = req.getSession();
		Integer memberNumber = (Integer)session.getAttribute("memberNumber"); 
		// DB에 넣을 임시 memberNumber를 2로 페이지 연결해 사용 시 지워주세요
//		int memberNumber = 2;
		req.setCharacterEncoding("utf-8");
		

		System.out.println(req.getParameter("buyArray"));
		// Json배열 선언
		JsonArray arr = new JsonArray();
		// 형변환 JsonElement으로 하기
		JsonElement json = (JsonElement)JsonParser.parseString(req.getParameter("buyArray"));
		// 배열에 get으로 받아오기
		arr = json.getAsJsonArray();
//		System.out.println(arr.toString());
									
		for(int i =0; i<arr.size(); i++) {
			System.out.println(arr.get(i));
			// JsonObject로 형변환
			JsonObject jsonObj = arr.get(i).getAsJsonObject();
												
			// String 타입 integer로 형변환
			String buyCntStr = jsonObj.get("buyCnt").getAsString();
			int buyCnt = Integer.parseInt(buyCntStr);
			String storeNumberStr = jsonObj.get("storeNumber").getAsString();
			int storeNumber = Integer.parseInt(storeNumberStr);
			
			buyDTO.setBuyCnt(buyCnt);
			buyDTO.setStoreNumber(storeNumber);
			buyDTO.setBuyPhoneNumber(jsonObj.get("buyPhoneNumber").getAsString());
			buyDTO.setBuyName(jsonObj.get("buyName").getAsString());
			buyDTO.setBuyMsg(jsonObj.get("buyMsg").getAsString());
			buyDTO.setBuyAddress(jsonObj.get("buyAddress").getAsString());
			buyDTO.setBuyAddressDetail(jsonObj.get("buyAddressDetail").getAsString());
			buyDTO.setBuyZoneCode(jsonObj.get("buyZoneCode").getAsString());
			buyDTO.setMemberNumber(memberNumber);
			
			buyDAO.buyInsert(buyDTO);
		}						
	}

}
