package com.pandang.app.store.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.comment.dao.StoreCommentDAO;

public class StoreCommentDeleteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int storeCommentNumber = Integer.parseInt(req.getParameter("storeCommentNumber"));
		new StoreCommentDAO().delete(storeCommentNumber);
	}

}