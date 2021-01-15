package com.shopplan.app.expert;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExFilesDAO;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.vo.ExFilesVO;
import com.shopplan.app.user.vo.ExpertVO;

public class ExpertModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		ActionForward forward = null;

		//ExpertDAO e_dao = new ExpertDAO();
		ExFilesDAO exf_dao = new ExFilesDAO();

		MultipartRequest multi = null;

		String saveFolder = req.getServletContext().getRealPath("/") + "app/upload_ex";
		int fileSize = 5 * 1024 * 1024;
		
		try {
			ExFilesVO exf_vo = new ExFilesVO();
			//ExpertVO e_vo = new ExpertVO();
			multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			int ex_num = Integer.parseInt(multi.getParameter("ex_num"));
			
			
			for (ExFilesVO file_ex : exf_dao.getDetail(ex_num)) {
				File f = new File(saveFolder + "\\" + file_ex.getFile_name_ex());
				// 값의 유무 검사 + 삭제
				if (f.exists()) {
					f.delete();
				}
			}
			// DB에서 삭제
			exf_dao.deleteExFiles(ex_num);
			System.out.println("파일db삭제:" + ex_num);
			
			//새롭게 추가한 첨부파일 DB에 추가
			exf_dao.insertExFiles(ex_num, multi);
			System.out.println("DB에 추가" + ex_num);
		

			//수정된 파일 제목과 번호에 set
			/*exf_vo.setEx_num(ex_num);
			exf_vo.setFile_name_ex(multi.getParameter("file_name_ex"));
			System.out.println(exf_vo.getFile_name_ex());*/

			// 파일 수정
			//exf_dao.updateModi(exf_vo);
			//System.out.println("연습출력2");
			
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/expert/ExpertUpdate.ex");
		

		} catch (Exception e) {
			// 자바스크립트로 안내 메세지 응답
			System.out.println(e.getMessage());
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('파일 수정 실패. 다시 시도해주세요.')");
			out.println("</script>");
			out.close();
		}
		return forward;
	}
}
