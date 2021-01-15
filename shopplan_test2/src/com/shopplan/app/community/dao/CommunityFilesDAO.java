package com.shopplan.app.community.dao;

import java.util.Enumeration;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.oreilly.servlet.MultipartRequest;
import com.shopplan.app.community.vo.CommunityFilesVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class CommunityFilesDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;
	
	public CommunityFilesDAO() {
		sql_session = sessionf.openSession(true);
	}
	
	public List<CommunityFilesVO> getDetail(int community_num){
		return sql_session.selectList("CommunityFiles.getDetail", community_num);
	}
	
	public boolean insertCommunityFiles(int community_num, MultipartRequest multi) {
		Enumeration<String> files = multi.getFileNames();
		boolean check = true;
		CommunityFilesVO communityFile = new CommunityFilesVO();
		communityFile.setCommunity_num(community_num);
	
		while(files.hasMoreElements()) {
			//사용자가 업로드한 파일명
			String data = files.nextElement();
			String systemName = multi.getFilesystemName(data);
			if(systemName == null) {continue;} //첨부파일슬롯이3개인데 순서대로가아니라 null이있으면 진행하지말고 밑으로그냥내려가라
			communityFile.setCommunity_file_name(systemName); 
			if(sql_session.insert("CommunityFiles.insertFiles", communityFile) != 1){
				check = false;
				break;
			}
		}
		return check;
	}
	
	public void deleteFiles(int community_num) {
		sql_session.delete("CommunityFiles.deleteFiles", community_num);
	}
}
