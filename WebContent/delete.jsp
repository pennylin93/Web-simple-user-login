<%@ include file = "Net.jsp" %> 

<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

if( request.getParameter("CustomerID") != null ){
    String sql ;
    sql = "SELECT * FROM  custo where  CustomerID = '"+request.getParameter("CustomerID")+"'";
    s = connect.createStatement();
    ResultSet rec = s.executeQuery(sql);
    if(rec.next())
    {
    	int sql2 =  s.executeUpdate("DELETE FROM custo WHERE CustomerID = '"+request.getParameter("CustomerID")+"'");   
        out.println("<h1 style=\"color:red\">Delete CustomerID  success</h1>");
        session.setAttribute("Login","OK");    // �]�w session
        //response.sendRedirect("login_ok.jsp");  // �ഫ�����C
    }
    	else
    	{
    	    String Login = (String)session.getAttribute("Login");
    	    if(Login != null && Login.equals("OK"))
    	    {
    	        out.println("<h1 style=\"color:red\">CustomerID Error.</h1>");
    	        response.setHeader("Refresh","page.jsp");  // ���𤭬����V
    	    }
    	    else
    	    {%>
    	    <%}
    	}
}%>
<html>
<head><title>memberAdd</title><meta charset="BIG5"></head>
	    <body> 
	        <form action = "" method = "post"> 
	        	CustomerID : <input type = "text" name = "CustomerID" size = "10"/>  	
	            <br /> 
	            <input type = "submit"  value = "Delete data"/>       
	        </form> 
	        <a href="login_ok.jsp">BACK HOME~</a> 
	    </body> 
	</html>   