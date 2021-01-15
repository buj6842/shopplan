package com.shopplan.app.askhelp;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;
import com.shopplan.app.askhelp.vo.AskhelpVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AskhelpWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		AskhelpDAO a_dao = new AskhelpDAO();
		AskhelpVO a_vo = new AskhelpVO();
		int fileSize = 5 * 1024 * 1024; // 5M 
		
		String folder = req.getServletContext().getRealPath("/") + "app/askhelpupload";
		MultipartRequest multi = null;
		
		
//		multi = new MultipartRequest(req, "UTF-8");
		multi = new MultipartRequest(req, folder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
//		multi = new MultipartRequest(req, "UTF-8", fileSize, new DefaultFileRenamePolicy());
		a_vo.setAskhelp_title(multi.getParameter("askhelp_title"));
		a_vo.setAskhelp_content(multi.getParameter("askhelp_content"));
		a_vo.setAskhelp_id(multi.getParameter("askhelp_id"));
		

		if(a_dao.insertAskhelp(a_vo)) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/askhelp/AskhelpList.he");
				
			return forward;
			
		}
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html;charset=utf-8");
		
		out.println("<script>");
		out.println("alert('�Խñ� ��Ͽ� �����߽��ϴ�.');");
		out.println("</script>");
		out.close();
		
		return null;
	}

}














