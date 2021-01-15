package com.shopplan.app.expert;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExFilesDAO;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.vo.ExFilesVO;
import com.shopplan.app.user.vo.ExpertVO;


public class ExpertUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		ExpertDAO e_dao = new ExpertDAO();
		ExpertVO e_vo = new ExpertVO();
		ExFilesDAO exf_dao = new ExFilesDAO();
		
		HttpSession session = req.getSession();
		String ex_id = session.getAttribute("session_ex_id").toString();
		//아이디로 전문가회원의 전체정보를 expertVO 타입의 객체로 담는 메소드 getExDetail 사용
		//e_vo라는 객체에 아이디로 회원정보를 가져온 객체를 담아준다
		e_vo = e_dao.getExDetail(ex_id);
		
		int ex_num = e_vo.getEx_num();
		//e_vo가 가지고있는 num을  int ex_num이라는 변수에대입
		
		List<ExFilesVO> filesExList = exf_dao.getDetail(ex_num);
		
		if(e_vo != null) {
			req.setAttribute("exBean", e_vo);
			if(filesExList != null) {
				req.setAttribute("filesBeanExList", filesExList);
			}
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/expert/expageForm.jsp");
			return forward;
		}
		return null;
	}

}

