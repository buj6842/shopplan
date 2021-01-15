package com.shopplan.app.askboard.dao;

import java.util.Enumeration;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shopplan.app.askboard.vo.AskFilesVO;
import com.shopplan.mybatis.config.SqlMapConfig;
import com.oreilly.servlet.MultipartRequest;

public class AskFilesDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public AskFilesDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	public List<AskFilesVO> getDeatail(int askboard_num){
		return sqlsession.selectList("AskFiles.getDetail", askboard_num);
	}
	
	public boolean insertFiles(int askboard_num, MultipartRequest multi) {
		Enumeration<String> askfiles = multi.getFileNames();
		boolean check = true;
		
		AskFilesVO askfile = new AskFilesVO();
		askfile.setAskboard_num(askboard_num);
		
		while(askfiles.hasMoreElements()) {
			//사용자가 업로드한 파일명
			String data = askfiles.nextElement();
			//사용자가 업로드한 파일명을 통해서 중복이 없는 시스템파일명을 가져온다.
			String systemName = multi.getFilesystemName(data);
			
			//슬롯 별로 검사하여 null이 아닐 때에만 DB에 INSERT한다.
			if(systemName == null) {continue;}
			askfile.setAskfile_name(systemName);

			if(sqlsession.insert("AskFiles.insertAskFile", askfile) != 1) {
				//추가 실패 시 check에 false 대입.
				check = false;
				break;
			}
		}
		return check;
	}
	
	//첨부파일 삭제
	public void deleteAskFiles(int askboard_num) {
		sqlsession.delete("AskFiles.deleteAskFiles", askboard_num);
	}
}



















