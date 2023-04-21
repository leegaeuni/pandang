package com.pandang.app.buy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.buy.dao.BuyDAO;
import com.pandang.app.buy.dto.BuyDTO;

public class buyCancelOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		BuyDAO buyDAO = new BuyDAO();
		BuyDTO buyDTO = new BuyDTO();	
		
		/* System.out.println(req.getParameter("buyNumber")); */
		 int buyNumber = Integer.parseInt(req.getParameter("buyNumber")); 
		
		 
		buyDAO.buyCancel(buyNumber);	 					 	
			 
	}

}
