<%request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "jdbc.*"%>
<%@ page import = "util.FileUtil"%>
<%@ page import = "java.util.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
    
<jsp:useBean id="user" class="jdbc.UserDTO_k" scope="page"/>
<jsp:setProperty property="*" name="user"/>

아이디 : <jsp:getProperty property="uid" name="user"/>	
<%
	/* 	// images로 전체 데이터가 넘오옴
		String uid = null;
		String upw = null;
		String uname = null;
		String ugender = null;
		String ubirth = null;
		String uemail = null;
		String uaddr = null;
		byte[] pfile = null;
		
		// 추출값들을 객체 형태로 저장할 준비
		ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
		// 입력값들을 추출하여 객체에 저장
		List items =sfu.parseRequest(request);
		// 순차적으로 접근하기 위해 객체 생성
		Iterator iter = items.iterator();

		while(iter.hasNext()){
			FileItem item = (FileItem) iter.next(); // 요소를 하나씩 추출
			String name = item.getFieldName(); // 요소의 이름 추출
			if(item.isFormField()){ // 이름과 값으로 즉 맵 형태 쌍으로 구성이 되어 있는지 확인
		// 텍스트를  추출
		String value = item.getString("utf-8");
		if(name.equals("uid")) uid=value;
		else if(name.equals("upw")) upw=value;
		else if(name.equals("uname")) uname=value;
		else if(name.equals("ugender")) ugender=value;
		else if(name.equals("ubirth")) ubirth=value;
		else if(name.equals("uemail")) uemail=value;
		else if(name.equals("uaddr")) uaddr=value;
			} else{
		// 사진을 추출
		if(name.equals("pimages")){
			pimage = item.getName(); // 사진이름
			pfile = item.get(); // 사진 내용
			// 서버에 사진 저장
			String root = application.getRealPath(java.io.File.separator);
			FileUtil.saveImage(root, pimage, pfile);
		}
			}  
		}*/
		// db에 게시물 모든 정보 전달
	 	UserDAO_k dao = new UserDAO_k();
		if(dao.insert(user.getUid(), upw, uname, ugender, ubirth, uemail, uaddr)){
			response.sendRedirect("/user/login.jsp");
		}else{
			response.sendRedirect("/user/useradd.jsp");	
		};
	%>