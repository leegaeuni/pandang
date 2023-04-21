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
import com.pandang.app.main.vo.MainLikeViewVO;
import com.pandang.app.main.vo.MainVO;

public class MainOKController implements Execute{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MainDAO mainDAO = new MainDAO();
		MainDTO mainDTO = new MainDTO();
		Map<String, Integer> pageMap = new HashMap<String, Integer>();
		List<MainVO> channels = mainDAO.selectAll();
		List<MainLikeViewVO> stores = mainDAO.select();
		
		int channelNumber = 2;
		
		req.setAttribute("channels", channels);
		req.setAttribute("stores", stores);
		req.getRequestDispatcher("/app/main/main.jsp").forward(req, resp);
	}

}
