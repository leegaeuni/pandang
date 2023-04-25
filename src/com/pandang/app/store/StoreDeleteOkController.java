package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;

public class StoreDeleteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO storeDAO = new StoreDAO();
		
		storeDAO.deleteStorePost(Integer.parseInt(req.getParameter("storeNumber")));
		storeDAO.deleteStoreFile(Integer.parseInt(req.getParameter("storeNumber")));
		storeDAO.deleteStoreLike(Integer.parseInt(req.getParameter("storeNumber")));
		storeDAO.deleteStoreComment(Integer.parseInt(req.getParameter("storeNumber")));
		
	}
}