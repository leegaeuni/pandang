package com.pandang.app.store.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StoreCommentFrontController extends HttpServlet{
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

		switch(target) {
		case "/storeComment/storeCommentListOk.stc":
			new StoreCommentListOkController().execute(req, resp);
			break;
		case "/storeComment/storeCommentWriteOk.stc":
			new StoreCommentWriteOkController().execute(req, resp);
			break;
		case "/storeComment/storeCommentDeleteOk.stc":
			new StoreCommentDeleteOkController().execute(req, resp);
			break;
		case "/storeComment/storeCommentUpdateOk.stc":
			new StoreCommentUpdateOkController().execute(req, resp);
			break;
		}
	}
}
