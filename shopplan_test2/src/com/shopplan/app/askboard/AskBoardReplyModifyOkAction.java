package com.shopplan.app.askboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askboard.dao.AskBoardDAO;
import com.shopplan.app.askboard.vo.AskBoardReplyVO;

public class AskBoardReplyModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		AskBoardDAO r_dao = new AskBoardDAO();
		AskBoardReplyVO r_vo = new AskBoardReplyVO();
		ActionForward forward = new ActionForward();
		
		int askreply_num = Integer.parseInt(req.getParameter("reply_num"));
		int askboard_num = Integer.parseInt(req.getParameter("seq"));
		String askreply_content = req.getParameter("askreply_content" + req.getParameter("num"));
		
		r_vo.setAskreply_num(askreply_num);
		r_vo.setAskreply_content(askreply_content);
		
		r_dao.updateAskReply(r_vo);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/askboard/AskBoardView.as?seq="+askboard_num);
		
		return forward;
	}

}
