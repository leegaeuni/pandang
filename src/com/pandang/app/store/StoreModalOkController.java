package com.pandang.app.store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.vo.StoreUpdateVO;

public class StoreModalOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO storeDAO = new StoreDAO();

		int storeNumber = Integer.parseInt(req.getParameter("storeNumber"));
		System.out.println("2");
		StoreUpdateVO storeUpdateVO = new StoreUpdateVO();
		Gson gson = new Gson();
		
		storeDAO.updateViewCnt(storeNumber);
		
		storeUpdateVO = storeDAO.selectModal(storeNumber);
	
		resp.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		JsonElement json = JsonParser.parseString(gson.toJson(storeUpdateVO));
		out.print(json.toString());

	}

}