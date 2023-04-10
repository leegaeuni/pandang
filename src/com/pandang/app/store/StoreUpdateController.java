package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;

public class StoreUpdateController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int storeNumber = Integer.valueOf(req.getParameter("storeNumber"));
		StoreDAO storeDAO = new StoreDAO();

		req.setAttribute("store", storeDAO.select(storeNumber));

		req.getRequestDispatcher("/app/store/storeUpdate.jsp").forward(req, resp);
	}

}
