package com.pandang.app.store;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.vo.StoreFollowVO;
import com.pandang.app.store.vo.StoreVO;

public class StoreFollowOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		StoreFollowVO storeFollowVO = new StoreFollowVO();

		storeFollowVO.setMemberNumberFrom((Integer) session.getAttribute("memberNumber"));
		storeFollowVO.setMemberNumberTo(Integer.parseInt(req.getParameter("memberNumberTo")));
		new StoreDAO().updateStoreFollow(storeFollowVO);

	}
}