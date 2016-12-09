<%@ page import="main.java.com.net.nhefner.Stock" %>
<%@ page import="main.java.com.net.nhefner.StockFetcher" %>
<%@ page import="main.java.com.net.services.TemplateLoader" %><%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 26.11.2016
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% out.println(TemplateLoader.loadTemplate("tracking_head")); %>
<body>

<% out.println(TemplateLoader.loadTemplate("site_navbar")); %>

<% out.println(TemplateLoader.loadTemplate("tracking_body")); %>

<% out.println(TemplateLoader.loadTemplate("moving_text")); %>

<% out.println(TemplateLoader.loadTemplate("footer")); %>

</body>
</html>
