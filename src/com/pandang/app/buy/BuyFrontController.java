package com.pandang.app.buy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.basket.BasketController;

public class BuyFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String target = req.getRequestURI().substring(req.getContextPath().length());

		switch(target) {		
		case "/buy/buyListOk.bu":
			new BuyListOkController().execute(req, resp);
//			req.getRequestDispatcher("/app/buy/order.jsp").forward(req, resp);
			break;
		case "/buy/pay.bu":
			new PayController().execute(req, resp);
			break;
		case "/buy/sell.bu":
			new SellController().execute(req, resp);
			break;
		case "/buy/sellOk.bu":
			new SellOkController().execute(req, resp);
			break;
		}
	}
}
