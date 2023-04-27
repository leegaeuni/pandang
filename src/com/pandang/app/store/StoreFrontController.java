package com.pandang.app.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StoreFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String target = req.getRequestURI().substring(req.getContextPath().length());

		switch (target) {
		case "/store/storeOk.st":
			new StoreOkController().execute(req, resp);
			break;
		case "/store/storeAjaxOk.st":
			new StoreAjaxOkController().execute(req, resp);
			break;
		case "/store/storeAjaxLikeOk.st":
			new StoreAjaxLikeOkController().execute(req, resp);
			break;
		case "/store/storeAjaxDateOk.st":
			new StoreAjaxDateOkController().execute(req, resp);
			break;
		case "/store/storeAjaxFreeOk.st":
			new StoreAjaxFreeOkController().execute(req, resp);
			break;
		case "/store/storeWrite.st":
			new StoreWriteController().execute(req, resp);
			break;
		case "/store/storeWriteOk.st":
			new StoreWriteOkController().execute(req, resp);
			break;
		case "/store/storeUpdate.st":
			new StoreUpdateController().execute(req, resp);
			break;
		case "/store/storeUpdateOk.st":
			new StoreUpdateOkController().execute(req, resp);
			break;
		case "/store/storeDeleteOk.st":
			new StoreDeleteOkController().execute(req, resp);
			break;
		case "/store/storeSearch.st":
			new StoreSearchController().execute(req, resp);
			break;
		case "/store/storeSearchAjax.st":
			new StoreSearchAjaxController().execute(req, resp);
			break;
		case "/store/storeUpdateViewCntOk.st":
			new StoreUpdateViewCntOkController().execute(req, resp);
			break;
		case "/store/storeModalOk.st":
			new StoreModalOkController().execute(req, resp);
			break;
		case "/store/storeReport.st":
			new StoreReportController().execute(req, resp);
			break;
		case "/store/storeReportOk.st":
			new StoreReportOkController().execute(req, resp);
			break;
		case "/store/storeBasket.st":
			new StoreBasketController().execute(req, resp);
			break;
		case "/store/storeLikeOk.st":
			new StoreLikeController().execute(req, resp);
			break;			
		case "/store/storeLikeDelete.st":
			new StoreLikeDeleteController().execute(req, resp);
			break;			
		case "/store/storeFollowOk.st":
			new StoreFollowOkController().execute(req, resp);
			break;			
		case "/store/storeFollowDeleteOk.st":
			new StoreFollowDeleteOkController().execute(req, resp);
			break;					
		}
	}
}
