package com.shopplan.app.askhelp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;

public class AskhelpListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		AskhelpDAO b_dao = new AskhelpDAO();
				

		String temp = req.getParameter("page");

		int page = temp == null ? 1 : Integer.parseInt(temp);
		

		int pageSize = 10;
		

		int endRow = page * pageSize;
		

		int startRow = endRow - (pageSize - 1);
		
		int totalCnt = b_dao.getAskhelpCnt();
		

		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + 9;
		
		int realEndPage = (totalCnt - 1) / pageSize + 1;
		

		endPage = endPage > realEndPage ? realEndPage : endPage;
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("askhelpList", b_dao.getAskhelpList(startRow, endRow));
		
		forward.setRedirect(false);
		forward.setPath("/app/askhelp/askhelpList.jsp");
		
		return forward;
	}
}




















