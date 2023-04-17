package com.pandang.app.buy;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.buy.dao.BuyDAO;
import com.pandang.app.buy.vo.BuyVO;

public class BuyListOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BuyDAO buyDAO = new BuyDAO();
		
//		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
		int memberNumber = 2;
		int total = buyDAO.getTotal(memberNumber);
		System.out.println(total);						
		String temp = req.getParameter("page");
	      

      int page = temp == null ? 1 : Integer.valueOf(temp);
      int rowCount = 10;
      int pageCount = 5;
      int startRow = (page-1) * rowCount;
      int endPage = (int)(Math.ceil(page/(double)pageCount) * pageCount);
      int startPage = endPage - (pageCount - 1);
      int realEndPage = (int)Math.ceil(total / (double)rowCount);

      endPage = endPage > realEndPage ? realEndPage : endPage;

      boolean prev = startPage > 1;
      boolean next = endPage != realEndPage;
            
      
      System.out.println(prev);
      System.out.println(endPage);
      System.out.println(temp);
      System.out.println(req.getParameter("page"));
      System.out.println(realEndPage);
      
      
      Map<String, Integer> pageMap = new HashMap<>();
      pageMap.put("startRow", startRow);
      pageMap.put("rowCount", rowCount);
      pageMap.put("memberNumber", memberNumber);
      
      List<BuyVO> buyList = buyDAO.buySeleteAll(pageMap);
      
      System.out.println(memberNumber);
     
      req.setAttribute("buyList", buyList);
      req.setAttribute( "memberNumber", memberNumber);
      req.setAttribute("page", page);
      req.setAttribute("startPage", startPage);
      req.setAttribute("endPage", endPage);
      req.setAttribute("prev", prev);
      req.setAttribute("next", next);
      
      System.out.println(buyList);
      
      req.getRequestDispatcher("/app/buy/order.jsp").forward(req, resp);

	}

}
