<!-- ***** Header Area Start ***** -->
<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>


<%
    //Determite the what page is displaying
    String routeString = request.getRequestURI();
    int pageId = -1;
    if (routeString.endsWith("dashboard.jsp")){
        pageId = 0;
    } else if (routeString.endsWith("shop.jsp")){
        pageId = 1;
    } else if (routeString.endsWith("product-details.jsp")){
        pageId = 2;
    } else if(routeString.endsWith("contact.jsp")){
        pageId = 3;
    }
    
    //Login or not
        User current_user = (User) request.getSession().getAttribute("current_user");
    
%>

<style>
    .cart-number{
        position: absolute;
        top: 0;
        right: 0;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        background-color: red;
        display: flex;
        justify-content: center;
        align-items: center;
    }

</style>

<header class="header-area">    <!-- header-sticky removed: red background-->
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/Ass1/dashboard" class="logo">
                        <img src="/Ass1/assets/images/logo_2.png" alt="" style="width: 158px;">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="/Ass1/dashboard"   class="<%= pageId==0 ? "active" : "" %>">Home</a></li>
                        <li><a href="/Ass1/shop"        class="<%= pageId==1 ? "active" : "" %>">Our Shop</a></li>
                        <li style="display: none"><a href="/Ass1/product"     class="<%= pageId==2 ? "active" : "" %>">Product Details</a></li>
                        <li><a href="/Ass1/contact"     class="<%= pageId==3 ? "active" : "" %>">Contact Us</a></li>
                            <%
                                if (current_user != null){
                            %>
                        <li>
                            <a href="/Ass1/login" class="" style="font-weight: bold;"><%= current_user.getName()%></a>
                        </li>
                        <li>
                            <a href="/Ass1/cart">
                                <div style="position: relative; cursor: pointer;">
                                    <img width="36" height="36" src="/Ass1/assets/images/shop_cart.png"/>
                                    <div class="cart-number">
                                        <span style="color: white; font-weight: 500; font-size: 12px;"><%= current_user.numberOfCartItem() %></span>
                                    </div>
                                </div>                           
                            </a>
                        </li>
<!--                        <li><a></a></li>-->

                        <% } else {%>
                        <li><a href="/Ass1/login" class="active" style="font-weight: bold;">Login</a></li>
                            <% } %>

                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->