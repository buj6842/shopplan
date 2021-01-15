package com.shopplan.app.expert;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExFilesDAO;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.vo.ExFilesVO;
import com.shopplan.app.user.vo.ExpertVO;

public class ExpertDeleteOKAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ExpertDAO e_dao = new ExpertDAO();
		ExFilesDAO exf_dao = new ExFilesDAO();
		ExFilesVO exf_vo = new ExFilesVO();
		ExpertVO e_vo = new ExpertVO();
	
		HttpSession session = req.getSession();
		String ex_id = session.getAttribute("session_ex_id").toString();
		e_vo = e_dao.getExDetail(ex_id);
		
		String saveFolder = "C:\\Users\\^^\\Desktop\\Web_1530_lsh\\jsp2\\workspace\\shopplan_test\\WebContent\\app\\upload_ex";
		
		int ex_num = Integer.parseInt(req.getParameter("ex_num"));
			
		//외부에서 form태그에있는 name값 
		String file = exf_vo.getFile_name_ex();
			
		
		// 파일 삭제(upload 경로 파일 삭제)
		for (ExFilesVO file_ex : exf_dao.getDetail(ex_num)) {
			
		//File f = new File(saveFolder, file_ex.getFile_name_ex());
		File f = new File(saveFolder + "\\" + file_ex.getFile_name_ex());
			// 값의 유무 검사 + 삭제
			if (f.exists()) {
				f.delete();
			}
		}
		//파일 삭제(DB 테이블에 있는 파일 삭제)
		exf_dao.deleteExFiles(ex_num);
		
		
		//삭제후 다시 회원정보셋팅
		if(e_vo != null) {
			req.setAttribute("exBean", e_vo);
		
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/expert/expageForm.jsp");
			return forward;
		}
		return null;

		//게시글 삭제이지만 난 게시글이 아니고 회원번호이니까 삭제 안하는게 맞지않나?
		//e_dao.deleteEx(ex_num);
		//forward.setRedirect(true);                 
		//forward.setPath(req.getContextPath() + "/app/expert/expageForm.jsp");
		
		//return forward;
	}

}
