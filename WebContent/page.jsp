
<%@ include file = "Net.jsp"%> 
	<html> 
	    <head> 
	        <title>Index</title> 
	    </head> 
	    <body> 
        <% 
	            //建立查詢並產生rs的資料表 
	                String sql = "SELECT * FROM  custo ";
	                ResultSet rec = s.executeQuery(sql);
	     %>
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
  <a href="login_ok.jsp">BACK HOME~</a> 
</body>
</html>

	
