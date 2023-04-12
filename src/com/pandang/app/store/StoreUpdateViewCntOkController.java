package com.pandang.app.store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.dto.StoreDTO;

public class StoreUpdateViewCntOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int storeNumber = Integer.valueOf(req.getParameter("storeNumber"));
		StoreDAO storeDAO = new StoreDAO();
		storeDAO.updateViewCnt(Integer.parseInt(req.getParameter("storeNumber")));
		
		
		System.out.println("storeUpdateOkController 들어왔다");
	
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("");
		
//		System.out.println(req.getParameter("storeNumber"));
	}

}
