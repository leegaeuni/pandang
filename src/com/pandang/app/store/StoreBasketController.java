package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.basket.dao.BasketDAO;
import com.pandang.app.basket.dto.BasketDTO;
import com.pandang.app.store.dao.StoreDAO;

public class StoreBasketController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		StoreDAO storeDAO = new StoreDAO();
		BasketDAO basketDAO = new BasketDAO();
		BasketDTO basketDTO = new BasketDTO();
		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");		
		
		basketDTO.setMemberNumber((Integer)session.getAttribute("memberNumber"));	
		basketDTO.setStoreNumber(Integer.parseInt(req.getParameter("storeNumber")));
		
		System.out.println(basketDTO.toString());
		
		storeDAO.insertBasket(basketDTO);

		 req.setAttribute("storeBasket", basketDTO);
	}

}