package com.shopplan.app.expert;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExpertDAO;


public class ExpertCheckIdOk implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		String ex_id = req.getParameter("id");
		ExpertDAO e_dao = new ExpertDAO();
		
		PrintWriter out = resp.getWriter();
		
		resp.setContentType("text/html;charset=utf-8");
	
		if(e_dao.checkExId(ex_id)) {
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




























