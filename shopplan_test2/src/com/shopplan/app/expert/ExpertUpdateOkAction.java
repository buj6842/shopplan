package com.shopplan.app.expert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExFilesDAO;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.dao.UserDAO;
import com.shopplan.app.user.vo.ExpertVO;
import com.shopplan.app.user.vo.UserVO;

public class ExpertUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		ExpertDAO e_dao = new ExpertDAO();
		HttpSession session = req.getSession();
		ExpertVO e_vo = new ExpertVO();
		ExFilesDAO exf_dao = new ExFilesDAO();
		
		
		String ex_id = session.getAttribute("session_ex_id").toString();
		e_vo = e_dao.getExDetail(ex_id);
		
			//e_vo.setEx_id(ex_id);
			e_vo.setEx_pw(e_dao.encrypt(req.getParameter("ex_pw")));
			e_vo.setEx_expert_name(req.getParameter("ex_expert_name"));
			e_vo.setEx_phone_num(req.getParameter("ex_phone_num"));
			e_vo.setEx_email(req.getParameter("ex_email"));
			e_vo.setEx_zipcode(req.getParameter("ex_zipcode"));
			e_vo.setEx_address(req.getParameter("ex_address"));
			e_vo.setEx_address_detail(req.getParameter("ex_address_detail"));
			e_vo.setEx_address_etc(req.getParameter("ex_address_etc"));
			
			
			//userVO 객체의 내용으로 업데이트하는 updateUser메소드 사용
			e_dao.updateEx(e_vo);
		
			forward = new ActionForward();
		
			//전송시키면 req객체안에 값이 있을필요가없으므로 redirect방식으로 전송
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/app/user/index.jsp");
			
		return forward;
	}

}

