<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "java.sql.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

%>

<html>
    <head>
        <title>Quangz | Cart</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>
    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <div class="page-heading ">
            <div>
                <h2 style="margin-bottom: 50px; color: white;">Quangz.fun -> Report</h2>
            </div>
            <div style="width: 60%; margin: 0 auto">
                <form action="/Ass1/admin/report" method="get" class="text-white mb-5">
                    <label>Category</label>
                    <select name="category">
                        <option value="all">All</option>

                        <c:forEach var="category" items="${categories}">
                            <option value="<c:out value="${category.getId()}"/>"><c:out value="${category.getName()}"/></option>
                        </c:forEach>

                    </select>

                    <label>Time</label>
                    <select name="time">
                        <option value="all">All</option>
                        <option value="lastweek">Last week</option>
                        <option value="lastmonth">Last month</option>
                    </select>

                    <input type="submit" value="Get Report">

                </form>

                <div class="row">
                    <div class="col-lg-9">
                        <table class="row table table-bordered text-white">
                            <tr>
                                <th class="col-lg-4">image</th>
                                <th class="col-lg-3">name</th>
                                <th class="col-lg-2">sold</th>
                                <th class="col-lg-3">value$</th>
                            </tr>

                            <%
                            GameDAO gdao = new GameDAO();    
                            int sum_sold = 0;
                            int sum_total = 0;
    
                            ResultSet rs = (ResultSet) request.getAttribute("rs");
                            try {
                                while (rs.next()) {
                                
                                int game_id = rs.getInt("gameId");
                                int sold = rs.getInt("sold");
                                int total = rs.getInt("total");
                                
                                sum_sold += sold;
                                sum_total += total;
                            %>
                            <tr>
                                <td>
                                    <img src="<%= gdao.getById( game_id ).getImagePath()%>" alt="alt"/>
                                </td>
                                <td class="col-lg-3"><%= gdao.getById( game_id ).getName()%></td>
                                <td class="col-lg-2"><%= sold %></td>
                                <td class="col-lg-3">$<%= total %></td>
                            </tr>
                            <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            %>


                        </table>

                    </div>

                    <div class="col-lg-3 mt-5 ">
                        <h4 class="text-white">Sold quantity: <%= sum_sold %> games</h4>
                        <h4 class="text-white">Revenue: $<%= sum_total %></h4>
                    </div>
                </div>



            </div>


            <br><br><br><br><br><br><br><br><br><br>

        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>

    <script>



    </script>
</html>