package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandang.app.Execute;
import com.pandang.app.store.dao.StoreDAO;
import com.pandang.app.store.dto.StoreDTO;

public class StoreWriteOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDAO storeDAO = new StoreDAO();
		StoreDTO storeDTO = new StoreDTO();
		
		
		System.out.println("컨트롤러 입력 정상.");
		System.out.println(req.getParameter("storeTitle"));
	}

}
