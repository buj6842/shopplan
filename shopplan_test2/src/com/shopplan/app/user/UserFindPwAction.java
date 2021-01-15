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

public class UserFindPwAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      req.setCharacterEncoding("UTF-8");
      resp.setCharacterEncoding("UTF-8");
      
      UserDAO u_dao = new UserDAO();
      ActionForward forward = new ActionForward();
      UserVO u_vo = new UserVO();
     
      String user_id = req.getParameter("user_id");
      String user_phone_number = req.getParameter("user_phone_number");
      
      
      String findPw = u_dao.findPw(user_id, user_phone_number);
          
      
      PrintWriter out = resp.getWriter();
      resp.setContentType("text/html;charset=utf-8");
      
      ActionForward foward = new ActionForward();
      
      if (findPw == null) {
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
         u_dao.changePw(user_id, temp_pw);
         
         //외부API(문자발송)
         //coolsms 사이트에 로그인 한 후
         //본인의 API KEY값을 참고하여 작성한다.
         String api_key = "NCSZAIQ04D1GT6NH";
         String api_secret = "ONV8KTD97OUQFTSKXELXKUWJEPJHFHTS";
         Message coolsms = new Message(api_key, api_secret);

         // 4 params(to, from, type, text) are mandatory. must be filled
         HashMap<String, String> params = new HashMap<String, String>();
         //누구에게 전송할 지
         params.put("to", user_phone_number);
         //등록한 발신 번호 작성
         params.put("from", "01071266849");
         //SMS 그대로 유지
         params.put("type", "SMS");
         //전송할 메세지
         params.put("text", "[테스트]\n임시 비밀번호: " + temp_pw + "\n노출될 수 있으니 반드시 비밀번호를 변경해 주세요.");
         //사용하고 있는 API 버전
         params.put("app_version", "JAVA SDK v2.2"); // application name and version
         System.out.println(temp_pw);
         
//         try {
//            //전송된 데이터를 JSON으로 변환하여 콘솔에 출력
//            JSONObject obj = (JSONObject) coolsms.send(params);
//            System.out.println(obj.toString());
//         } catch (CoolsmsException e) {
//            System.out.println(e.getMessage());
//            System.out.println(e.getCode());
//         }
         
         forward.setRedirect(true);
         forward.setPath(req.getContextPath() + "/app/user/changePassword.jsp");
       //  forward.setPath(req.getContextPath() + "/app/user/changePassword.jsp?user_id = " + user_id);
      }
      return forward;
   }
   
}