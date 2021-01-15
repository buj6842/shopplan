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
import com.shopplan.app.gallery.dao.GalleryFilesDAO;
import com.shopplan.app.gallery.vo.GalleryVO;

public class GallerySeachAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		GalleryDAO g_dao = new GalleryDAO();
		
		
		String gal_buildingtype = req.getParameter("gal_buildingtype");
		String gal_roomtype = req.getParameter("gal_roomtype");
		String gal_colortype = req.getParameter("gal_colortype");
		PrintWriter out = resp.getWriter();
		JSONArray results = new JSONArray();
		
		List<GalleryVO> resultList = g_dao.searchGallery(gal_buildingtype, gal_roomtype, gal_colortype);
		
		for(GalleryVO g_vo : resultList ) {
		JSONObject result = new JSONObject();
		result.put("gal_num", g_vo.getGal_num());
		result.put("gal_buildingtype", g_vo.getGal_buildingtype());
		result.put("gal_colortype", g_vo.getGal_colortype());
		result.put("gal_roomtype", g_vo.getGal_roomtype());
		result.put("gal_id", g_vo.getGal_id());
		result.put("gal_date", g_vo.getGal_date());
		result.put("gal_filepath", g_vo.getGal_filepath());
		results.add(result);	
		}
		out.println(results.toJSONString());
		out.close();
		return null;
	}

}
