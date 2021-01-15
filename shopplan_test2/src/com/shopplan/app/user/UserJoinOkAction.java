package com.shopplan.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.UserDAO;
import com.shopplan.app.user.vo.UserVO;

public class UserJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		UserDAO u_dao = new UserDAO();
		UserVO u_vo = new UserVO();
		
		//uservo객체에 parameter로 받은값을 set으로 설정해준다
		u_vo.setUser_id(req.getParameter("user_id"));
		u_vo.setUser_pw(req.getParameter("user_pw"));
		u_vo.setUser_phone_number(req.getParameter("user_phone_number"));
		u_vo.setUser_name(req.getParameter("user_name"));
		u_vo.setUser_email(req.getParameter("user_email"));
		u_vo.setUser_age(Integer.parseInt(req.getParameter("user_age")));
		u_vo.setUser_gender(req.getParameter("user_gender"));
		u_vo.setUser_livingroom_c(req.getParameter("user_livingroom_c"));
		u_vo.setUser_kitchen_c(req.getParameter("user_kitchen_c"));
		u_vo.setUser_room_c(req.getParameter("user_room_c"));
		u_vo.setUser_zipcode(req.getParameter("user_zipcode"));
		u_vo.setUser_address(req.getParameter("user_address"));
		u_vo.setUser_address_detail(req.getParameter("user_address_detail"));
		u_vo.setUser_address_etc(req.getParameter("user_address_etc"));
		u_vo.setAdmin(0);
		
		//회원가입 실패시 >>join메소드는 boolean타입임
		if(!u_dao.join(u_vo)) {
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('회원가입 실패. 잠시후 다시 시도해주세요.')");
			out.println("</script>");
			out.close();
		}else {
			//성공시
			forward = new ActionForward();
			
			forward.setRedirect(false);
			forward.setPath("/user/UserLogin.us");
			//forward.setPath(req.getContextPath() + "/user/UserLogin.me");
			
		}
		return forward;	
	}

}





















