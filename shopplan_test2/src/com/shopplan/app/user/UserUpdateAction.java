package com.shopplan.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.UserDAO;
import com.shopplan.app.user.vo.UserVO;

public class UserUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		UserDAO u_dao = new UserDAO();
		ActionForward forward = new ActionForward();
		UserVO u_vo = new UserVO();
		HttpSession session = req.getSession();
		
		//user_id를 session_id에 있는 값을 가져와서 사용한다 
		String user_id = session.getAttribute("session_id").toString();
		u_vo = u_dao.getUserDetail(user_id);
		
		
		//request에 user_id로 조회한 유저의 정보를 userBean에 담아서 전송한다
		req.setAttribute("userBean", u_vo);
		//req를 유지하기 위해서 forward방식을 사용.
		forward.setRedirect(false);
		//응답 페이지에서는 userBean을 통해서 기존 회원가입정보를 표현할 수 있게 된다.
		forward.setPath("/app/user/mypage.jsp");
		
		
		return forward;
	}

}

