package com.controller.admin.management.product;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/public/*")
public class PublicResourcesController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String uploadDir = getServletContext().getRealPath("/") + "images/products/"; // sua cho nay/ thay bang duong dan cua minh can
		String filename = URLDecoder.decode(request.getPathInfo().substring(1), "UTF-8");
		File file = new File(uploadDir, filename);
		if (!file.exists()) {
			String absoluteFilePath = getServletContext().getRealPath("images");
			file = new File(absoluteFilePath, "page-404.jpeg");
		}
		response.setHeader("Content-Type", getServletContext().getMimeType(filename));
		response.setHeader("Content-Length", String.valueOf(file.length()));
		response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
		Files.copy(file.toPath(), response.getOutputStream());
	}

}