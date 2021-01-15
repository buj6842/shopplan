package com.shopplan.app.expert;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopplan.action.Action;
import com.shopplan.action.ActionForward;

public class FileDownloadAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String savePath = req.getServletContext().getRealPath("/") + "app/upload_ex";
		
		String file_name = req.getParameter("file_name");
		
		PrintWriter writer = resp.getWriter();
		
		InputStream in = null;
		
		OutputStream out = null;
		
		File file = null;
		
		boolean check = true;
		
		try {
			file = new File(savePath, file_name);
			in = new FileInputStream(file);
			
		} catch (FileNotFoundException e) {
			check = false;
			System.out.println(e+"FileDownload.java 오류");
		}
		
		String client = req.getHeader("User-Agent");
		
		resp.reset();
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Description", "JSP Generated Data");
		
		
		if(check) {
			try {
			file_name = new String(file_name.getBytes("UTF-8"),"ISO-8859-1");
			
			if(client.indexOf("MSIE") != -1) {
				resp.setHeader("Content-Disposition","attachment;filename="+file_name);
			}else {
				resp.setHeader("Content-Disposition","attachment;filename=\""+file_name+"\"");
				resp.setHeader("Content-Type","application/octet-stream;charset=utf-8");
			}
			
			resp.setHeader("Content-Length", "" + file.length());
			
			writer.flush();
			
			out = resp.getOutputStream();
			
			//해당 파일의 길이만큼 byte배열을 선언한다.
			//5M 파일이라면 file.length는 5 * 1024 * 1024이다.
			byte b[] = new byte[(int)(file.length())];
			
			int len = 0;
			
			while((len = in.read(b)) > 0) {
				out.write(b, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(in != null) {
					in.close();
				}
				if(out != null) {
					out.close();
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	return null;
}
	
	
}























