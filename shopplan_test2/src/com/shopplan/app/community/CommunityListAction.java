package com.shopplan.app.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;

public class CommunityListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		CommunityDAO c_dao = new CommunityDAO();
		
		String temp = req.getParameter("page");
		
		//요청한 페이지가 없으면 default값으로 1페이지를 응답해주고, 요청한 페이지가 있다면 해당 페이지로 응답해 준다.
		int page = temp == null? 1 : Integer.parseInt(temp);
		
		//한페이지당 10개의 게시글이 보이도록 설정
		int pageSize = 10;
		
		//한 페이지에서 가장 마지막 행 번호
		int endRow = page * pageSize;
		
		//한 페이지에서 가장 첫번째 글번호
		int startRow = endRow - (pageSize - 1);
		
		int totalCnt = c_dao.getCommunityCnt();
		
		//10의 배수로
		int startPage = ((page - 1) /pageSize) * pageSize + 1;
		int endPage = startPage + 9;
		
		int realEndPage = (totalCnt -1) / pageSize + 1;
	
		endPage = endPage > realEndPage ? realEndPage : endPage;
		//페이징 처리
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("communityList", c_dao.getCommunityList(startRow, endRow));
		
		forward.setRedirect(false);
		forward.setPath("/app/community/community.jsp");
		
		return forward;
	}

}
