package com.shopplan.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.UserDAO;

public class UserLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		ActionForward forward = new ActionForward();
		
		UserDAO u_dao = new UserDAO();
		
		String id = req.getParameter("user_id");
		String pw = req.getParameter("user_pw");
		
		if(u_dao.login(id, pw)) {
			//로그인 성공 시 세션에 아이디 등록한 채로 index로 돌아가기
			session.setAttribute("session_id", id);
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/app/user/index.jsp");
		}else {
			//로그인 실패 시 /app/memeber/loginForm.jsp?login=false로 이동
			forward.setRedirect(false);
			forward.setPath("/app/user/loginForm.jsp?login=false");
		}
		return forward;
	}
}
