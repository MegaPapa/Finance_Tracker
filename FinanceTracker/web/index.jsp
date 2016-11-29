<%@ page import="main.java.com.net.services.TemplateLoader" %><%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 26.11.2016
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <% out.println(TemplateLoader.loadTemplate("head")); %>
  <body>

  <% out.println(TemplateLoader.loadTemplate("site_navbar")); %>

  <% out.println(TemplateLoader.loadTemplate("main_body")); %>

  <% out.println(TemplateLoader.loadTemplate("footer")); %>

  <% out.println(TemplateLoader.loadTemplate("ajax_scripts")); %>

  </body>
</html>
