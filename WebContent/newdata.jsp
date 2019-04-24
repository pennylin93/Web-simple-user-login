<%@ include file = "Net.jsp"%> 
<!DOCTYPE html>
<html> 
	   
	    <head><title>memberAdd</title><meta charset="BIG5"></head>
	    <body> 

	        <form action = "" method = "post"> 
	        	CustomerID : <input type = "text" name = "CustomerID" size = "4"/>  	
	            <br />
	            Name : <input type = "text" name = "Name" size = "10"/> 
	            <br />      
	            Email : <input type = "text" name = "Email" size = "20"/> 
	            <br />     
	    	   CountryCode : <input type = "text" name = "CountryCode" size = "10"/> 
	            <br /> 
	            Budget : <input type = "text" name = "Budget" size = "10"/> 
	            <br />     
	    	    Used : <input type = "text" name = "Used" size = "10"/> 
	            <br /> 
	            <input type = "submit"  value = "Input new data"/>       
               
	        </form> 
	        <a href="login_ok.jsp">BACK HOME~</a> 
	        
	<% 
	    if(request.getParameter("CustomerID") != null){ 
	        String sql = "insert into custo (CustomerID,Name,Email,CountryCode,Budget,Used) values (?,?,?,?,?,?)";

	        PreparedStatement pstmt = connect.prepareStatement(sql); 
	        pstmt.setEscapeProcessing(true);
	        pstmt.setQueryTimeout(90);
	        
	        String CustomerID = request.getParameter("CustomerID"); 
	        String Name = request.getParameter("Name"); 
	        String Email = request.getParameter("Email"); 
	        String CountryCode = request.getParameter("CountryCode"); 
	        String Budget = request.getParameter("Budget"); 
	        String Used = request.getParameter("Used"); 
	        
	        pstmt.setString(1 , CustomerID); 
	        pstmt.setString(2 , Name); 
	        pstmt.setString(3 , Email) ;
	        pstmt.setString(4 , CountryCode); 
	        pstmt.setString(5 , Budget); 
	        pstmt.setString(6 , Used); 

	        int a = pstmt.executeUpdate(); 
	        
	        out.println("<h1 style=\"color:red\">Input the new data  success</h1>");
	        //3秒後將網頁轉跳到首頁 
	       // response.sendRedirect("login_ok.jsp");
	    } 
	%> 
	
	          <% 
	            //建立查詢並產生rs的資料表 
	                String sql = "SELECT * FROM  custo where CustomerID = '"+request.getParameter("CustomerID")+"'";
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
</body>
	   
	</html>   

	
	