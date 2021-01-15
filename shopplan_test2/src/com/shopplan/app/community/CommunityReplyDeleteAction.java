package com.shopplan.app.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;

public class CommunityReplyDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		CommunityDAO c_dao = new CommunityDAO();
		ActionForward forward = new ActionForward();
		
		int community_reply_num = Integer.parseInt(req.getParameter("reply_num"));
		int community_num = Integer.parseInt(req.getParameter("seq"));
		
		c_dao.deleteCommunityReply(community_reply_num);

		forward.setRedirect(true);
		forward.setPath(req.getContextPath() +"/community/CommunityView.ct?seq="+ community_num);
		return forward;
	}

}
