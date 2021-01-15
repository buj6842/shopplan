package com.shopplan.app.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;
import com.shopplan.app.community.vo.CommunityReplyVO;

public class CommunityReplyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		HttpSession session = req.getSession();
		CommunityReplyVO r_vo = new CommunityReplyVO();
		CommunityDAO r_dao = new CommunityDAO();
		//게시글 번호, 작성자, 댓글 내용
		
		int community_num = Integer.parseInt(req.getParameter("seq"));
		String user_id = (String)session.getAttribute("session_id");
		String community_reply_content = req.getParameter("content");
		
		r_vo.setCommunity_num(community_num);
		r_vo.setUser_id(user_id);
		r_vo.setCommunity_reply_content(community_reply_content);
		
		if(r_dao.insertCommunityReply(r_vo)) {
			forward = new ActionForward();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/community/CommunityView.ct?seq="+ community_num);
		}
		
		return forward;
	}

}
