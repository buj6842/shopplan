package com.shopplan.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.UserDAO;

public class UserCheckIdOk implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		UserDAO u_dao = new UserDAO();
		
		PrintWriter out = resp.getWriter();
		
		resp.setContentType("text/html;charset=utf-8");
	
		if(u_dao.checkId(id)) {
			System.out.println("중복");
			out.println("not-ok");
		}else {
			System.out.println("중복없음");
			out.println("ok");
		}
		
		out.close();
		return null;
	}

}




























