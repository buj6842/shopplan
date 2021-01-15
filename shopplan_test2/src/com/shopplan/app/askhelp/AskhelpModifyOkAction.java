package com.shopplan.app.askhelp;

//import java.io.File;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;
import com.shopplan.app.askhelp.vo.AskhelpVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AskhelpModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		AskhelpDAO a_dao = new AskhelpDAO();
		//FilesDAO f_dao = new FilesDAO();
		String folder = req.getServletContext().getRealPath("/") + "app/askhelpupload";
		
		MultipartRequest multi = null;
		
		int fileSize = 5 * 1024 * 1024;
		
		try {
			AskhelpVO a_vo = new AskhelpVO();
			multi = new MultipartRequest(req, folder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			int board_num = Integer.parseInt(multi.getParameter("seq"));
			
			a_vo.setAskhelp_num(board_num);
			a_vo.setAskhelp_title(multi.getParameter("askhelp_title"));
			a_vo.setAskhelp_content(multi.getParameter("askhelp_content"));
			
			
			a_dao.updateAskhelp(a_vo);//******************************error checked
			
			forward = new ActionForward();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/askhelp/AskhelpView.he?seq=" + board_num);
			System.out.println("modify ok action");
			
		} catch (Exception e) {
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('수정 실패')");
			out.println("</script>");
			out.close();
		}
		return forward;
	}
}















