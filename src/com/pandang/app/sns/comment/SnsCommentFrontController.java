package com.pandang.app.sns.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.sns.SnsOkController;

public class SnsCommentFrontController extends HttpServlet{
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
		case "/sns/snsCommentOk.snc" :
			new SnsCommentOkController().execute(req,resp);
			break;
			
		case "/sns/snsCommentInsertOk.snc" :
			new SnsCommentInsertOkController().execute(req, resp);
			break;
		
		case "/sns/snsCommentDeleteOk.snc" :
			new SnsCommentDeleteOkController().execute(req, resp);
			break;
			
		case "/sns/snsCommentUpdateOk.snc" :
			new SnsCommentUpdateOkController().execute(req, resp);
			break;
			
		}
	}
}
