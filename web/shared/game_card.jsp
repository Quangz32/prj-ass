
<div class="col-lg-3 col-md-6 align-self-center mb-30 trending-items <c:out value="${game.getCategoriesString()}"/> ">
<div class="item">
    <div class="thumb">
        <span style="display: none"> <c:out value="${game.getId()}"/></span>
        <a href="/Ass1/product/<c:out value="${game.getId()}"/>">    
        <img src="<c:out value="${game.getImagePath()}"/>" style="height: 270px ">
        </a>
        <span class="price"><em>$<c:out value="${game.getListedPrice()}"/></em>$<c:out value="${game.getDiscountPrice()}"/></span>
    </div>
    <div class="down-content">
        <span class="category">Action</span>
        <div style="height: 40px">
            <h4><c:out value="${game.getName()}"/></h4>

        </div>
        <a href="product/<c:out value="${game.getId()}"/>"><i class="fa fa-shopping-bag"></i></a>
    </div>
</div>
</div>
