package com.shopplan.app.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;
import com.shopplan.app.community.vo.CommunityReplyVO;

public class CommunityReplyModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		CommunityDAO c_dao = new CommunityDAO();
		ActionForward forward = new ActionForward();
		CommunityReplyVO r_vo = new CommunityReplyVO();
		
		int community_reply_num = Integer.parseInt(req.getParameter("reply_num"));
		int community_num = Integer.parseInt(req.getParameter("seq"));
		String community_reply_content = req.getParameter("reply_content" + req.getParameter("num"));
		
		
		r_vo.setCommunity_reply_num(community_reply_num);
		r_vo.setCommunity_reply_content(community_reply_content);
		
		c_dao.updateCommunityReply(r_vo);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() +"/community/CommunityView.ct?seq=" + community_num);
		
		return forward;
	}

}
