package com.pandang.app.buy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.buy.dao.BuyDAO;
import com.pandang.app.buy.vo.BuyVO;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.report.sns.dao.ReportSnsDAO;
import com.pandang.app.report.sns.vo.ReportSnsVO;

public class SellController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		BuyDAO buyDAO = new BuyDAO();
		// 페이지에 보여줘야하는 모든 데이터가 담긴 BuyVO
		BuyVO buyVO = new BuyVO();

		// 로그인한 회원(판매자)의 판매정보를 가져와야함.
		Integer memberNumber = (Integer) req.getSession().getAttribute("memberNumber");

		// 페이징처리.
		int total = buyDAO.getTotal(memberNumber);
		
//      처음 게시판 페이지에 진입하면 페이지에 대한 정보가 없다.
//      그러므로 temp에는 null이 들어가게 된다.
		String temp = req.getParameter("page");

//      null인 경우는 게시판에 처음 이동하는 것이므로 1페이지를 띄워주면 된다.
		int page = temp == null ? 1 : Integer.valueOf(temp);

//      한 페이지에 몇 개의 게시물? 10개
		int rowCount = 10;
//      페이지 버튼 세트는? 5개씩
		int pageCount = 5;

//       * 0, 10 -> 1페이지
//       * 10, 10 -> 2페이지
//       * 20, 10 -> 3페이지
		int startRow = (page - 1) * rowCount;

//      Math.ceil() 올림처리
		int endPage = (int) (Math.ceil(page / (double) pageCount) * pageCount);
//      endPage는 페이지 세트 당 마지막 번호를 의미한다.

		int startPage = endPage - (pageCount - 1);
//      startPage는 페이지 세트 당 첫 번째 번호를 의미한다.

		int realEndPage = (int) Math.ceil(total / (double) rowCount);
//      realEndPage는 전체 페이지 중 가낭 마지막 번호를 의미한다.

		endPage = endPage > realEndPage ? realEndPage : endPage;
//      첫 번째 페이지 세트가 1~5
//      두 번째 페이지 세트가 6~10이어도
//      realEndPage가 7이라면 두 번째 페이지 세트의 마지막 번호는 7이어야 한다.

		boolean prev = startPage > 1;
		boolean next = endPage != realEndPage;

		Map<String, Integer> pageMap = new HashMap<>();
		pageMap.put("memberNumber", memberNumber);
		pageMap.put("startRow", startRow);
		pageMap.put("rowCount", rowCount);

		// BuyDAO의 buySeleteAll메소드를 사용해서 mapper의 쿼리문을 돌려서 가져온 데이터를 List로 저장.
		List<BuyVO> salesDetail = buyDAO.buySeleteAll(pageMap);
		
		System.out.println(salesDetail.toString());

		req.setAttribute("salesDetail", salesDetail);
		req.setAttribute("page", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("prev", prev);
		req.setAttribute("next", next);

		req.getRequestDispatcher("/app/pay/sell.jsp").forward(req, resp);
	}

}
