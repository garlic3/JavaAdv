<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*" %>
<%@ page import="jdbc.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>


<%
request.setCharacterEncoding("utf-8");


// images로 전체 데이터가 넘어옴


String pid = null;
String pname = null;
String pprice = null;
String pdsec = null;
String pmenu = null;
String pcate = null;
String pcondi = null;

String pimage = null;
byte[] pfile = null;

ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
// 추출 값들을 객체 형태로 저장할 준비 

List items = sfu.parseRequest(request);
// 입력된 값들을 추출하여 객체에 저장

Iterator iter = items.iterator();
// 순차적으로 접근하기 위해 객체 생성

while (iter.hasNext()) { // 요소가 있으면 계속 반복 없으면 종료
	FileItem item = (FileItem) iter.next(); // 하나씩 요소를 추출하여 저장 
	String name = item.getFieldName();		// 요소의 이름을 추출 
	
	if (item.isFormField()) {		// 이름과 값으로 즉 맵의 형태인지 확인
		// 텍스트를 추출
		String value = item.getString("utf-8");
		if (name.equals("pid"))
			pid = value;
		else if (name.equals("pname"))
			pname = value;
		else if (name.equals("pprice"))
			pprice = value;
		else if (name.equals("pdesc"))
			pdsec = value;
		else if (name.equals("pmenu"))
			pmenu = value;
		else if (name.equals("pcate"))
			pcate = value;
		else if (name.equals("pcondi"))
			pcondi = value;
		
	} 
	
	else {
		// 사진을 추출
		if (name.equals("images")) {
	pimage = item.getName(); // 사진이름
	pfile = item.get(); // 사진내용
	String root = application.getRealPath(java.io.File.separator);
	FileUtil.saveImage(root, pimage, pfile);

		}
	}
}

// 디비에 게시물 모든 정보 전달
ProductDAO dao = new ProductDAO();
if(dao.insert(pid, pname, pprice, pdsec, pmenu, pcate, pcondi, pimage)){
	response.sendRedirect("product_list.jsp");
}

%>

