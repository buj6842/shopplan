package com.shopplan.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.ActionForward;

public class UserFrontController extends HttpServlet{
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
			
			
			//아이디 중복검사
			if(command.equals("/user/UserCheckIdOk.us")) {
				try {
					forward = new UserCheckIdOk().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			//회원가입
			}else if(command.equals("/user/SignUp.us")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/user/signUpForm.jsp");
				
			}else if(command.equals("/user/UserJoin.us")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/user/joinForm.jsp");
				
			}else if(command.equals("/user/UserJoinOk.us")) {
				try {
					forward = new UserJoinOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				//로그인
			}else if(command.equals("/user/UserFindOk.us")) {
				try {
					forward = new UserFindIdAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				//로그인
			}else if(command.equals("/user/UserLogin.us")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/user/loginForm.jsp");
				//에러
			
			}else if(command.equals("/user/UserLivingroom.us")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/user/living_room.jsp");
				//에러
			}else if(command.equals("/user/UserKitchen.us")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/user/kitchen.jsp");
				//에러
			}else if(command.equals("/user/UserRoom.us")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/user/room.jsp");
				//에러
			}else if(command.equals("/user/UserUpdate.us")){
				try {
					forward = new UserUpdateAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/user/UserUpdateOk.us")){
				try {
					forward = new UserUpdateOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/user/UserLoginOk.us")){
				try {
					forward = new UserLoginOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				//에러
				// 아이디/pw찾기
	
				
			} else if (command.equals("/user/UserFindId.us")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/user/find_id.jsp");

			} else if (command.equals("/user/UserFindIdOk.us"))
				try {
					forward = new UserFindIdAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();

					//PW찾기
			} else if (command.equals("user/UserFindPw.us")) {
					forward = new ActionForward();
					forward.setRedirect(false);
					forward.setPath("/app/user/find_id.jsp");
					
					//문자전송
			} else if (command.equals("/user/UserFindPwOk.us"))
				try {
					forward = new UserFindPwAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
		
					//전송문자로 비번변경
			} else if (command.equals("user/UserChangePw.us")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/user/ChangePassword.jsp");
			
			} else if (command.equals("/user/UserChangePwOk.us"))
			try {
				forward = new UserChangePwOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				
				//로그아웃으로
			}else if(command.equals("/user/UserLogOut.us")){
				try {
					forward = new UserLogoutOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else {
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














