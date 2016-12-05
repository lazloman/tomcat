<%--
  Created by IntelliJ IDEA.
  User: lorenzot
  Date: 12/2/16
  Time: 10:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.io.InputStream" %>
<%@page import="java.util.Properties" %>
<%@page import="java.util.HashMap" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  InputStream stream = application.getResourceAsStream("foo.properties");
  Properties props = new Properties();
  props.load(stream);

  HashMap<String, String> linkMap = new HashMap<String, String>();
  for (final String name: props.stringPropertyNames()) {
    linkMap.put(name, props.getProperty(name));
  }
// 3. set the map in a page attribute
  pageContext.setAttribute("linkMap", linkMap);
%>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <select name="link">
      <!-- 4. iterate through the map -->
      <c:forEach items="${linkMap}" var="link">
          <!-- 5. populate the option tags -->
          <option value="${link.key}">${link.value}</option>
      </c:forEach>
  </select>

  </body>
</html>
