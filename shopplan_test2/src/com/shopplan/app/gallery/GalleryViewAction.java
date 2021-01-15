package com.shopplan.app.gallery;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;
import com.shopplan.app.gallery.dao.GalleryDAO;
import com.shopplan.app.gallery.dao.GalleryFilesDAO;
import com.shopplan.app.gallery.vo.GalleryFilesVO;
import com.shopplan.app.gallery.vo.GalleryVO;

public class GalleryViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		GalleryFilesDAO f_dao = new GalleryFilesDAO();
		GalleryDAO g_dao = new GalleryDAO();
		List<GalleryVO>  list_vo  = null;
		
		String gal_buildingtype = req.getParameter("gal_buildingtype");
		String gal_roomtype 	= req.getParameter("gal_roomtype");
		String gal_colortype 	= req.getParameter("gal_colortype ");
		
		
		list_vo = g_dao.searchGallery(gal_buildingtype, gal_roomtype, gal_colortype);
		
		if(list_vo != null) {
			req.setAttribute("listBean", list_vo); //리스트를 bean으로받아온다.
			
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); 
		forward.setPath("/app/gallery/gallery_search.jsp");
		return forward;
	}

}
