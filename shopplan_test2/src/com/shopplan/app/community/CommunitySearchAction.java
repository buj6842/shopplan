package com.shopplan.app.community;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.community.dao.CommunityDAO;
import com.shopplan.app.community.vo.CommunityVO;

public class CommunitySearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		//게시판dao
		CommunityDAO c_dao = new CommunityDAO();
		
		//parameter 값 category와 keyword의 값을받아온다
		String category = req.getParameter("category");
		String keyword = req.getParameter("keyword");
		
		//JSON 작성을위한부분
		PrintWriter out = resp.getWriter();
		JSONArray results = new JSONArray();
		
		//dao의 category와 keyword로 검색한 해당 게시글리스트를 리스트에 담아준다
		List<CommunityVO> resultList = c_dao.searchCommunity(category, keyword);
		
		//빠른for문을 이용하여 각게시글의 속성을 json에 담아준다
		for(CommunityVO c_vo : resultList) {
			JSONObject result = new JSONObject();
			result.put("community_num", c_vo.getCommunity_num());
			result.put("community_title", c_vo.getCommunity_title());
			result.put("community_id", c_vo.getCommunity_id());
			result.put("community_date", c_vo.getCommunity_date());
			result.put("readcount", c_vo.getReadcount());
			results.add(result);
		}
		out.println(results.toJSONString());
		out.close();		
		return null;
	}

}
