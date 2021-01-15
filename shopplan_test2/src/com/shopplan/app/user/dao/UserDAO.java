package com.shopplan.app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shopplan.app.user.vo.UserVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class UserDAO {
	
	private static final int KEY = 3;
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;
	
	public UserDAO() {
		sql_session = sessionf.openSession(true);
	}
	
	//회원가입
	public boolean join(UserVO user) {
		user.setUser_pw(encrypt(user.getUser_pw()));
		return sql_session.insert("User.join", user) == 1;
	}
	
	
	//아이디 중복검사
	public boolean checkId(String user_id) {
		return (Integer)sql_session.selectOne("User.checkId", user_id) > 0;
	}
	
	//로그인
	public boolean login(String user_id, String user_pw) {
		HashMap<String, String> user = new HashMap<>();
		
		user.put("user_id", user_id);
		user.put("user_pw", encrypt(user_pw));
		
		return(Integer)sql_session.selectOne("User.login", user) == 1;
	}
	
	//암호화

	public String encrypt(String pw) {
		String en_pw ="";
		for (int i = 0; i < pw.length(); i++) {
			en_pw +=(char)(pw.charAt(i) * KEY);
		}
		return en_pw;
	}
	
	//복호화
	public String decrypt(String en_pw) {
		String de_pw ="";
		for (int i = 0; i < en_pw.length(); i++) {
			de_pw +=(char)(en_pw.charAt(i) / KEY);
		}
		return de_pw;
	}
	
	//개인정보 수정하기
	public void updateUser(UserVO user) {
		sql_session.update("User.updateUser", user);
	}
	
	//user id로 user객체 전부가져오기
	public UserVO getUserDetail(String user_id) {
		return sql_session.selectOne("User.getUserDetail", user_id);
	}
	
	//아이디찾기
	public String findId(String user_name, String user_phone_number) {
		HashMap<String, String> user = new HashMap<>();
		
		user.put("user_name", user_name);
		user.put("user_phone_number", user_phone_number);

		return sql_session.selectOne("User.findId", user);
	}
	
	
	 //pw찾기
	 public String findPw(String user_id, String user_phone_number) {
		    HashMap<String, String> user = new HashMap<>();
		         
		    user.put("user_id", user_id);
		    user.put("user_phone_number", user_phone_number);
		    //복호화
		    return decrypt(sql_session.selectOne("User.findPw", user));
		   
		}
	
	 //pw - 임시비밀번호받기
	 public void changePw( String user_id , String temp_pw) {
         
         HashMap< String , String > user = new HashMap<>();
         user.put("user_id", user_id);
         user.put("user_pw", encrypt(temp_pw));
         
        sql_session.update("User.changePw", user);
        }
	 
	 // 임시비밀번호로 pw변경
	 public String reFindPw( String user_id, String temp_pw , String new_pw ) {
		    HashMap<String, String > user = new HashMap<>();
		         
		     user.put("user_id", user_id);
		     user.put("user_pw",  encrypt(temp_pw));
		     user.put("user_pw",  encrypt(new_pw));
		     
		    return sql_session.selectOne("User.reFindPw", user);
		   
		}
	 
	 //reChangePw 임시비밀번호로 비밀번호 업데이트
	 
	 public void reChangePw(String user_id,String new_pw ) {
			 
			 HashMap< String, String> user = new HashMap<>();
			 user.put("user_id", user_id);
			 user.put("user_pw",  encrypt(new_pw));
		
			 sql_session.update("User.reChangePw", user);
			 }


}






















