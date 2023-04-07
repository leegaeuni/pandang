package com.pandang.app.sns;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.sns.comment.vo.SnsCommentVO;
import com.pandang.app.sns.dao.SnsDAO;
import com.pandang.app.sns.vo.SnsHeaderVO;
import com.pandang.app.sns.vo.SnsPostInfoVO;
import com.pandang.app.sns.vo.SnsVO;

public class SnsOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		// url에 있는 memberNumber 뽑아오는거
		req.getParameter("memberNumber");
		
		
		HttpSession session = req.getSession();
		session.setAttribute("memberNumber", 1);
		
		Integer memberNumber = (Integer)session.getAttribute("memberNumber");

		SnsDAO snsDAO = new SnsDAO();
		SnsHeaderVO snsHeaderVO = new SnsHeaderVO();

		// 클릭한 멤버의 화면을 보고싶음 거기서 받아올 memberNumber
		// 그 memberNumber의 화면이 넘어오도록 내가 만들어야함
		//
		// 걔를 ajax로 써서 req.getParameter에 꽂아야함
		req.getParameter("memberNumber");

		// sns snsVO
		List<SnsVO> snsVO = snsDAO.selectAll(memberNumber);


//		System.out.println(snsVO);

		System.out.println(snsVO);

//		for (SnsVO sns : snsVO) {
//			System.out.println(snsVO);
//		}

		req.setAttribute("sns", snsVO);

		// sns memberInfo
		snsHeaderVO = snsDAO.memberInfo((Integer.parseInt(req.getParameter("memberNumber"))));

		System.out.println(snsHeaderVO);
		System.out.println(snsHeaderVO.getMemberNickname());
		System.out.println(snsHeaderVO.getMemberNumber());
		System.out.println(snsHeaderVO.getChannelComment());

		req.setAttribute("snsMemberInfo", snsHeaderVO); // jsp에서 사용할 속성으로 설정

		// sns SnsPostInfo

		List<SnsPostInfoVO> snsPostInfoVO = snsDAO.snsPostInfo(memberNumber);

		System.out.println(snsPostInfoVO);

		req.setAttribute("snsPostInfo", snsPostInfoVO);

		req.getRequestDispatcher("/app/sns/mySns.jsp").forward(req, resp);

		// sns SnsCommentVO
		int snsNumber = 1;
		List<SnsCommentVO> snsCommentVO = snsDAO.snsCommentList(snsNumber);

		System.out.println(snsCommentVO);

		System.out.println(snsCommentVO.get(0).getChannelName());

		req.setAttribute("snsCommentList", snsCommentVO);

	}

}
