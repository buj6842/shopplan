package com.shopplan.app.askhelp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
//import com.shopplan.app.board.dao.BoardDAO;
//import com.shopplan.app.board.vo.BoardVO;
//import com.shopplan.app.board.vo.FilesVO;
import com.shopplan.app.askhelp.dao.AskhelpDAO;
import com.shopplan.app.askhelp.vo.AskhelpVO;

public class AskhelpViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("view.he in");  
		req.setCharacterEncoding("UTF-8");
		
		AskhelpDAO a_dao = new AskhelpDAO();
		AskhelpVO a_vo = new AskhelpVO();
		
		int askhelp_num = Integer.parseInt(req.getParameter("seq"));
		
		a_vo = a_dao.getDetail(askhelp_num);
		a_dao.updateReadCount(askhelp_num); 

		
		if(a_vo != null) {
			req.setAttribute("askhelpbean", a_vo);
			req.setAttribute("replyBeanList", a_dao.getReplyList(askhelp_num));
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/askhelp/askhelpView.jsp");
			return forward;
		}
		
		return null;
	}

}














