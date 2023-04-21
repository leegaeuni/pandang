package com.pandang.app.sns.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;

public class SnsStoreCommentDeleteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SnsDAO snsDAO = new SnsDAO();
		

		snsDAO.snsStoreCommentDelete(Integer.parseInt(req.getParameter("storeCommentNumber")));
	}

}
