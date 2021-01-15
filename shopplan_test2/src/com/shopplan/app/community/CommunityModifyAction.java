package com.shopplan.app.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;

public class CommunityModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		CommunityDAO c_dao = new CommunityDAO();
		
		ActionForward forward = new ActionForward();
		
		//상세보기에서 보고있던 게시글 번호를 전달 받은 후
		int community_num = Integer.parseInt(req.getParameter("seq"));
		
		//수정할 페이지에 뿌려줄 데이터를 req에 담아서 전달해준다.
		req.setAttribute("CommunityBean", c_dao.getDetail(community_num));
		
		//req를 유지하기위해 forward방식을 사용
		forward.setRedirect(false);
		//응답페이지에서 CommunityBean을 통해서 기존 게시글 정보를 표현할 수 있게 된다.
		forward.setPath("/app/community/communityModify.jsp");
		
		return forward;
	}

}
