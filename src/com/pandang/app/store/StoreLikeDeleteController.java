package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.vo.StoreVO;

public class StoreLikeDeleteController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreVO storeVO = new StoreVO();
		StoreDAO storeDAO = new StoreDAO();
		
		storeVO.setMemberNumber((Integer)req.getSession().getAttribute("memberNumber"));
		storeVO.setStoreNumber(Integer.parseInt(req.getParameter("storeNumber")));
		storeDAO.deleteStoreLikeCnt(storeVO);
		
	}

}