package com.shopplan.app.gallery.dao;

import java.util.Enumeration;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.oreilly.servlet.MultipartRequest;
import com.shopplan.app.gallery.vo.GalleryFilesVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class GalleryFilesDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;
	
	public GalleryFilesDAO() {
		sql_session = sessionf.openSession(true);
	}
	
	public boolean insertGalleryFiles(int gal_num, MultipartRequest multi) {
		Enumeration<String> files = multi.getFileNames();
		boolean check = true;
		GalleryFilesVO galFile = new GalleryFilesVO();
		galFile.setGal_num(gal_num);
	
		while(files.hasMoreElements()) {
			//사용자가 업로드한 파일명
			String data = files.nextElement();
			String systemName = multi.getFilesystemName(data);
		
			galFile.setGal_file_name(systemName);
			
			if(sql_session.insert("GalleryFiles.insertFile", galFile) != 1){
				check = false;
				break;
			}
		}
		return check;
	}
	
	public List<GalleryFilesVO> getDetail(int gal_num){
		return sql_session.selectList("GalleryFiles.getDetail", gal_num);
	}
}
