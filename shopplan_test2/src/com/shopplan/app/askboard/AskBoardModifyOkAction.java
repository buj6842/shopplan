package com.shopplan.app.askboard;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askboard.dao.AskBoardDAO;
import com.shopplan.app.askboard.dao.AskFilesDAO;
import com.shopplan.app.askboard.vo.AskBoardVO;
import com.shopplan.app.askboard.vo.AskFilesVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AskBoardModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		AskBoardDAO b_dao = new AskBoardDAO();
		AskFilesDAO f_dao = new AskFilesDAO();
		
		MultipartRequest multi = null;
		
		String saveFolder = req.getServletContext().getRealPath("/") + "app/askupload";
		int fileSize = 5 * 1024 * 1024;
		
		try {
			AskBoardVO b_vo = new AskBoardVO();
			multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			int askboard_num = Integer.parseInt(multi.getParameter("seq"));
			
			//업로드 폴더의 파일 삭제
			for(AskFilesVO askfile : f_dao.getDeatail(askboard_num)) {
				File f = new File(saveFolder, askfile.getAskfile_name());
				if(f.exists()) {
					f.delete();
				}
			}
			
			//기존 파일은 유지되지 않는다.
			
			//DB에서 삭제
			f_dao.deleteAskFiles(askboard_num);
			//새롭게 추가한 첨부파일 DB에 추가
			f_dao.insertFiles(askboard_num, multi);
			
			//수정된 게시글 제목과 내용, 게시글 번호 MODEL에 set
			b_vo.setAskboard_num(askboard_num);
			b_vo.setAskboard_title(multi.getParameter("askboard_title"));
			b_vo.setAskboard_content(multi.getParameter("askboard_content"));
			
			//게시글 수정
			b_dao.updateAskBoard(b_vo);
			
			forward = new ActionForward();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/askboard/AskBoardView.as?seq=" + askboard_num);
			
		} catch (Exception e) {
			//자바스크립트로 안내 메세지 응답
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('게시글 수정 실패. 다시 시도해주세요.')");
			out.println("</script>");
			out.close();
		}
		return forward;
	}
}















