package com.shopplan.app.askboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askboard.dao.AskBoardDAO;

public class AskBoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		AskBoardDAO b_dao = new AskBoardDAO();
		ActionForward forward = new ActionForward();
		
		//상세보기에서 보고있던 게시글 번호를 전달받은 후
		int askboard_num = Integer.parseInt(req.getParameter("seq"));
		
		//수정할 페이지에 뿌려줄 데이터를 req에 담아서 전달해준다.
		req.setAttribute("askboardBean", b_dao.getDetail(askboard_num));
		
		//req를 유지하기 위해서 forward방식을 사용한다.
		forward.setRedirect(false);
		//응답 페이지에서는 boardBean을 통해서 기존 게시글 정보를 표현할 수 있게 된다.
		forward.setPath("/app/askboard/askboardModify.jsp");
		
		return forward;
	}

}
