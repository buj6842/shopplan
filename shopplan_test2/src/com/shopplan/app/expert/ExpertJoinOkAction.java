package com.shopplan.app.expert;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.user.dao.ExFilesDAO;
import com.shopplan.app.user.dao.ExpertDAO;
import com.shopplan.app.user.dao.UserDAO;
import com.shopplan.app.user.vo.ExpertVO;
import com.shopplan.app.user.vo.UserVO;

public class ExpertJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		//ActionForward forward = null;
		ExpertDAO e_dao = new ExpertDAO();
		ExpertVO e_vo = new ExpertVO();
		ExFilesDAO exf_dao = new ExFilesDAO();
		
		//request.getServletContext().getRealPath("/")+"\\upload폴더명
		String saveFolder = req.getServletContext().getRealPath("/") + "app/upload_ex";
		
		int fileSize = 5 * 1024 * 1024;
		
		//파일업로드 다운로드
		MultipartRequest multi = null;
		multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		//System.out.println("파일들어옴");
		
		e_vo.setEx_id(multi.getParameter("ex_id"));
		e_vo.setEx_pw(multi.getParameter("ex_pw"));
		e_vo.setEx_name(multi.getParameter("ex_name"));
		e_vo.setEx_expert_name(multi.getParameter("ex_expert_name"));
		e_vo.setEx_phone_num(multi.getParameter("ex_phone_num"));
		e_vo.setEx_email(multi.getParameter("ex_email"));
		e_vo.setEx_gender(multi.getParameter("ex_gender"));
		e_vo.setEx_zipcode(multi.getParameter("ex_zipcode"));
		e_vo.setEx_address(multi.getParameter("ex_address"));
		e_vo.setEx_address_detail(multi.getParameter("ex_address_detail"));
		e_vo.setEx_address_etc(multi.getParameter("ex_address_etc"));
		
		
		//회원가입메소드사용
		if(e_dao.exjoin(e_vo)) {
			//전문가파일 db에 넣는메소드 사용
			if(exf_dao.insertExFiles(e_dao.getSeq_ex(), multi)) {
				ActionForward forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() + "/expert/ExpertLogin.ex");
				return forward;
			}
		}
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html;charset=utf-8");
		
		out.println("<script>");
		out.println("alert('파일 등록 실패. 다시 시도해 주세요.');");
		out.println("</script>");
		out.close();
	
		return null;
	}
}



	
	























