package com.shopplan.app.askboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askboard.dao.AskBoardDAO;

public class AskBoardReplyDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		AskBoardDAO r_dao = new AskBoardDAO();
		ActionForward forward = new ActionForward();
		
		int askreply_num = Integer.parseInt(req.getParameter("askreply_num"));
		int askboard_num = Integer.parseInt(req.getParameter("seq"));
		
		r_dao.deleteAskReply(askreply_num);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/askboard/AskBoardView.as?seq=" + askboard_num);
		
		return forward;
	}

}
