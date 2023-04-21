package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SnsFrontController extends HttpServlet{
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
		case "/sns/snsOk.sn":
//			req.getRequestDispatcher("/app/sns/mySns.jsp").forward(req, resp);
			new SnsOkController().execute(req,resp);
			break;

		case "/sns/snsWrite.sn" :
			new SnsWriteController().execute(req,resp);
			break;
			
		case "/sns/snsWriteOk.sn" :
			new SnsWriteOkController().execute(req,resp);
			break;
		
		case "/sns/snsListOk.sn":
			new SnsListOkController().execute(req, resp);
			break;
			
		case "/sns/snsReadOk.sn":
			new SnsReadOkController().execute(req, resp);
			break;
			
		case "/sns/snsLikeOk.sn" : 
			new SnsLikeOkController().execute(req, resp);
			break;
			
		case "/sns/snsLikeDeleteOk.sn" :
			new SnsLikeDeleteOkController().execute(req, resp);
			break;
			
		case "/sns/snsPostDeleteOk.sn" : 
			new SnsPostDeleteOkController().execute(req, resp);
			break;
	
		case "/sns/snsFollowOk.sn" :
			new SnsFollowOkController().execute(req, resp);
			break;
			
		case "/sns/snsFollowDeleteOk.sn" :
			new SnsFollowDeleteOkController().execute(req, resp);
			break;
			
		case "/sns/snsFileReadOk.sn" : 
			new SnsFileReadOkController().execute(req, resp);
			break;
			
		case "/sns/snsStoreListOk.sn" :
			new SnsStoreListOkController().execute(req, resp);
			break;
			
		case "/sns/snsStoreReadOk.sn" :
			new SnsStoreReadOkController().execute(req, resp);
			break;
			
		case "/sns/snsStoreLikeCommentCntOk.sn" :
			new SnsStoreLikeCommentCntOkController().execute(req, resp);
			break;
			
		case "/sns/snsStoreLikeOk.sn" : 
			new SnsStoreLikeOkController().execute(req, resp);
			break;
			
		case "/sns/snsStoreLikeDeleteOk.sn" :
			new SnsStoreLikeDeleteOkController().execute(req, resp);
			break;
 		}
	}
}
