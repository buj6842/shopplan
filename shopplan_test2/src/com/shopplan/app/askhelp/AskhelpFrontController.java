package com.shopplan.app.askhelp;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.ActionForward;

public class AskhelpFrontController extends HttpServlet{

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
		
		System.out.println("ok");
		switch(command) {
		case "/askhelp/AskhelpList.he" ://**************************************************
			try {
				forward = new AskhelpListAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/askhelp/AskhelpView.he" :
			try {
				System.out.println("view ok");
				forward = new AskhelpViewAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("view not ok");
			}
			break;
		case "/askhelp/AskhelpWrite.he" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/askhelp/askhelpWrite.jsp");
			break;
		case "/askhelp/AskhelpWriteOk.he":
			try {
				forward = new AskhelpWriteOkAction().execute(req, resp);
				System.out.println("write ok");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("write not ok");
			}
			break;
		case "/askhelp/AskhelpDeleteOk.he":
			try {
				forward = new AskhelpDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/askhelp/AskhelpModify.he":
			try {
				forward = new AskhelpModifyAction().execute(req, resp);
				System.out.println("modified");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("not modified");
			}
			break;
		case "/askhelp/AskhelpModifyOk.he":
			try {
				forward = new AskhelpModifyOkAction().execute(req, resp);
				System.out.println("modifyOk ok");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("modifyOk not ok");
			}
			break;
/*		case "/board/FileDownload.bo":
			try {
				forward = new FileDownloadAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
*/
		case "/askhelp/AskhelpReplyOk.he":
			try {
				forward = new AskhelpReplyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/askhelp/AskhelpReplyDeleteOk.he":
			try {
				forward = new AskhelpReplyDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/askhelp/AskhelpReplyModifyOk.he":
			try {
				forward = new AskhelpReplyModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		/*case "/askhelp/AskhelpSearch.he":
			try {
				forward = new AskhelpSearchAction().execute(req, resp);
				System.out.println("search action ok");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("search action not ok");
			}
			break; */
			
		default:
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}
		

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




