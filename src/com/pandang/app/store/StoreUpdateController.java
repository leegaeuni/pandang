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
		req.getParameter("storeTitle");
		req.getParameter("storeContent");
		
		req.setAttribute("storeTitle", req.getParameter("storeTitle"));
		
		req.getRequestDispatcher("/app/store/storeWrite.jsp").forward(req, resp);

	}

}

