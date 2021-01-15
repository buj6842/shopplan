package com.shopplan.app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.shopplan.app.user.vo.ExpertVO;
import com.shopplan.app.user.vo.UserVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class ExpertDAO {
	
	private static final int KEY = 3;
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;
	
	public ExpertDAO() {
		sql_session = sessionf.openSession(true);
	}
	
	//회원가입 파일등록
	public boolean exjoin(ExpertVO ex) {
		ex.setEx_pw(encrypt(ex.getEx_pw()));
		return sql_session.insert("Expert.exjoin", ex) == 1;
	}
	
	//아이디 중복검사
	public boolean checkExId(String ex_id) {
		return (Integer)sql_session.selectOne("Expert.checkExId", ex_id ) > 0;
	}
	
	
	//
		public int getSeq_ex() {
			return sql_session.selectOne("Expert.getSeq_ex");
		}
		
	
	
	//로그인
	public boolean loginEx(String ex_id, String ex_pw) {
		HashMap<String, String> ex = new HashMap<>();
		
		ex.put("ex_id", ex_id);
		ex.put("ex_pw", encrypt(ex_pw));
		
		return(Integer)sql_session.selectOne("Expert.loginEx", ex) == 1;
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
	
	
	//마이페이지 업데이트
	public void updateEx(ExpertVO ex) {
		sql_session.update("Expert.updateEx", ex);
	}

	//마이페이지 파일정보가져오기
	public ExpertVO getExDetail(String ex_id) {
		return sql_session.selectOne("Expert.getExDetail", ex_id);
	}
	//첨부삭제
	public void deleteEx(int ex_num) {
		sql_session.delete("Expert.deleteEx", ex_num);
	}

	public ExpertVO getDetail(int ex_num) {
		return sql_session.selectOne("Expert.getDetail", ex_num);
	}
	
	
	public String exfindId(String ex_name, String ex_phone_num) {
		HashMap<String, String> ex = new HashMap<>();
		ex.put("ex_name", ex_name);
		ex.put("ex_phone_num", ex_phone_num);

		return sql_session.selectOne("Expert.exfindId", ex);
	}

	public String exfindPw(String ex_id, String ex_phone_num) {
		    HashMap<String, String> ex = new HashMap<>();
		         
		    ex.put("ex_id", ex_id);
		    ex.put("ex_phone_num", ex_phone_num);
		    //복호화
		    return decrypt(sql_session.selectOne("Expert.exfindPw", ex));
		   
		}
	
	public void exChangePw( String ex_id , String temp_pw) {
        
        HashMap< String , String > ex = new HashMap<>();
        ex.put("ex_id", ex_id);
        ex.put("ex_pw", encrypt(temp_pw));
        
       sql_session.update("Expert.exChangePw", ex);
       }
	
	 public String reFindPwEx( String ex_id, String temp_pw , String new_pw ) {
		    HashMap<String, String > ex = new HashMap<>();
		         
		    ex.put("ex_id", ex_id);
		    ex.put("ex_pw",  encrypt(temp_pw));
		    ex.put("ex_pw",  encrypt(new_pw));
		     
		    return sql_session.selectOne("Expert.reFindPwEx", ex);
		   
		}
	 
	 public void reChangePwEx(String ex_id,String new_pw ) {
		 
		 HashMap< String, String> ex = new HashMap<>();
		 ex.put("ex_id", ex_id);
		 ex.put("ex_pw",  encrypt(new_pw));
		 sql_session.update("Expert.reChangePwEx", ex);
		 }
}	

























