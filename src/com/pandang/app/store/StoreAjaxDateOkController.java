package com.pandang.app.store;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.dto.StoreDTO;
import com.pandang.app.store.vo.StoreVO;

public class StoreAjaxDateOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO storeDAO = new StoreDAO();
		StoreDTO storeDTO = new StoreDTO();
		int rowCount = 12;
		String temp = req.getParameter("page");
		int page = temp == null ? 1 : Integer.valueOf(temp);
		int startRow = (page-1)*rowCount;
		Map<String, Integer> pageMap = new HashMap();
		pageMap.put("rowCount", rowCount);
		pageMap.put("startRow", startRow);
		pageMap.put("hashtagNumber", Integer.parseInt(req.getParameter("hashtagNumber")));
		
		List<StoreVO> stores = storeDAO.selectAllByDate(pageMap);
		
		Gson gson = new Gson();
	      JsonArray storeList = new JsonArray();
	      
	      stores.stream()
	      .map(gson::toJson)
	      .map(JsonParser::parseString)
	      .forEach(storeList::add);
	      
	      
	      JsonObject result = new JsonObject();
	      result.add("list", JsonParser.parseString(storeList.toString()));
	      result.addProperty("page", page);
	      
	      resp.setContentType("application/json; charset=utf-8");
	      PrintWriter out = resp.getWriter();
	      out.print(result.toString());
	      out.close();
		
	}

}