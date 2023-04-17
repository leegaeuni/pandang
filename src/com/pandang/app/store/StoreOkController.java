package com.pandang.app.store;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.dto.StoreDTO;
import com.pandang.app.store.vo.StoreVO;

public class StoreOkController implements Execute {

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
		pageMap.put("hashtagNumber", 1);
		
		List<StoreVO> stores = storeDAO.selectAll(pageMap);
		
		req.setAttribute("storeList", stores);

		
		req.getRequestDispatcher("/app/store/store.jsp").forward(req, resp);
	}
}