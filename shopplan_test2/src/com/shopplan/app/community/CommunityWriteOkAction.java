package com.shopplan.app.community;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;
import com.shopplan.app.community.dao.CommunityFilesDAO;
import com.shopplan.app.community.vo.CommunityVO;

public class CommunityWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CommunityFilesDAO f_dao = new CommunityFilesDAO();
		CommunityDAO c_dao = new CommunityDAO();
		CommunityVO c_vo = new CommunityVO();
		String saveFolder = req.getServletContext().getRealPath("/") + "app/communityupload";
		
		int fileSize = 20 * 1024 * 1024;// 20M
		
		//메일서버 객체 (파일 업로드 및 다운로드)
		MultipartRequest multi = null;
		multi = new MultipartRequest(req, saveFolder, fileSize,"UTF-8", new DefaultFileRenamePolicy());
		
		c_vo.setCommunity_title(multi.getParameter("community_title"));
		c_vo.setCommunity_content(multi.getParameter("community_content"));
		c_vo.setCommunity_id(multi.getParameter("community_id"));
		
		
		// tbl_community에에 게시글 추가
		if(c_dao.insertCommunity(c_vo)) {
		// 파일 테이블에 게시글 추가
			if(f_dao.insertCommunityFiles(c_dao.getCommuntitySeq(), multi)) {
				ActionForward forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() + "/community/CommunityList.ct");
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
