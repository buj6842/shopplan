package com.shopplan.app.gallery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.ActionForward;

public class GalleryFrontController extends HttpServlet{

	/**
	 * 
	 */
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
		
		if(command.equals("/gallery/GalleryView.ga")) {
			try {
				forward = new GalleryListAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/gallery/GalleryWriteOk.ga")) {
			try {
				forward = new GalleryWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/gallery/GalleryMorview.ga")) {
			try {
				forward = new GalleryMorevieAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/gallery/GallerySearch.ga")) {
			try {
				forward = new GallerySeachAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/gallery/GalleryWirte.ga")) {
			System.out.println("갤프컨들어옴");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/gallery/interior_galleryWrite.jsp");
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
