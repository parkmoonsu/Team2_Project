<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="calendar.dto"%>
<%@ page import="calendar.dao"%>

<% 

		System.out.print(request.getParameter("title"));
		//mybatis적용
		dao dao=sqlsession.getMapper(dao.class);
		dao.insert(dto);

%>