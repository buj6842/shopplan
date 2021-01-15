package com.shopplan.app.community;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;
import com.shopplan.app.community.dao.CommunityFilesDAO;
import com.shopplan.app.community.vo.CommunityFilesVO;
import com.shopplan.app.community.vo.CommunityVO;

public class CommunityModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		MultipartRequest multi = null;

		CommunityFilesDAO f_dao = new CommunityFilesDAO();
		CommunityDAO c_dao = new CommunityDAO();
		String saveFolder =req.getServletContext().getRealPath("/") + "app/communityupload";
		int fileSize = 20 * 1024 * 1024;// 20M
		
		try {
			CommunityVO c_vo = new CommunityVO();
			
			multi = new MultipartRequest(req, saveFolder, fileSize,"UTF-8", new DefaultFileRenamePolicy());
			int community_num = Integer.parseInt(multi.getParameter("seq"));
			
			//기존파일 삭제
			for(CommunityFilesVO file : f_dao.getDetail(community_num)) {
				File f = new File(saveFolder, file.getCommunity_file_name());
				if(f.exists()) {
					f.delete();
				}
			}
			
			//db에서 삭제
			f_dao.deleteFiles(community_num);
			//새롭게 추가한 첨부파일 db에 추가
			f_dao.insertCommunityFiles(community_num, multi);
			
			c_vo.setCommunity_num(community_num);
			c_vo.setCommunity_title(multi.getParameter("community_title"));
			c_vo.setCommunity_content(multi.getParameter("community_content"));
			
			c_dao.updateCommunity(c_vo);
			
			forward = new ActionForward();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/community/CommunityView.ct?seq=" + community_num);
		} catch (Exception e) {
			
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html);charset = utf-8");
			
			out.println("<script>");
			out.println("alert('게시글 등록 실패. 다시 시도해주세요.');");
			out.println("</script>");
			out.close();
			
		}
		return forward;
		
		
		
	}

}
