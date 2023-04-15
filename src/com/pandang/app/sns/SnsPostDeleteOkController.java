package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;

public class SnsPostDeleteOkController implements Execute{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SnsDAO snsDAO = new SnsDAO();
		
		snsDAO.deleteSnsLikeFromHost(Integer.parseInt(req.getParameter("snsNumber")));
		snsDAO.deleteSnsCommentFromHost(Integer.parseInt(req.getParameter("snsNumber")));
		snsDAO.deleteSnsPost(Integer.parseInt(req.getParameter("snsNumber")));
		
	}
}
