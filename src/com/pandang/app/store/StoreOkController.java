package com.pandang.app.store;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.vo.StoreVO;

public class StoreOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO storeDAO = new StoreDAO();
		
		String temp = req.getParameter("page");
		
		int page = temp == null ? 1 : Integer.valueOf(temp);
		
		int rowCount = 12;
		
		Map<String, Integer>pageMap = new HashMap<>();
	

		req.getRequestDispatcher("/app/store/store.jsp").forward(req, resp);
	}

}
