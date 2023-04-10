package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StoreFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String target = req.getRequestURI().substring(req.getContextPath().length());

		switch (target) {
		case "/store/storeOk.st":
			new StoreOkController().execute(req, resp);
			req.getRequestDispatcher("/app/store/store.jsp").forward(req, resp);
			break;
		case "/store/storeWrite.st":
			new StoreWriteController().execute(req, resp);
			break;
		case "/store/storeWriteOk.st":
			new StoreWriteOkController().execute(req, resp);
			break;
		case "/store/storeUpdate.st":
			new StoreUpdateController().execute(req, resp);
			break;
		case "/store/storeUpdateOk.st":
			new StoreUpdateOkController().execute(req, resp);
			break;
		case "/store/storeDeleteOk.st":
			new StoreDeleteOkController().execute(req, resp);
			break;

		}
	}
}
