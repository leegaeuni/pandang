package com.pandang.app.store.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.pandang.app.Execute;
import com.pandang.app.store.file.dao.StoreFileDAO;
import com.pandang.app.store.file.dto.StoreFileDTO;

public class StoreFileOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreFileDAO storeFileDAO = new StoreFileDAO();
		StoreFileDTO storeFileDTO = new StoreFileDTO();
		int storeNumber = Integer.parseInt(req.getParameter("storeNumber"));
		List<StoreFileDTO> files = storeFileDAO.selectList(storeNumber);
		Gson gson = new Gson();
		
		
		resp.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		JsonElement json = JsonParser.parseString(gson.toJson(files));
		out.print(json.toString());
		
	}
}