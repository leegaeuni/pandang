package com.pandang.app.store.comment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.pandang.app.Execute;
import com.pandang.app.store.comment.dao.StoreCommentDAO;

public class StoreCommentListOkController implements Execute {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int storeNumber = Integer.valueOf(req.getParameter("storeNumber"));
		StoreCommentDAO storeCommentDAO = new StoreCommentDAO();
		Gson gson = new Gson();
		JsonArray replies = new JsonArray();

		storeCommentDAO.selectAll(storeNumber).stream()
		.map(gson::toJson)
		.map(JsonParser::parseString)
		.forEach(replies::add);

		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(replies.toString());
		out.close();
	}

}
