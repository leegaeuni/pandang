package com.pandang.app.main;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.main.dao.MainDAO;
import com.pandang.app.main.dto.MainDTO;
import com.pandang.app.main.vo.MainFollowingVO;
import com.pandang.app.main.vo.MainLikeViewVO;
import com.pandang.app.main.vo.MainVO;

public class MainOKController implements Execute{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MainDAO mainDAO = new MainDAO();
		MainDTO mainDTO = new MainDTO();
		MainFollowingVO mainFollowingVO = new MainFollowingVO();
		Map<String, Integer> pageMap = new HashMap<String, Integer>();
		List<MainVO> channels = mainDAO.selectAll();
		int memberNumber = 0;
		if(req.getSession().getAttribute("memberNumber") != null) {
			for(int i=0; i<channels.size(); i++) {
				mainFollowingVO.setMemberNumberFrom((Integer)req.getSession().getAttribute("memberNumber"));
				mainFollowingVO.setMemberNumberTo(channels.get(i).getMemberNumber());
				int result = mainDAO.selectFollowing(mainFollowingVO);
				channels.get(i).setIsFollow(result);
				System.out.println("!!!!!!!!!!!!!!!!!!!!");
				System.out.println(result);
			}
		}
		
		System.out.println(req.getSession().getAttribute("memberNumber"));
		if(req.getSession().getAttribute("memberNumber") != null) {
			memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
		}
		
		List<MainLikeViewVO> stores = mainDAO.select(memberNumber);
		
		int channelNumber = 2;
		
		req.setAttribute("channels", channels);
		req.setAttribute("stores", stores);
		req.getRequestDispatcher("/app/main/main.jsp").forward(req, resp);
	}

}
