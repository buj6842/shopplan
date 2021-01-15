//페이지 별 게시글 목록
//다오에서 선언한 메소드는 액션(컨트롤러)에서 쓴다.
//페이징 처리는 컨트롤러에서

package com.shopplan.app.askboard.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shopplan.app.askboard.vo.AskBoardReplyVO;
import com.shopplan.app.askboard.vo.AskBoardVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class AskBoardDAO {
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public AskBoardDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	//페이지 별 게시글 목록
	public List<AskBoardVO> getAskBoardList(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		
		//xml써놓은 값이랑 똑같이 써야함
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		return sqlsession.selectList("AskBoard.listAll", pageMap);
	}
	
	//***게시글 번호로 해당 게시글 가져오기
	public AskBoardVO getDetail(int askboard_num) {
		return sqlsession.selectOne("AskBoard.getDetail", askboard_num);
	}
	
	//게시글 전체 개수
	public int getAskBoardCnt() {
		return sqlsession.selectOne("AskBoard.getAskBoardCnt");
	}
	
	//조회수
	public void updateReadCount(int askboard_num) {
		sqlsession.update("AskBoard.updateReadCount", askboard_num);
	}
	
	//게시글 번호
	public int getAskBoardSeq() {
		return sqlsession.selectOne("AskBoard.getAskSeq");
	}
	
	
	//게시글 추가
	public boolean insertAskBoard(AskBoardVO askboard) {
		return sqlsession.insert("AskBoard.insertAskBoard", askboard) == 1;
	}
	
	//게시글 삭제
	public void deleteAskBoard(int askboard_num) {
		sqlsession.delete("AskBoard.deleteAskBoard", askboard_num);
	}
	
	//게시판 수정(게시글 번호(기존), 게시글 제목(수정), 게시글 내용(수정))
	public void updateAskBoard(AskBoardVO b_vo) {
		sqlsession.update("AskBoard.updateAskBoard", b_vo);
	}
	
	/* 댓글 */
	
	//댓글 전체 목록
	public List<AskBoardReplyVO> getAskReplyList(int askboard_num) {
		return sqlsession.selectList("AskBoard.getAskReplyList", askboard_num);
	}
	
	//댓글 추가
	public boolean insertAskReply(AskBoardReplyVO r_vo) {
		return sqlsession.insert("AskBoard.insertAskReply", r_vo) == 1;
	}
	
	//댓글 삭제
	public void deleteAskReply(int askreply_num) {
		sqlsession.delete("AskBoard.deleteAskReply", askreply_num);
	}
	
	//댓글 수정
	public void updateAskReply(AskBoardReplyVO r_vo) {
		sqlsession.update("AskBoard.updateAskReply", r_vo);
	}
	
	//댓글 삭제
	public void deleteAskReplyAll(int askboard_num) {
		sqlsession.delete("AskBoard.deleteAskReplyAll", askboard_num);
	}
}
















