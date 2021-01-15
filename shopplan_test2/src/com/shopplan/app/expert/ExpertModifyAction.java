package com.shopplan.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExFilesDAO;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.vo.ExFilesVO;
import com.shopplan.app.user.vo.ExpertVO;

public class ExpertModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		ExpertDAO e_dao = new ExpertDAO();
		//ExpertVO e_vo = new ExpertVO();
		ExFilesDAO exf_dao = new ExFilesDAO();
		//ExFilesVO exf_vo = new ExFilesVO();
		ActionForward forward = new ActionForward();
		
		
		int ex_num = Integer.parseInt(req.getParameter("ex_num"));
		
		//수정할 페이지에 뿌려줄 데이터를 req에 담아서 전달해준다.
		req.setAttribute("exBean", e_dao.getDetail(ex_num));
		//req.setAttribute("filesBeanExList", exf_dao.getDetail(ex_num));
		
		//req를 유지하기 위해서 forward방식을 사용한다.
		forward.setRedirect(false);
		//응답 페이지에서는 boardBean을 통해서 기존 게시글 정보를 표현할 수 있게 된다.
		forward.setPath("/app/expert/expageModify.jsp");
		
		return forward;
	}

}


























