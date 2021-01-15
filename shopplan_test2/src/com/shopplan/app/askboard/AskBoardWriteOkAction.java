package com.shopplan.app.askboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askboard.dao.AskBoardDAO;
import com.shopplan.app.askboard.dao.AskFilesDAO;
import com.shopplan.app.askboard.vo.AskBoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AskBoardWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		AskFilesDAO f_dao = new AskFilesDAO();
		AskBoardDAO b_dao = new AskBoardDAO();
		AskBoardVO b_vo = new AskBoardVO();
		//리눅스 서버에 프로젝트 업로드 시 아래의 경로를 사용해준다.
		//request.getServletContext().getRealPath("/") + "\\upload폴더명"
		//경로 바꿔야함
		String saveFolder = req.getServletContext().getRealPath("/") + "app/askupload";
		
		int fileSize = 5 * 1024 * 1024; // 5M
		
		//MultipartRequest를 사용하기 위해서는 WEB-INF/lib에 cos.jar를 반드시 추가해주어야 한다.
		//BuildPath에 넣지 않아도 된다!
		
		//메일 서버 객체(파일 업로드 및 다운로드)
		MultipartRequest multi = null;
		
		//외부에서 file type의 데이터가 전달된다면 MultipartRequest객체로 전달받아야 하고,
		//file type이 아니더라도 같이 전달된 데이터들도 마찬가지로 MultipartRequest로 처리해주어야 한다.
		
		//DefaultFileRenamePolicy : 파일 업로드 및 다운로드 정책(같은 이름이 존재하면 자동으로 이름이 변경되도록 한다).
		multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		b_vo.setAskboard_title(multi.getParameter("askboard_title"));
		b_vo.setAskboard_content(multi.getParameter("askboard_content"));
		b_vo.setAskboard_id(multi.getParameter("askboard_id"));
		
		//TBL_ASKBOARD 테이블에 게시글 추가
		if(b_dao.insertAskBoard(b_vo)) {
			//TBL_ASKFILES 테이블에 게시글 추가
			if(f_dao.insertFiles(b_dao.getAskBoardSeq(), multi)) {
				ActionForward forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() + "/askboard/AskBoardList.as");
				
				return forward;
			}
		}
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html;charset=utf-8");
		
		out.println("<script>");
		out.println("alert('게시글 등록 실패. 다시 시도해주세요.');");
		out.println("</script>");
		out.close();
		
		return null;
	}

}














