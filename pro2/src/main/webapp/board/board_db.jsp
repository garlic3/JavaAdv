<%@page import="jdbc.BoardDAO"%>
<%@page import="util.FileUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "util.FileUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

    
<%
    //추출할 전역 변수값 초기화
        	   
        	   request.setCharacterEncoding("utf-8");
        	       String uid = null, ucon = null, ufname = null, uvname = null, lat = null, lon = null;
        	       
        	       
        	       
        	       byte[] ufile = null;
        	       byte[] vid = null;
        	       
        	       
        	       ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
        	       List items = sfu.parseRequest(request);
        	       
        	       Iterator iter = items.iterator();
        	       while(iter.hasNext()) {
        	           FileItem item = (FileItem) iter.next();
        	           String name = item.getFieldName();
        	           if(item.isFormField()) {
        	               String value = item.getString();
        	               if (name.equals("uid")) uid = value;
        	               else if (name.equals("ucon")) ucon = value;
        	               else if (name.equals("lat")) lat = value;
        	               else if (name.equals("lon")) lon = value;
        	           }
        	           else {
        	               if (name.equals("uimage")) {
        	                   ufname = item.getName();
        	                   ufile = item.get();
        	                   //서버에 사진 저장
        	                   if(ufname.equals("")) {
        	                   	ufname = null;
        	   				}else{
        	   	                String root = application.getRealPath(java.io.File.separator);
        	   	                FileUtil.saveImage(root, ufname, ufile);       
        	                   
        	   				}
        	               }
        	               else if (name.equals("uvideo")) {
        	               	uvname = item.getName();
        	                   vid = item.get();
        	                   //서버에 사진 저장
        	                   if(uvname.equals("")) {
        	                   	uvname = null;
        	   				}else{
        	                   String root = application.getRealPath(java.io.File.separator);
        	                   FileUtil.saveVideos(root, uvname, vid);
        	               	}
        	               }
        	   	}
        	   }
        	       
        	       //디비에 게시물 모든 정보 전달
        	       BoardDAO dao = new BoardDAO();
        	       if (dao.insert(uid, ucon, ufname, uvname, lat, lon)) {
        	       	response.sendRedirect("toMain.jsp");
        	       }
    %>


</body>
</html>