package com.shopplan.app.askboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askboard.dao.AskBoardDAO;
import com.shopplan.app.askboard.vo.AskBoardReplyVO;

public class AskBoardReplyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		HttpSession session = req.getSession();
		AskBoardReplyVO r_vo = new AskBoardReplyVO();
		AskBoardDAO r_dao = new AskBoardDAO();
		//게시글 번호, 작성자, 댓글 내용
		
		int askboard_num = Integer.parseInt(req.getParameter("seq"));
		String user_id = (String)session.getAttribute("session_id");
		String askreply_content = req.getParameter("content");
		
		r_vo.setAskboard_num(askboard_num);
		r_vo.setUser_id(user_id);
		r_vo.setAskreply_content(askreply_content);
		
		if(r_dao.insertAskReply(r_vo)) {
			forward = new ActionForward();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/askboard/AskBoardView.as?seq="+askboard_num);
		}
		
		return forward;
	}

}
