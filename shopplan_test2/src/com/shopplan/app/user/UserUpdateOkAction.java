package com.shopplan.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.UserDAO;
import com.shopplan.app.user.vo.UserVO;

public class UserUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		UserDAO u_dao = new UserDAO();
		HttpSession session = req.getSession();
		UserVO u_vo = new UserVO();
		
			//session_id를 user_id라는 String타입으로 형변환 시켜서 가져오기
		String user_id = session.getAttribute("session_id").toString();
			//dao의 user_id로 userVO로 가져오는 getUserDetail 메소드 사용후 u_vo에 객체 넣기
			u_vo = u_dao.getUserDetail(user_id);
			
			//수정을위해서 컬럼값에 들어갈 값들 set으로 설정
			u_vo.setUser_pw(u_dao.encrypt(req.getParameter("user_pw")));
			u_vo.setUser_phone_number(req.getParameter("user_phone_number"));
			u_vo.setUser_email(req.getParameter("user_email"));
			u_vo.setUser_livingroom_c(req.getParameter("user_livingroom_c"));
			u_vo.setUser_kitchen_c(req.getParameter("user_kitchen_c"));
			u_vo.setUser_room_c(req.getParameter("user_room_c"));
			u_vo.setUser_zipcode(req.getParameter("user_zipcode"));
			u_vo.setUser_address(req.getParameter("user_address"));
			u_vo.setUser_address_detail(req.getParameter("user_address_detail"));
			u_vo.setUser_address_etc(req.getParameter("user_address_etc"));
			
		
			//userVO 객체의 내용으로 업데이트하는 updateUser메소드 사용
			u_dao.updateUser(u_vo);
		
			forward = new ActionForward();
		
			//전송시키면 req객체안에 값이 있을필요가없으므로 redirect방식으로 전송
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/app/user/index.jsp");
			
		return forward;
	}

}
