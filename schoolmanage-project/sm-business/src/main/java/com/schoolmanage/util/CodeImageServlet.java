package com.schoolmanage.util;

import java.awt.image.BufferedImage;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


@SuppressWarnings("serial")
public class CodeImageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(GlobalsConstUtil.CHARACTER_ENCODING);
		//response.setCharacterEncoding(GlobalsConstUtil.CHARACTER_ENCODING);
		response.setContentType("text/html; charset="
				+ GlobalsConstUtil.CHARACTER_ENCODING);
		response.setContentType("image/jpeg");//�����������������ʾ��һ��ͼƬ
		response.addHeader("pragma", "NO-cache");
		response.addHeader("Cache-Control", "no-cache");//�����л���
		response.addDateHeader("Expries", 0);
		VerifyCode vCode = new VerifyCode();
		
		String random = vCode.runVerifyCode(4);
		
		BufferedImage image = vCode.CreateImage(random);
		HttpSession session = request.getSession(true);
	
		session.setAttribute(GlobalsConstUtil.VALIDATE_CODE, random);
		
		ServletOutputStream outStream = response.getOutputStream();
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(outStream);
		encoder.encode(image);
		outStream.flush();
		image.flush();
		outStream.close();
	}
}
