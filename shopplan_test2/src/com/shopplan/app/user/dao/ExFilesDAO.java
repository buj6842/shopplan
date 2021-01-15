package com.shopplan.app.user.dao;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.oreilly.servlet.MultipartRequest;
import com.shopplan.app.user.vo.ExFilesVO;
import com.shopplan.app.user.vo.ExpertVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class ExFilesDAO {
	
	private static final int KEY = 3;
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;
	
	public ExFilesDAO() {
		sql_session = sessionf.openSession(true);
	}
	
	public List<ExFilesVO> getDetail(int ex_num){
		return sql_session.selectList("ExFiles.getDetail", ex_num);
	}
	
	public boolean insertExFiles(int ex_num , MultipartRequest multi) {
		Enumeration<String> files = multi.getFileNames();
		boolean check = true;
		
		ExFilesVO exf_vo = new ExFilesVO();
		exf_vo.setEx_num(ex_num);
		
		while(files.hasMoreElements()) {
			//업로드파일명
			String data = files.nextElement();
			//시스템파일명으로 중복검사
			String systemName = multi.getFilesystemName(data);
			
			//null아닐때 DB에 insert
			if(systemName == null) {continue;}
			exf_vo.setFile_name_ex(systemName);
			
			if(sql_session.insert("ExFiles.insertExFiles", exf_vo) != 1) {
				check = false;
				break;
			}
		}
		return check;
	}
	
	//첨부파일 삭제
	public void deleteExFiles(int ex_num) {
		sql_session.delete("ExFiles.deleteExFiles", ex_num);
	}

}	




































