package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.vo.SnsStoreVO;

public class SnsStoreLikeCommentCntOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
//		session.setAttribute("snsNumber", 1);
		
		SnsDAO snsDAO = new SnsDAO();
		
		
		snsDAO.showStoreCommentCnt(Integer.parseInt(req.getParameter("storeNumber")));
		snsDAO.showStoreLikeCnt(Integer.parseInt(req.getParameter("storeNumber")));
		
		
		

	}

}
