package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;

public class StoreUpdateController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getParameter("storeTitle");
		req.getParameter("storeContent");
		req.getParameter("storePrice");
		req.getParameter("hashtagNumber");
		req.getParameter("memberNumber");
		
		
		req.setAttribute("storeTitle", req.getParameter("storeTitle"));
		
		req.getRequestDispatcher("/app/store/storeWrite.jsp").forward(req, resp);

	}

}

