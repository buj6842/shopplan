package com.shopplan.app.askhelp;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.askhelp.dao.AskhelpDAO;
import com.shopplan.app.askhelp.vo.AskhelpVO;

public class AskhelpSearchAction implements Action {
	

	@Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
	  System.out.println("SearchAction in");
      req.setCharacterEncoding("UTF-8");

      AskhelpDAO a_dao = new AskhelpDAO();
      
      String category = req.getParameter("category");
      String keyword = req.getParameter("keyword");
      
      PrintWriter out = resp.getWriter();
      JSONArray results = new JSONArray();
      
      List<AskhelpVO> resultList = a_dao.searchAskhelp(category, keyword);
      
      for(AskhelpVO a_vo : resultList) {
         JSONObject result = new JSONObject();
         result.put("askhelp_num", a_vo.getAskhelp_num());
         result.put("askhelp_title", a_vo.getAskhelp_title());
         result.put("askhelp_id", a_vo.getAskhelp_id());
         result.put("askhelp_date", a_vo.getAskhelp_date());
         result.put("askhelp_readcount", a_vo.getReadCount());
         results.add(result);
      }
      out.println(results.toJSONString());
      out.close();      
      return null;
   }

}