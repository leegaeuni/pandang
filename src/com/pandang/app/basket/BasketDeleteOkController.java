package com.pandang.app.basket;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandang.app.Execute;
import com.pandang.app.basket.dao.BasketDAO;
import com.pandang.app.basket.vo.BasketVO;

public class BasketDeleteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		BasketDAO basketDAO = new BasketDAO(); 
		
//		int memberNumber = (Integer)req.getSession().getAttribute("memberNumber");
		int memberNumber = 1;
		List<BasketVO> basketList = basketDAO.selectAll(memberNumber);

//		String[] 배열로 req.getParameterValues("storeNumber")의 값 받아옴
		String[] storeNumbers = req.getParameterValues("storeNumber");
		
//		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/";
		
	
		
		
		System.out.println("deleteVO");
		System.out.println(basketList);
		
		for(String str : storeNumbers) {
			/*
			 * System.out.println("삭제되는 스토어 넘버!");
			 * System.out.println(str); System.out.println("숫자로는 어떻게 나오나???");
			 * System.out.println(Integer.parseInt(str) );
			 * System.out.println("get으로 받아오는 체크된 스토어넘버");
			 */
//			System.out.println(basketList.get(memberNumber).getStoreNumber());
			
			basketDAO.delete(Integer.parseInt(str));
			
//			for(int i =0; i<basketList.size(); i++) {
//				if (Integer.parseInt(str) == basketList.get(i).getStoreNumber()) {
//					System.out.println(basketList.get(i).getStoreNumber());
//					basketDAO.delete(Integer.parseInt(str));
//			    }				
//			}	   				
			}													
		}
			
	}


