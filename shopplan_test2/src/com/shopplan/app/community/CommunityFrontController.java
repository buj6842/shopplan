package com.shopplan.app.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.ActionForward;
import com.shopplan.app.user.UserJoinOkAction;

public class CommunityFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		
		if(command.equals("/community/CommunityWrite.ct")) {

			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/community/communityWrite.jsp");
		}else if(command.equals("/community/CommunityList.ct")) {
			try {
				forward = new CommunityListAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityView.ct")) {
			try {
				forward = new CommunityViewAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunitySearch.ct")) {
			try {
				forward = new CommunitySearchAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityWriteOk.ct")) {
			try {
				forward = new CommunityWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityModify.ct")) {
			try {
				forward = new CommunityModifyAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityModifyOk.ct")) {
			try {
				forward = new CommunityModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityFileDownload.ct")){
			try {
				forward = new CommunityFileDownloadAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityDeleteOk.ct")){
			try {
				forward = new CommunityDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityReplyModifyOk.ct")) {
			try {
				forward = new CommunityReplyModifyAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityReplyOk.ct")) {
			try {
				forward = new CommunityReplyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/community/CommunityReplyDeleteOk.ct")) {
			try {
				forward = new CommunityReplyDeleteAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}
	 	
		//일괄처리
		if(forward != null) { 
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
		
	}
}
