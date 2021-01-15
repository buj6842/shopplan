package com.shopplan.app.expert;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.vo.ExpertVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class ExpertFindPwOkAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");
      
      ExpertDAO e_dao = new ExpertDAO();
      ActionForward forward = new ActionForward();
      ExpertVO e_vo = new ExpertVO();
      
      String ex_id = req.getParameter("ex_id");
      String ex_phone_num = req.getParameter("ex_phone_num");
      
      
      String exfindPw = e_dao.exfindPw(ex_id, ex_phone_num);
      
      
      PrintWriter out = resp.getWriter();
      resp.setContentType("text/html;charset=utf-8");
      
      ActionForward foward = new ActionForward();
      
      if (exfindPw == null) {
         out.println("<script>");
         out.println("alert('비밀번호를 찾지 못했습니다. 아이디와 핸드폰번호를 확인해 주세요.')");
         out.println("</script>");
         out.close();
         forward = null;
      } else {
         
         Random r = new Random();
         String temp = "0123456789abcdefghijklmnopqrstuvwxyz~!@#$%^&*()_+-=[]{};:/?";
         String temp_pw = "";
         final int TEMP_PW_LENGTH = 6;
         
         for (int i = 0; i < TEMP_PW_LENGTH; i++) {
            temp_pw += temp.charAt(r.nextInt(temp.length()));
         }
         
      
         //DB에 해당 회원의 비밀번호가 임시비밀번호로 변경됨.
         e_dao.exChangePw(ex_id, temp_pw);
         
         
         String api_key = "NCSZAIQ04D1GT6NH";
         String api_secret = "ONV8KTD97OUQFTSKXELXKUWJEPJHFHTS";
         Message coolsms = new Message(api_key, api_secret);

         // 4 params(to, from, type, text) are mandatory. must be filled
         HashMap<String, String> params = new HashMap<String, String>();
         //누구에게 전송할 지
         params.put("to", ex_phone_num);
         //등록한 발신 번호 작성
         params.put("from", "01071266849");
         //SMS 그대로 유지
         params.put("type", "SMS");
         //전송할 메세지
         params.put("text", "[테스트]\n임시 비밀번호: " + temp_pw + "\n노출될 수 있으니 반드시 비밀번호를 변경해 주세요.");
         //사용하고 있는 API 버전
         params.put("app_version", "JAVA SDK v2.2"); // application name and version
         System.out.println(temp_pw);
       /*  try {
            //전송된 데이터를 JSON으로 변환하여 콘솔에 출력
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
         } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
         }*/
         
         forward.setRedirect(true);
         forward.setPath(req.getContextPath() + "/app/expert/exChangePassword.jsp");
       
      }
      return forward;
   }
   
}