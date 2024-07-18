<%-- 
    Document   : viewtopcustomer
    Created on : Mar 6, 2024, 9:16:02 PM
    Author     : ADMIN
--%>

<%@page import="dao.OrderDao"%>
<%@page import="dto.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            OrderDao od = new OrderDao();
            ArrayList<Account> list = (ArrayList) request.getAttribute("listTopCustomer");
            if (list.size() > 0) {
        %>
        <table>
            <tr>
                <th>ID</th>
                <th>FullName</th>
                <th>Phonemunber</th>
                <th>Quantity</th>
            </tr>
            <%
                for (Account acc : list) {
            %>
  
                <tr>
                    <td><%=  acc.getId()%> </td>
                    <td><%=  acc.getFullname()%> </td>
                    <td><%=  acc.getPhonenumber()%> </td>
                    <td><%= od.getQuantityOrderByAccId(acc.getId())%></td>
                </tr>
            
            <%
                }
            %>
        </table>
        <% }%>
    </body>
</html>
