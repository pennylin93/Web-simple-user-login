<%@ include file = "Net.jsp"%> 
	<html> 
	    <head> 
	        <title>Index</title> 
	    </head> 
	    <body> 
	    <form action="" method="post">
    		CustomerID:<input type="text" name="CustomerID"  />
   		 <br />
   		 <input type="submit" value="show the data" />    
   		 <br />
   		 <a href="login_ok.jsp">BACK HOME~</a> 
		</form>
        <% if( request.getParameter("CustomerID") != null ){
	            //建立查詢並產生rs的資料表 
	                String sql = "SELECT * FROM  custo where CustomerID = '"+request.getParameter("CustomerID")+"'";
	                ResultSet rec = s.executeQuery(sql);
	                if(rec.next())
	                {
	                    out.println("<h1 style=\"color:red\">  success</h1>");
	                    session.setAttribute("Login","OK");    // 設定 session
	                    //response.sendRedirect("login_ok.jsp");  // 轉換網頁。
	                }
	                	else
	                	{
	                	    String Login = (String)session.getAttribute("Login");
	                	    if(Login != null && Login.equals("OK"))
	                	    {
	                	        out.println("<h1 style=\"color:red\">CustomerID Error.</h1>");
	                	        response.setHeader("Refresh","page.jsp");  // 延遲五秒後轉向
	                	    }
	                	    else
	                	    {%>
	                	    <%}
	                	}
	            }%>


	   
	           <% //開始顯示%>  
	              <TABLE >
        <TR  bgcolor=SkyBlue>
        <TD><B>CustomerID</B></TD>
        <TD><B>Name</B></TD>
        <TD><B>Email</B></TD>
        <TD><B>CountryCode</B></TD>
        <TD><B>Budget</B></TD>
        <TD><B>Used</B></TD>
        </TR>
        <%	            
        String sql = "SELECT * FROM  custo where CustomerID = '"+request.getParameter("CustomerID")+"'";
        ResultSet rec = s.executeQuery(sql);
        //利用while迴圈將資料表中的記錄列出
        while (rec.next())
        {
                %>
                <TR bgcolor=LightGoldenrodYellow>
                <TD><B><%= rec.getString("CustomerID") %></B></TD>
                <TD><B><%= rec.getString("Name") %></B></TD>
                <TD><B><%= rec.getString("Email") %></B></TD>
                <TD><B><%= rec.getString("CountryCode") %></B></TD>
                <TD><B><%= rec.getString("Budget") %></B></TD>
                <TD><B><%= rec.getString("Used") %></B></TD>
                </TR>
                <%
        }
        %>
</TABLE>
<%
	            //關閉資料表 
	                rec.close(); 
	        %> 
</body>
</html>

	