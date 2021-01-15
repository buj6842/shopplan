package com.shopplan.app.askhelp.dao;

import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shopplan.app.askhelp.vo.AskhelpReplyVO;
import com.shopplan.app.askhelp.vo.AskhelpVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class AskhelpDAO {
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;
	
	public AskhelpDAO() {
		sql_session = sessionf.openSession(true);
	}
	

	public List<AskhelpVO> getAskhelpList(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		return sql_session.selectList("Askhelp.listAll", pageMap);
	}
	
	
	public AskhelpVO getDetail(int askhelp_num) {
		return sql_session.selectOne("Askhelp.getDetail", askhelp_num);
	}
	
	//total number of posts
	public int getAskhelpCnt() {
		return sql_session.selectOne("Askhelp.getAskhelpCnt");
	}

	//number of views
	public void updateReadCount(int askhelp_num) {
		sql_session.update("Askhelp.updateReadCount", askhelp_num);
	}
	
	//post number
	public int getAskhelpSeq() {
		return sql_session.selectOne("Askhelp.getSeq");
	}

	public boolean insertAskhelp(AskhelpVO askhelp) {
		return sql_session.insert("Askhelp.insertAskhelp", askhelp) == 1;
	}

	public void deleteBoard(int askhelp_num) {
		sql_session.delete("Askhelp.deleteBoard", askhelp_num);
	}

	public void updateAskhelp(AskhelpVO a_vo) {
		sql_session.update("Askhelp.updateAskhelp", a_vo);
	}
	
	public List<AskhelpReplyVO> getReplyList(int askhelp_num) {
		return sql_session.selectList("Askhelp.getReplyList", askhelp_num);
	}
	
	public boolean insertReply(AskhelpReplyVO r_vo) {
		return sql_session.insert("Askhelp.insertReply", r_vo) == 1;
	}

	public void deleteReply(int reply_num) {
		sql_session.delete("Askhelp.deleteReply", reply_num);
	}

	public void updateReply(AskhelpReplyVO r_vo) {
		sql_session.update("Askhelp.updateReply", r_vo);
	}

	public void deleteReplyAll(int askhelp_num) {
		sql_session.delete("Askhelp.deleteReplyAll", askhelp_num);
	}
	
	public List<AskhelpVO> searchAskhelp(String category, String keyword){
	      HashMap<String, String> searchList = new HashMap <>();
	      
	      searchList.put("category", category);
	      searchList.put("keyword", keyword);
	      
	      System.out.println("들어옴");
	      return sql_session.selectList("Askhelp.searchAskhelp", searchList);
	}
	   
}