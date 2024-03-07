<%@page import = "model.*" %>
<%@page import = "java.util.*" %>
<%@page import = "database.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>
    <head>
        <title>Quangz | Cart</title>

        <%@include file="shared/stylesheet.jsp" %>
    </head>
    <body>
        <%@include file="shared/preload.jsp" %>

        <%@include file="shared/header.jsp" %>

        <%
            //The current_user already include in include file="shared/header.jsp" : line 23
            CartItemDAO ciDAO = new CartItemDAO();
            ArrayList<CartItem> cart_items = ciDAO.getByUserIdAndStatus(current_user.getId(), "in_cart");
        %>

        <div class="page-heading">


            <% if (cart_items.isEmpty()) { %>
            <h2 style="margin-bottom: 50px; color: white;">You have no game in the cart! Let's shopping</h2>

            <% } else { %>

            <div class="mb-5">
                <h2 class="text-white">The best cart ever!</h2>
                <form action="/Ass1/delete_cart" method="post" onsubmit="return confirmDelete()">
                    <input type="text" value="<%= current_user.getId() %>" hidden>
                    <input type="submit" value="Delete this cart">
                </form>
            </div>
            <div style="width: 60%; margin: 0 auto">
                <form action="cart" method="post">
                    <% 
                        for (CartItem cart_item : cart_items) {
                    %>

                    <%@include file="shared/cart_item.jsp" %>

                    <% 
                        } 
                    %>

                    <hr class="border-5" style="">

                    <div class="row mt-5">
                        <div class="col-lg-2">
                            <input type="checkbox" class="big-checkbox-3" id="check-all" onchange="checkAll(this)">
                            <span for="check-all" class="ms-3">All</span>
                        </div>

                        <div class="col-lg-3"></div>
                        <div class="col-lg-7">
                            <input type="submit" value="Next">

                        </div>

                    </div>
                </form>
            </div>
            <% } %>

            <br><br><br><br><br><br><br><br><br><br>

        </div>

        <%@include file="shared/footer.jsp" %>

        <%@include file="shared/script_import.jsp" %>

    </body>

    <script>
        function toggleContent(cart_item_id) {
            let intro_open = document.getElementById("intro-open-" + cart_item_id);
            let intro_close = document.getElementById("intro-close-" + cart_item_id);


            if (intro_open.style.display == "none") {
                intro_open.style.display = "inline-block";
                intro_close.style.display = "none";
            } else {
                intro_open.style.display = "none";
                intro_close.style.display = "inline-block";
            }
        }

        // Show total of a cart-item =================
        const checkboxes = document.getElementsByName('cart-items');

        checkboxes.forEach((checkbox) => {
            checkbox.addEventListener("change", function () {
                const cartItemId = this.value;
                showTotal(this, cartItemId);
            });
        });

        function showTotal(checkbox, cartItemId) {
            const total = document.getElementById("total-" + cartItemId);

            if (checkbox.checked) {
                total.classList.remove("d-none");
            } else {
                total.classList.add("d-none");
            }
        }

        // Check all checkbox in cart!====================
        document.getElementById("check-all").addEventListener("change", function () {
            const checkboxes = document.getElementsByName("cart-items");
            const checkAllCheckbox = document.getElementById("check-all");

            checkboxes.forEach((checkbox) => {
                checkbox.checked = checkAllCheckbox.checked;
                const gameId = checkbox.value;
                showTotal(checkbox, gameId);
            });
        });

        //DELETE CART
        function confirmDelete() {
            return confirm("Are you sure you want to delete this cart?");
        }


    </script>
</html>