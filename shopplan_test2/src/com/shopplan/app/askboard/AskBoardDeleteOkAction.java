package com.shopplan.app.askboard;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askboard.dao.AskBoardDAO;
import com.shopplan.app.askboard.dao.AskFilesDAO;
import com.shopplan.app.askboard.vo.AskFilesVO;

public class AskBoardDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		AskBoardDAO b_dao = new AskBoardDAO();
		AskFilesDAO f_dao = new AskFilesDAO();
		
		ActionForward forward = new ActionForward();
		
		String saveFolder = "C:\\web_psa\\jsp\\workspace\\shopplan_test\\WebContent\\app\\askupload";
		
		int askboard_num = Integer.parseInt(req.getParameter("seq"));
		
		//파일 삭제(upload 경로 파일 삭제)
		//수정 삭제하기전엔 반드시 파일이있는가 없는가 검사부터해야함
		for(AskFilesVO askfile : f_dao.getDeatail(askboard_num)) {
//			File f = new File(saveFolder, file.getFile_name());
			File f = new File(saveFolder + "\\" + askfile.getAskfile_name());
			//값의 유무 검사 + 삭제
			if(f.exists()) {
				f.delete();
			}
		}
		
		//파일 삭제(DB 테이블에 있는 파일 삭제)
		f_dao.deleteAskFiles(askboard_num);
			
		//댓글 전체삭제
		b_dao.deleteAskReplyAll(askboard_num);
		//게시글 삭제
		b_dao.deleteAskBoard(askboard_num);

		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/askboard/AskBoardList.as");
		
		return forward;
	}

}











