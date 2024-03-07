<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    if (current_user != null){
        RoleDAO rDAO = new RoleDAO();
        String user_role = rDAO.getRole(current_user.getId());
        boolean is_admin = user_role.equals("admin");

        pageContext.setAttribute("is_admin", is_admin);
    }
%>



<header class="header-area">    <!-- header-sticky removed: red background-->
    <div class="container">
        <div class="drop-menu" id="drop-menu">

            <c:if test="${ is_admin }">
                <div id="admin-menu">
                    <a href="/Ass1/admin/game/insert">Upload game</a><br/>
                    <a href="/Ass1/admin/all_order">All order</a><br/>
                    <hr/>
                </div>
            </c:if>

            <a href="/Ass1/order_history">Order history</a><br/>
            <a href="/Ass1/change_password">Change password</a><br/>
            <a href="/Ass1/logout">Logout</a><br/>
        </div>

        <div id="notification" class="notification">
            <p id="notification-message">.....</p>
        </div>

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
                        <li>
                            <a href="/Ass1/dashboard"   class="<%= pageId==0 ? "active" : "" %>">Home</a>
                        </li>
                        <li>
                            <a href="/Ass1/shop"        class="<%= pageId==1 ? "active" : "" %>">Our Shop</a>
                        </li>
                        <li class="d-none">
                            <a href="/Ass1/product" class="<%= pageId==2 ? "active" : "" %>">Product Details</a>
                        </li>
                        <li>
                            <a href="/Ass1/contact"     class="<%= pageId==3 ? "active" : "" %>">Contact Us</a>
                        </li>
                        <%
                            if (current_user != null){
                        %>
                        <li>
                            <a class="fw-bold d-inline-block text-white">
                                <%= current_user.getName()%>
                            </a>

                            <img src="/Ass1/assets/images/menu-button.png" id="menu-button" 
                                 alt="alt" style = " width: 25px" class="qz-cursor-pointer"/>

                        </li>
                        <li>
                            <a href="/Ass1/cart">
                                <div class="position-relative qz-cursor-pointer">
                                    <img width="36" height="36" src="/Ass1/assets/images/shop_cart.png"/>
                                    <div class="cart-number"> 
                                        <span class="text-white fw-medium">${current_user.numberOfItemInCart()}</span>
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

<script>
    let menu_button = document.getElementById("menu-button");
    let drop_menu = document.getElementById("drop-menu");
    let is_menu_open = false;

    menu_button.addEventListener("click", function () {
        if (is_menu_open == false) {
            showDropMenu();
        } else {
            hideDropMenu();
        }

        is_menu_open = !is_menu_open;
    });

    function showDropMenu() {
        drop_menu.style.opacity = "0";
        drop_menu.style.display = "block";
        fadeInDropMenu();
    }

    function hideDropMenu() {
        drop_menu.style.display = "none";

    }

    function fadeInDropMenu() {
        var opacity = 0;
        var interval = setInterval(function () {
            if (opacity < 1) {
                opacity += 0.1;
                drop_menu.style.opacity = opacity;
            } else {
                clearInterval(interval);
            }
        }, 20);
    }

</script>

<script>
    let notification = document.getElementById("notification");

    function showNotification() {
        notification.style.opacity = "0";
        notification.style.display = "block";
        fadeIn();
        setTimeout(hideNotification, 5000);
    }

    function hideNotification() {
        fadeOut();
        setTimeout(function () {
            notification.style.display = "none";
        }, 500);
    }

    function fadeIn() {
        var opacity = 0;
        var interval = setInterval(function () {
            if (opacity < 1) {
                opacity += 0.1;
                notification.style.opacity = opacity;
            } else {
                clearInterval(interval);
            }
        }, 50);
    }

    function fadeOut() {
        var opacity = 1;
        var interval = setInterval(function () {
            if (opacity > 0) {
                opacity -= 0.1;
                notification.style.opacity = opacity;
            } else {
                clearInterval(interval);
            }
        }, 50);
    }

    <% 
        String notification_message = (String) request.getAttribute("notification-message");
        if (notification_message == null) {
            notification_message = (String) request.getSession().getAttribute("notification-message");
        }
        
        if (notification_message != null){ 
    %>

    let notification_message = document.getElementById("notification-message");

    notification_message.innerHTML = "<%= notification_message %>";

    showNotification();

    <% 
        } 
        request.getSession().removeAttribute("notification-message");
    %>


</script>
<!-- ***** Header Area End ***** -->