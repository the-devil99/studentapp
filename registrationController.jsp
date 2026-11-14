<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%
    String fullname = request.getParameter("fullname");
    String address = request.getParameter("address");
    String age = request.getParameter("age");
    String yop = request.getParameter("yop");
    String qual = request.getParameter("qual");
    String percent = request.getParameter("percent");

    String query = String.format("fullname=%s&address=%s&age=%s&yop=%s&qual=%s&percent=%s",
        URLEncoder.encode(fullname != null ? fullname : "", StandardCharsets.UTF_8),
        URLEncoder.encode(address != null ? address : "", StandardCharsets.UTF_8),
        URLEncoder.encode(age != null ? age : "", StandardCharsets.UTF_8),
        URLEncoder.encode(yop != null ? yop : "", StandardCharsets.UTF_8),
        URLEncoder.encode(qual != null ? qual : "", StandardCharsets.UTF_8),
        URLEncoder.encode(percent != null ? percent : "", StandardCharsets.UTF_8)
    );

    response.sendRedirect("confirmation.html?" + query);
%>
