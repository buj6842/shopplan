package com.shopplan.app.askhelp;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;

public class AskhelpModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		System.out.println("ModifyAction in");
		AskhelpDAO a_dao = new AskhelpDAO();
		ActionForward forward = new ActionForward();
		
		int askhelp_num = Integer.parseInt(req.getParameter("seq"));
		

		req.setAttribute("askhelpBean", a_dao.getDetail(askhelp_num));
		

		forward.setRedirect(false);

		forward.setPath("/app/askhelp/askhelpModify.jsp");
		
		return forward;
	}

}
