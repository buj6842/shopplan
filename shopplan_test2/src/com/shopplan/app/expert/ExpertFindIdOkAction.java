package com.shopplan.app.expert;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.User;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.vo.ExpertVO;


public class ExpertFindIdOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();

		ExpertDAO e_dao = new ExpertDAO();
		ActionForward forward = new ActionForward();
		
		String ex_name = req.getParameter("ex_name");
		String ex_phone_num = req.getParameter("ex_phone_num");
		
		String exfindId = e_dao.exfindId(ex_name, ex_phone_num);

		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html;charset=utf-8");

		if (exfindId == null) {
			out.println("<script>");
			out.println("alert('가입하신 아이디가 없습니다.')");
			out.println("</script>");
			out.close();
		} else {
			session.setAttribute("session_ex_name", exfindId);
			forward.setRedirect(true);
	        forward.setPath(req.getContextPath() + "/app/expert/findExpertId.jsp");
		}

		return forward;

	}

}


