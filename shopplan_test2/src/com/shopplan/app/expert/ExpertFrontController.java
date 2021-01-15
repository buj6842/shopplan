package com.shopplan.app.expert;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.ActionForward;
import com.shopplan.app.user.UserChangePwOkAction;
import com.shopplan.app.user.UserCheckIdOk;
import com.shopplan.app.user.UserFindIdAction;
import com.shopplan.app.user.UserFindPwAction;

public class ExpertFrontController extends HttpServlet {
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

		// 아이디 중복검사
		if (command.equals("/expert/ExpertCheckIdOk.ex")) {
			try {
				forward = new ExpertCheckIdOk().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// 전문가 로그인
		} else if (command.equals("/expert/ExpertLogin.ex")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/expert/exloginForm.jsp");
			
		
		} else if (command.equals("/user/SignUp.us")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/user/signUpForm.jsp");

		// 회원가입
		}else if (command.equals("/expert/ExpertJoin.ex")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/expert/exjoinForm.jsp");
			
			//회원가입및 전문가파일전송
		} else if (command.equals("/expert/ExpertJoinOk.ex")) {
			try {
				forward = new ExpertJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			//id로 정보가져와서 출력
		} else if (command.equals("/expert/ExpertUpdateOk.ex")) {
				try {
					forward = new ExpertUpdateOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			//마이페이지업데이트
		}else if (command.equals("/expert/ExpertUpdate.ex")) {
			try {
				forward = new ExpertUpdateAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//파일 다운로드
		}else if(command.equals("/expert/FileDownload.ex")) {
				try {
					forward = new FileDownloadAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			//파일삭제	
		}else if(command.equals("/expert/ExpertDeleteOk.ex")) {
			try {
				forward = new ExpertDeleteOKAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//파일수정
		}else if(command.equals("/expert/ExpertModify.ex")) {
			try {
				forward = new ExpertModifyAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/expert/ExpertModifyOk.ex")) {
			try {
				forward = new ExpertModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		} else if (command.equals("/expert/ExpertLoginOk.ex")) {
			try {
				forward = new ExpertLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/expert/ExpertLogoutOk.ex")) {
			try {
				forward = new ExpertLogoutOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//아이디찾기
		} else if (command.equals("/expert/ExpertFindId.ex")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/expert/exfindIdPw.jsp");

		} else if (command.equals("/expert/ExpertFindIdOk.ex"))
			try {
				forward = new ExpertFindIdOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();	
				
			//비번찾기	
		} else if (command.equals("expert/ExpertFindPw.ex")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/expert/exfindIdPw.jsp");
		
		} else if (command.equals("/expert/ExpertFindPwOk.ex"))
			try {
				forward = new ExpertFindPwOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
	
				//전송문자로 비번변경
		} else if (command.equals("expert/ExpertChangePw.ex")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/expert/exChangePassword.jsp");
		
		} else if (command.equals("/expert/ExpertChangePwOk.ex"))
		try {
			forward = new ExpertChangePwOkAction().execute(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			
				
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}}
