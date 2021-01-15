package com.shopplan.app.community;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;
import com.shopplan.app.community.dao.CommunityFilesDAO;
import com.shopplan.app.community.vo.CommunityFilesVO;

public class CommunityDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		CommunityDAO c_dao = new CommunityDAO();
		CommunityFilesDAO f_dao = new CommunityFilesDAO();
		
		ActionForward forward = new ActionForward();
		
		String saveFolder = "C:\\Users\\USER\\Desktop\\web\\JSP\\workspace\\shopplan_test\\WebContent\\app\\communityupload";
		
		//input type = hidden에 있는 seq네임의 파라미터 가져오기
		int community_num = Integer.parseInt(req.getParameter("seq"));
		//파일 삭제 (경로에 있는 파일을 삭제)
		for(CommunityFilesVO file : f_dao.getDetail(community_num)) {
			File f = new File(saveFolder +"\\" + file.getCommunity_file_name());
			//값의 유무검사 후 삭제
			if(f.exists()) {
				f.delete();
			}
		}
		//파일 삭제 (DB삭제)
		f_dao.deleteFiles(community_num);
		
		//게시글 삭제
		c_dao.deleteCommunity(community_num);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/community/CommunityList.ct");

		return forward;
	}

}
