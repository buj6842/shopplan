package com.shopplan.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;

public class ExpertLogoutOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		ActionForward forward = new ActionForward();
		
		//세션 삭제
		session.invalidate();
		
		//index로 이동
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/app/user/index.jsp");
		return forward;
	}

}
