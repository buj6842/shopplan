package com.shopplan.app.expert;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.vo.ExpertVO;



public class ExpertChangePwOkAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");
      
      //String temp = "0123456789abcdefghijklmnopqrstuvwxyz~!@#$%^&*()_+-=[]{};:/?";
     // String temp_pw = null;
      HttpSession session = req.getSession();
      
      ExpertDAO e_dao = new ExpertDAO();
      ActionForward forward = new ActionForward();
      ExpertVO  e_vo = new ExpertVO();
      
      String ex_id = req.getParameter("ex_id");
      String temp_pw =  req.getParameter("temp_pw");
      String new_pw = req.getParameter("new_pw");
     
      String reFindPwEx = e_dao.reFindPwEx(ex_id, temp_pw, new_pw);
      System.out.println("변경모두들어옴");
     
      PrintWriter out = resp.getWriter();
      resp.setContentType("text/html;charset=utf-8");
      
      ActionForward foward = new ActionForward();
      
      if (reFindPwEx == null ) {
    	  
          out.println("<script>");
          out.println("alert('비밀번호가 변경되지 않았습니다. 다시 시도해 주세요. ')");
          out.println("</script>");
          out.close();
          forward = null;
          
       } else {
    	
          //DB에 해당 회원의 임시비밀번호가 비밀번호로 변경됨.
          e_dao.reChangePwEx(ex_id, new_pw);
          forward.setRedirect(true);
          forward.setPath(req.getContextPath() + "/app/expert/exloginForm.jsp");
     
         }
       
      return forward;
   }
   
}