package com.pandang.app.basket;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.pandang.app.Execute;
import com.pandang.app.basket.dao.BasketDAO;
import com.pandang.app.basket.vo.BasketVO;

public class BasketController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BasketDAO basketDAO = new BasketDAO();
		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
//		int memberNumber = 1;
		
		
				
		List<BasketVO> basketList = basketDAO.selectAll(memberNumber);
		
		
		/* System.out.println(basketList); */
		  
			/* System.out.println("@@@@@@@@@"); */
		 
		
//		jsp에 basketList 넘겨주기!
		req.setAttribute("basketList", basketList);	
		req.getRequestDispatcher("/app/buy/basket.jsp").forward(req, resp);

	}

}
