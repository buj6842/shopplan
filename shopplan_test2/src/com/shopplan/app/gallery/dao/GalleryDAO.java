package com.shopplan.app.gallery.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shopplan.app.gallery.vo.GalleryVO;
import com.shopplan.mybatis.config.SqlMapConfig;

public class GalleryDAO {
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sql_session;
	
	public GalleryDAO() {
		//
		sql_session = sessionf.openSession(true);
	}
	
	//페이지 별 게시글 목록
	public void getGalint(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap <>();
	}
	
	//글쓰기
	public boolean insertBoard (GalleryVO gallery) {
		return sql_session.insert("Gallery.insertGallery", gallery) ==1;
	}
	
	//시퀀스번호가져오기
	public int getGallerySeq() {
		return sql_session.selectOne("Gallery.getGallerySeq");
	}
	
	public int getGalleryCnt() {
		return sql_session.selectOne("Gallery.getGalleryCnt");
	}
	
	public List<GalleryVO> getGalleryList(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap <>();
		
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		return sql_session.selectList("Gallery.listAll", pageMap);
	}
	//내용가져오기
	
	public GalleryVO getGalleryDetail(int gal_num) {
		return sql_session.selectOne("Gallery.getGalleryDetail", gal_num);
	}
	//삭제
	
	//수정
	
	// 건물유형, 방유형, 색유형으로 검색하기
	
	public List<GalleryVO> searchGallery(String gal_buildingtype,String gal_roomtype,String gal_colortype) {
		HashMap<String, String> search = new HashMap <>();
		search.put("gal_buildingtype", gal_buildingtype);
		search.put("gal_roomtype", gal_roomtype);
		search.put("gal_colortype", gal_colortype);
		return sql_session.selectList("Gallery.searchGallery", search);
	}
	
}

