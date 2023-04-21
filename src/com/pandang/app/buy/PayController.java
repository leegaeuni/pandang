package com.pandang.app.buy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.basket.vo.BasketVO;
import com.pandang.app.buy.dao.BuyDAO;
import com.pandang.app.buy.vo.BuyVO;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.dto.MemberDTO;
import com.pandang.app.member.vo.MemberVO;
import com.pandang.app.store.dao.StoreDAO;

public class PayController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		StoreDAO storeDAO = new StoreDAO();
		List<BasketVO> payList = new ArrayList<BasketVO>();
//		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
		int memberNumber = 2;
		MemberDTO payMember = memberDAO.payMember(memberNumber);
		
		String email = payMember.getMemberEmail();
		
		String[] buyNumbers = req.getParameterValues("basket-product");
		String[] buyCnts = req.getParameterValues("buyCnt");
		
		String[] emails = email.split("@", 2);
		
		// 장바구니에서 개수 받아오기
		for(int i=0;i<buyNumbers.length; i++) {
			storeDAO.buy(Integer.parseInt(buyNumbers[i])).setBasketCnt(Integer.parseInt(buyCnts[i]));
			payList.add(storeDAO.buy(Integer.parseInt(buyNumbers[i])));
		}
		System.out.println("===================");
		System.out.println(payList.toString());
		
//		String emailFront = req.getSession().getAttribute("memberEmail");	
		
		
		// 이메일 나눠서 가져오기
		String emailFront = emails[0];
		String emailBack = emails[1];				
		
//		js로 보내주는데 ${emailFront}이걸로 그냥 받음
		req.setAttribute("emailFront", emailFront);
		req.setAttribute("emailBack", emailBack);
		req.setAttribute("payList", payList);
		
		System.out.println(payMember);

		req.setAttribute("payMember", payMember);
		req.getRequestDispatcher("/app/pay/pay.jsp").forward(req, resp);
	}

}
