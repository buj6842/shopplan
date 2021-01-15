package com.shopplan.app.community.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shopplan.app.community.vo.CommunityReplyVO;
import com.shopplan.app.community.vo.CommunityVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class CommunityDAO {
	
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;
	
	public CommunityDAO() {
		//
		sql_session = sessionf.openSession(true);	
	}
	
	//페이지 별 게시글 목록
	public List<CommunityVO> getCommunityList(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap <>();
		
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		return sql_session.selectList("Community.listAll", pageMap);
	}
	
	//***게시글 번호로 해당 게시글 가져오기
		public CommunityVO getDetail(int community_num) {
			return sql_session.selectOne("Community.getDetail", community_num);
		}
	
	//게시글 검색하기
	public List<CommunityVO> searchCommunity(String category, String keyword){
		HashMap<String, String> searchList = new HashMap <>();
		
		searchList.put("category", category);
		searchList.put("keyword", keyword);
		
		return sql_session.selectList("Community.searchCommunity", searchList);
	}
	
	//게시글 갯수
	public int getCommunityCnt() {
		return sql_session.selectOne("Community.getCommunityCnt");
	}
	
	//글쓰기
	public boolean insertCommunity (CommunityVO community) {
		return sql_session.insert("Community.insertCommunity", community) ==1;
	}
	
	//시퀀스번호가져오기
	public int getCommuntitySeq() {
		return sql_session.selectOne("Community.getCommunitySeq");
	}
	
	//조회수
	public void updateReadCount(int community_num) {
		sql_session.update("Community.updateReadCount", community_num);
	}
	
	//게시글삭제
		public void deleteCommunity(int community_num) {
			sql_session.delete("Community.deleteCommunity", community_num);
		}
		
	//게시글 업데이트
		public void updateCommunity(CommunityVO c_vo) {
			sql_session.update("Community.updateCommunity", c_vo);
		}
		
	//댓글 등록
		public boolean insertCommunityReply(CommunityReplyVO r_vo) {
			return sql_session.update("Community.insertCommunityReply" , r_vo) ==1;
		}
	
	//댓글 전체 목록
		public List<CommunityReplyVO> getCommunityReplyList (int community_num){
			return sql_session.selectList("Community.getCommunityReplyList" , community_num);
		}
	//댓글 삭제 
		public void deleteCommunityReply(int community_reply_num) {
			sql_session.delete("Community.deleteCommunityReply" , community_reply_num);
		}
		
	//댓글 수정
		public void updateCommunityReply(CommunityReplyVO r_vo) {
			sql_session.update("Community.updateCommunityReply" , r_vo);
		}
		
	
}
