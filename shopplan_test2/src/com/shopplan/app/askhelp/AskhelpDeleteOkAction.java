package com.shopplan.app.askhelp;

//import java.io.File;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;
//import com.shopplan.app.board.dao.FilesDAO;

public class AskhelpDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		AskhelpDAO b_dao = new AskhelpDAO();
//		FilesDAO f_dao = new FilesDAO();
		
		ActionForward forward = new ActionForward();
		
//		String folder = "C:\\Users\\USER\\Documents\\웹개발\\plan\\WebContent\\app\\askhelpupload";
		
		int askhelp_num = Integer.parseInt(req.getParameter("seq"));
		

		b_dao.deleteReplyAll(askhelp_num);
		b_dao.deleteBoard(askhelp_num);

		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/askhelp/AskhelpList.he");
		
		return forward;
	}

}











