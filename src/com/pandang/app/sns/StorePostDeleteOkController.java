package com.pandang.app.sns;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.sns.dao.SnsDAO;

public class StorePostDeleteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SnsDAO snsDAO = new SnsDAO();
		
		snsDAO.deleteStoreLikeFromHost(Integer.parseInt(req.getParameter("storeNumber")));
		snsDAO.deleteStoreCommentFromHost(Integer.parseInt(req.getParameter("storeNumber")));
		snsDAO.deleteStoreFileFromHost(Integer.parseInt(req.getParameter("storeNumber")));
		snsDAO.deleteStoreBasketFromHost(Integer.parseInt(req.getParameter("storeNumber")));
		snsDAO.deleteStoreBuyFromHost(Integer.parseInt(req.getParameter("storeNumber")));
		snsDAO.deleteStoreReportFromHost(Integer.parseInt(req.getParameter("storeNumber")));
		snsDAO.deleteStorePost(Integer.parseInt(req.getParameter("storeNumber")));
	}

}
