package com.shopplan.app.askhelp;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;


public class AskhelpReplyDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		AskhelpDAO r_dao = new AskhelpDAO();
		ActionForward forward = new ActionForward();
		
		int reply_num = Integer.parseInt(req.getParameter("reply_num"));
		int askhelp_num = Integer.parseInt(req.getParameter("seq"));
		
		r_dao.deleteReply(reply_num);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/askhelp/AskhelpView.he?seq=" + askhelp_num);
		
		return forward;
	}

}
