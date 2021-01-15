package com.shopplan.app.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;
import com.shopplan.app.community.dao.CommunityFilesDAO;
import com.shopplan.app.community.vo.CommunityFilesVO;
import com.shopplan.app.community.vo.CommunityVO;

public class CommunityViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		CommunityFilesDAO f_dao = new CommunityFilesDAO();
		CommunityDAO c_dao = new CommunityDAO();
		CommunityVO  c_vo  = new CommunityVO();
		
		int community_num = Integer.parseInt(req.getParameter("seq"));
		
		c_vo = c_dao.getDetail(community_num);
		c_dao.updateReadCount(community_num);
		
		List<CommunityFilesVO> filesList = f_dao.getDetail(community_num);
		
		if(c_vo != null) {
			//forward로 응답
			req.setAttribute("communityFilesBeanList", filesList);
			if(filesList != null) {
			req.setAttribute("communityBean", c_vo); //게시글
			req.setAttribute("replyBeanList", c_dao.getCommunityReplyList(community_num));//댓글

			
			}
			ActionForward forward = new ActionForward();
			forward.setRedirect(false); 
			forward.setPath("/app/community/communityView.jsp");
			return forward;
		}
		
		
		return null;
	}

}
