package com.shopplan.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.User;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.UserDAO;
import com.shopplan.app.user.vo.UserVO;

public class UserFindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		
		UserDAO u_dao = new UserDAO();
		ActionForward forward = new ActionForward();
				
		String user_name = req.getParameter("user_name");
		String user_phone_number = req.getParameter("user_phone_number");
		
		String findId = u_dao.findId(user_name, user_phone_number);
		
		PrintWriter out = resp.getWriter();

		resp.setContentType("text/html;charset=utf-8");

		if (findId == null) {
			out.println("<script>");
			out.println("alert('가입하신 아이디가 없습니다.')");
			out.println("</script>");
			out.close();
		} else {
			session.setAttribute("session_name", findId);
			forward.setRedirect(true);
	        forward.setPath(req.getContextPath() + "/app/user/findUserId.jsp");
		}

		 return forward;

	}

}
