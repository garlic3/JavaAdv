<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="email.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<%
request.setCharacterEncoding("utf-8");


String from = "bluedot9456@naver.com";
String to = request.getParameter("seruid");
String subject = "안녕하세요 요기콕 고객센터입니다.";
String content = request.getParameter("seranswer");

	Properties p = new Properties(); // 정보를 담을 객체

	p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들

	try {
		Authenticator auth = new SMTPAuthenticatior();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);

		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject); // 제목

		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr); 

		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

		msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

		Transport.send(msg); // 전송
		
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert('오류가 발생했습니다.');history.back();</script>");
		// 오류 발생시 뒤로 돌아가도록
		return;
	}

	out.println("<script>alert('답변 메일이 발송 되었습니다.');location.href='servicemanager.jsp';</script>" );
	// 성공 시


%>