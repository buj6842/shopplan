package com.shopplan.app.gallery;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.gallery.dao.GalleryDAO;
import com.shopplan.app.gallery.vo.GalleryVO;

public class GalleryMorevieAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		GalleryDAO g_dao = new 	GalleryDAO();
		int startRow = Integer.parseInt(req.getParameter("pageNum"));
		
		int endRow = startRow + 8;
		
		PrintWriter out = resp.getWriter();
		JSONArray moreviews = new JSONArray();
		
		List<GalleryVO> moreviewList = g_dao.getGalleryList(startRow, endRow);
			
		for(GalleryVO g_vo : moreviewList ) {
		 JSONObject moreview = new JSONObject();
		 moreview.put("gal_num", g_vo.getGal_num());
		 moreview.put("gal_buildingtype", g_vo.getGal_buildingtype());
		 moreview.put("gal_colortype", g_vo.getGal_colortype());
		 moreview.put("gal_roomtype", g_vo.getGal_roomtype());
		 moreview.put("gal_id", g_vo.getGal_id());
		 moreview.put("gal_date", g_vo.getGal_date());
		 moreview.put("gal_filepath", g_vo.getGal_filepath());
		 moreviews.add(moreview);
		}
		out.println(moreviews.toJSONString());
		out.close();
		return null;
	}

}
