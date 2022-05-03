<%@page import="jdbc.LikeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String uid = request.getParameter("uid");
String bid = request.getParameter("bid");
String like = request.getParameter("like");


LikeDAO dao = new LikeDAO();
dao.likeInsert(uid, bid); 
 
%>
