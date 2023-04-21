package com.pandang.app.buy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.buy.dao.BuyDAO;
import com.pandang.app.buy.vo.BuyVO;

public class SellOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BuyVO buyVO = new BuyVO();
		BuyDAO buyDAO = new BuyDAO();
		
		buyVO.setBuyNumber(Integer.parseInt(req.getParameter("buyNumber")));
		buyVO.setBuyPost(req.getParameter("buyPost"));
		buyVO.setBuyPostCode(req.getParameter("buyPostCode"));
		
		System.out.println(buyVO);
		
		buyDAO.updatePost(buyVO);
	}

}
