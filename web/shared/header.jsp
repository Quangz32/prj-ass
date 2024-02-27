<!-- ***** Header Area Start ***** -->
<%
    //Determite the what page is displaying
    String routeString = request.getRequestURI();
    //System.out.println(routeString);
    
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
    
%>

<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/Ass1/dashboard" class="logo">
                        <img src="assets/images/logo_2.png" alt="" style="width: 158px;">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="/Ass1/dashboard"   class="<%= pageId==0 ? "active" : "" %>">Home</a></li>
                        <li><a href="/Ass1/shop"        class="<%= pageId==1 ? "active" : "" %>">Our Shop</a></li>
                        <li style="display: none"><a href="/Ass1/product"     class="<%= pageId==2 ? "active" : "" %>">Product Details</a></li>
                        <li><a href="/Ass1/contact"     class="<%= pageId==3 ? "active" : "" %>">Contact Us</a></li>
                        <li><a href="/Ass1/login.jsp">Sign In</a></li>
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