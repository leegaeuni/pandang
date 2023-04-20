package com.pandang.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.member.dao.MemberDAO;
import com.pandang.app.member.vo.MemberVO;

public class MyPageOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO memberDAO = new MemberDAO();
//		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
//		로그인 안 해서 memberNumber을 받을 수 없음 따라서 DB에서 바로 접근을 위해 int memberNumber = 2로 임의로 설정함
		HttpSession session = req.getSession();
		MemberVO myPage = memberDAO.myPageSelectAll((Integer)session.getAttribute("memberNumber"));
		// memberDAO의 memberNumber만 받아옴
		
		
		req.setAttribute("myPage", myPage);
		req.getRequestDispatcher("/app/mypage/myPage.jsp").forward(req, resp);
	}

}
