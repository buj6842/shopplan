package com.shopplan.app.askboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askboard.dao.AskBoardDAO;
import com.shopplan.app.askboard.dao.AskFilesDAO;
import com.shopplan.app.askboard.vo.AskBoardVO;
import com.shopplan.app.askboard.vo.AskFilesVO;

public class AskBoardViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		AskFilesDAO f_dao = new AskFilesDAO();
		AskBoardDAO b_dao = new AskBoardDAO();
		AskBoardVO b_vo = new AskBoardVO();
		
		int askboard_num = Integer.parseInt(req.getParameter("seq"));
		
		b_vo = b_dao.getDetail(askboard_num);
		
		List<AskFilesVO> askfilesList = f_dao.getDeatail(askboard_num);
		
		if(b_vo != null) {
			//forword로 응답
			//상세보기에서 내가클릭한 게시글의 내용을 알고싶어서 이 페이지를 거치는 것
			//b_vo = b_dao.getDetail(askboard_num);--> 컨트롤러로 전송
			
			req.setAttribute("askboardBean", b_vo);
			req.setAttribute("askreplyBeanList", b_dao.getAskReplyList(askboard_num));
			if(askfilesList != null) {
				req.setAttribute("askfilesBeanList", askfilesList);
			}
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/askboard/askboardView.jsp");
			return forward;
		}
		
		return null;
	}

}














