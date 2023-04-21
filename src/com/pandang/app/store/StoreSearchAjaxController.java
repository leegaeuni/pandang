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
import com.pandang.app.store.vo.StoreVO;

public class StoreSearchAjaxController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO storeDAO = new StoreDAO();
		int rowCount = 12;
		int total =storeDAO.searchGetTotal(req.getParameter("searchInput"));
		String temp = req.getParameter("page");
		int realEndPage = (int)Math.ceil(total / (double)rowCount);
		int page = temp == null ? 1 : Integer.valueOf(temp);
		int startRow = (page-1)*rowCount;
		Map<String, Object> map = new HashMap();
		map.put("rowCount", rowCount);
		map.put("startRow", startRow);
		map.put("searchInput", req.getParameter("searchInput"));
		
		List<StoreVO> stores = storeDAO.search(map);
		Gson gson = new Gson();
		
		JsonArray storeList = new JsonArray();
	      
	      stores.stream()
	      .map(gson::toJson)
	      .map(JsonParser::parseString)
	      .forEach(storeList::add);
	      
	      
	      JsonObject result = new JsonObject();
	      result.add("list", JsonParser.parseString(storeList.toString()));
	      result.addProperty("realEndPage", realEndPage);
	      System.out.println(result.toString());
	      resp.setContentType("application/json; charset=utf-8");
	      PrintWriter out = resp.getWriter();
	      out.print(result.toString());
	      out.close();
		
		

		
	}

}
