package com.shopplan.app.askhelp;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;
import com.shopplan.app.askhelp.vo.AskhelpReplyVO;


public class AskhelpReplyModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		AskhelpDAO r_dao = new AskhelpDAO();
		AskhelpReplyVO r_vo = new AskhelpReplyVO();
		ActionForward forward = new ActionForward();
		
		int helpreply_num = Integer.parseInt(req.getParameter("reply_num"));
		int helpboard_num = Integer.parseInt(req.getParameter("seq"));
		String reply_content = req.getParameter("reply_content" + req.getParameter("num"));
		
		r_vo.setHelpreply_num(helpreply_num);
		r_vo.setReply_content(reply_content);

		r_dao.updateReply(r_vo);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/askhelp/AskhelpView.he?seq="+helpboard_num);
		
		return forward;
	}

}
