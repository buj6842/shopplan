package com.shopplan.app.user;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.UserDAO;
import com.shopplan.app.user.vo.UserVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class UserChangePwOkAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");
      
      //String temp = "0123456789abcdefghijklmnopqrstuvwxyz~!@#$%^&*()_+-=[]{};:/?";
     // String temp_pw = null;
      HttpSession session = req.getSession();
      
      UserDAO u_dao = new UserDAO();
      ActionForward forward = new ActionForward();
      UserVO u_vo = new UserVO();
      
      String user_id = req.getParameter("user_id");
      String temp_pw =  req.getParameter("temp_pw");
      String new_pw = req.getParameter("new_pw");
     
      String reFindPw = u_dao.reFindPw(user_id, temp_pw, new_pw);
      
     
      PrintWriter out = resp.getWriter();
      resp.setContentType("text/html;charset=utf-8");
      
      ActionForward foward = new ActionForward();
      
      if (reFindPw == null ) {
    	  
          out.println("<script>");
          out.println("alert('비밀번호가 변경되지 않았습니다. 다시 시도해 주세요. ')");
          out.println("</script>");
          out.close();
          forward = null;
          
       } else {
    	
          //DB에 해당 회원의 임시비밀번호가 비밀번호로 변경됨.
          u_dao.reChangePw(user_id, new_pw);
          forward.setRedirect(true);
          forward.setPath(req.getContextPath() + "/app/user/loginForm.jsp");
          
         }
       
      return forward;
   }
   
}