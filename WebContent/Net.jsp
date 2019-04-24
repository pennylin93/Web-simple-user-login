<%@page contentType="text/html; charset=big5" pageEncoding="big5" import="java.sql.*, java.util.Date"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>

<%  Connection connect = null;
    Statement s = null;
try {
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
connect =  DriverManager.getConnection("" +
"jdbc:sqlserver://localhost:1433;databaseName=master;user=saa;password=sa123");
s = connect.createStatement();
%>

<%  
} catch (Exception e) {
// TODO Auto-generated catch block
out.println(e.getMessage());
e.printStackTrace();
}
%>
</body>
</html>


