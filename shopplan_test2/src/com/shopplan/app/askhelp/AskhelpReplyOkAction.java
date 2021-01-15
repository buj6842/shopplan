package com.shopplan.app.askhelp;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;
import com.shopplan.app.askhelp.vo.AskhelpReplyVO;

public class AskhelpReplyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		HttpSession session = req.getSession();
		AskhelpReplyVO r_vo = new AskhelpReplyVO();
		AskhelpDAO r_dao = new AskhelpDAO();
		
		int askhelp_num = Integer.parseInt(req.getParameter("seq"));
		String user_id = (String)session.getAttribute("session_id");
		String reply_content = req.getParameter("content");
		
		r_vo.setHelpboard_num(askhelp_num);
		r_vo.setUser_id(user_id);
		r_vo.setReply_content(reply_content);
		
		if(r_dao.insertReply(r_vo)) {
			forward = new ActionForward();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/askhelp/AskhelpView.he?seq="+askhelp_num);
		}
		
		return forward;
	}

}
