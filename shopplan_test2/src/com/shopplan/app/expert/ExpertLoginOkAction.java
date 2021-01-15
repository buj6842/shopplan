package com.shopplan.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExpertDAO;


public class ExpertLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		ActionForward forward = new ActionForward();
		
		ExpertDAO e_dao = new ExpertDAO();
		
		String id = req.getParameter("ex_id");
		String pw = req.getParameter("ex_pw");
		
		if(e_dao.loginEx(id, pw)) {
			//로그인 성공 시 세션에 아이디 등록한 채로 index로 돌아가기
			session.setAttribute("session_ex_id", id);
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/app/user/index.jsp");
		}else {
			forward.setRedirect(false);
			forward.setPath("/app/expert/exloginForm.jsp?login=false");
		}
		return forward;
	}
}





