
<%@ include file = "Net.jsp"%> 

<!DOCTYPE html>

<% 
if( request.getParameter("Name") != null )
{
    // 檢查
    String sql ;
    sql = "SELECT * FROM  custo where Name = '"+request.getParameter("Name")+"' and CustomerID = '"+request.getParameter("CustomerID")+"'";
    ResultSet rec = s.executeQuery(sql);
    if(rec.next())
    {
        out.println("<h1 style=\"color:red\">CustomerID "+request.getParameter("Name")+" success</h1>");
        session.setAttribute("Login","OK");    // 設定 session
        response.sendRedirect("login_ok.jsp");  // 轉換網頁。
    }
    else
    {
        out.println("<h1 style=\"color:red\">Error</h1>");
    }
    rec.close();
}
else
{
    String Login = (String)session.getAttribute("Login");
    if(Login != null && Login.equals("OK"))
    {
        out.println("<h1 style=\"color:red\">welcome.</h1>");
        response.setHeader("Refresh","page.jsp");  // 延遲五秒後轉向
    }
    else
    {%>
    <%}
}
%>
<html>
<head><title>memberAdd</title><meta charset="BIG5"></head>
<body>
<% out.println("<h1 style=\"color:red\"> LOGIN</h1>");%>
<form action="" method="post">
    Name:<input type="text" name="Name" /><br />
    CustomerID:<input type="password" name="CustomerID"  />
    <br />
    <input type="submit" value="Login" />    
</form>
</body>
</html>

        
	


