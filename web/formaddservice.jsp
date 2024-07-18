<%-- 
    Document   : formaddservice
    Created on : Mar 5, 2024, 11:33:46 PM
    Author     : ADMIN
--%>

<%@page import="dto.TypePet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.TypeService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add new service</h1>
        <%
            ArrayList<TypeService> listtypeservice = (ArrayList) request.getAttribute("listTypeService");
            ArrayList<TypePet> listtypepet = (ArrayList) request.getAttribute("listTypePet");
        %>
        <form action="mainController" method="">
            <label for="typeservice">Type of service:</label>
            <select id="typeservice" name="txttypeservice" required onchange="toggleFields()">
                <option value="">Select a type of service</option>
                <% for (TypeService service : listtypeservice) {%>
                <option value="<%= service.getId()%>"><%= service.getName()%></option>
                <% } %>
            </select>
            <br>

            <label for="typepetid">Type of pet ID:</label>
            <select id="typepetid" name="txttypepetid" required>
                <option value="">Select a type of pet</option>
                <% for (TypePet pet : listtypepet) {%>
                <option value="<%= pet.getId()%>"><%= pet.getName()%></option>
                <% } %>
            </select>
            <br>

            <label for="description">Description:</label>
            <textarea id="description" name="txtdescription" required placeholder="Enter the description"></textarea>
            <br>

            <label for="weightrange">Weight range:</label>
            <input type="number" id="weightrange" name="txtweightrange" required placeholder="Enter the weight range" min="0">
            <br>

            <label for="price">Price:</label>
            <input type="number" id="price" name="txtprice" required placeholder="Enter the price" min="0">
            <br>

            <label for="discount">Discount(%):</label>
            <input type="number" id="discount" name="txtdiscount" required placeholder="Enter the discount" min="0">
            <br>

            <div id="expirationContainer" style="display: none;">
                <label for="expiration">Expiration date:</label>
                <input type="date" id="expiration" name="txtexpiration" placeholder="Select the expiration date">
                <br>
            </div>

            <div id="quantityContainer" style="display: none;">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="txtquantity" placeholder="Enter the quantity" min="0">
                <br>
            </div>

            <p> 
                <button type='submit' onclick="return window.confirm('Are you sure ?')">Add</button>
                <input  type ="hidden" name="action" value="addservice">
            </p>

            <script>
                function toggleFields() {
                    var selectedService = document.getElementById("typeservice").value;
                    var expirationContainer = document.getElementById("expirationContainer");
                    var quantityContainer = document.getElementById("quantityContainer");
                    var expirationInput = document.getElementById("expiration");
                    var quantityInput = document.getElementById("quantity");

                    // Check if selected service matches A, B, or C and show/hide fields accordingly
                    if (selectedService !== "A" && selectedService !== "B" && selectedService !== "C") {
                        expirationContainer.style.display = "block";
                        quantityContainer.style.display = "block";
                        expirationInput.required = true; // Set required attribute
                        quantityInput.required = true; // Set required attribute
                    } else {
                        expirationContainer.style.display = "none";
                        quantityContainer.style.display = "none";
                        expirationInput.required = false; // Remove required attribute
                        quantityInput.required = false; // Remove required attribute
                    }
                }
            </script>
        </form>
        <%
        %>
    </body>
</html>
