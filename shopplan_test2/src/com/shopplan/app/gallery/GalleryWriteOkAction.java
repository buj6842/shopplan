package com.shopplan.app.gallery;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.gallery.dao.GalleryDAO;
import com.shopplan.app.gallery.dao.GalleryFilesDAO;
import com.shopplan.app.gallery.vo.GalleryVO;

public class GalleryWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");	
		resp.setCharacterEncoding("UTF-8");	
		GalleryFilesDAO f_dao = new GalleryFilesDAO();
		GalleryDAO g_dao = new GalleryDAO();
		GalleryVO g_vo = new GalleryVO();
		String saveFolder = req.getServletContext().getRealPath("/") + "\\app\\galleryupload";
		
		int fileSize = 20 * 1024 * 1024;// 20M
		
		//메일서버 객체 (파일 업로드 및 다운로드)
		MultipartRequest multi = null;
		multi = new MultipartRequest(req, saveFolder, fileSize,"UTF-8", new DefaultFileRenamePolicy());
        String gal_filepath = new String((multi.getParameter("gal_filepath")).getBytes("8859_1"),"UTF-8");
		
		g_vo.setGal_id(multi.getParameter("gal_id"));
		g_vo.setGal_buildingtype(multi.getParameter("gal_buildingtype"));
		g_vo.setGal_roomtype(multi.getParameter("gal_roomtype"));
		g_vo.setGal_colortype(multi.getParameter("gal_colortype"));
		g_vo.setGal_filepath(gal_filepath);
		// tbl_gal에에 게시글 추가
		if(g_dao.insertBoard(g_vo)) {
		// 파일 테이블에 게시글 추가
			if(f_dao.insertGalleryFiles(g_dao.getGallerySeq(), multi)) {
				ActionForward forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() + "/gallery/GalleryView.ga");
				return forward;
			}
		}	
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html);charset = utf-8");
		
		out.println("<script>");
		out.println("alert('게시글 등록 실패. 다시 시도해주세요.');");
		out.println("</script>");
		out.close();
		
		return null;
		
	}

}
