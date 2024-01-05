<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
    body {
        color: grey;
    }

    #sidebar {
        width: auto;
        padding: 10px;
        margin: 0;
        float: left;
    }

    ul {
        list-style: none;
        padding: 5px;
    }

    li a {
        color: darkgray;
        text-decoration: none;
    }

    li a:hover {
        text-decoration: none;
        color: darksalmon;
    }

    .fa-circle {
        font-size: 20px;
    }

    .red {
        color: #e94545d7;
    }

    .card-body p {
        margin: 2px;
    }


    .filter {
        display: none;
        padding: 0;
        margin: 0;
    }

    @media (min-width: 991px) {

        #mobile-filter {
            display: none;
        }
    }

    @media (min-width: 768px) and (max-width: 991px) {

        #mobile-filter {
            display: none;
        }
    }

    @media (min-width: 568px) and (max-width: 767px) {

        .fa-circle {
            font-size: 15px;
        }

        #mobile-filter {
            display: none;
        }
    }

    @media (max-width: 567px) {
        #sidebar {
            width: 100%;
            padding: 10px;
            margin: 0;
            float: left;
        }

        .list-group-item {
            padding: 3px;
        }

        .filter {
            display: block;
            margin-left: 70%;
            margin-top: 2%;
        }

        #sidebar {
            display: none;
        }

        #mobile-filter {
            padding: 10px;
        }
    }


    .section-products {
        padding: 80px 0 54px;
    }


    .section-products .single-product {
        margin-bottom: 26px;
    }

    .section-products .single-product .part-2 .product-title {
        font-size: 1rem;
        margin-top: 5px;
    }

    .section-products .single-product .part-2 h4 {
        display: inline-block;
        font-size: 1rem;
    }

    .section-products .single-product .part-2 .product-old-price {
        position: relative;
        padding: 0 7px;
        margin-right: 2px;
        opacity: 0.6;
    }

    .section-products .single-product .part-2 .product-old-price::after {
        position: absolute;
        content: "";
        top: 50%;
        left: 0;
        width: 100%;
        height: 1px;
        background-color: #444444;
        transform: translateY(-50%);
    }
</style>
<div style="min-height: 75vh">
    <div class="filter">
        <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#mobile-filter"
                aria-expanded="false" aria-controls="mobile-filter">Filters<span class="fa fa-filter pl-1"></span>
        </button>
    </div>
    <div id="mobile-filter">
        <div>
            <h6 class="p-1 border-bottom">Home Furniture</h6>
            <ul>
                <li><a href="#">Living</a></li>
                <li><a href="#">Dining</a></li>
                <li><a href="#">Office</a></li>
                <li><a href="#">Bedroom</a></li>
                <li><a href="#">Kitchen</a></li>
            </ul>
        </div>
        <div>
            <h6 class="p-1 border-bottom">Filter By</h6>
            <p class="mb-2">Color</p>
            <ul class="list-group">
                <li class="list-group-item list-group-item-action mb-2 rounded"><a href="#">
                    <span class="fa fa-circle pr-1 red"></span>Red
                </a></li>
                <li class="list-group-item list-group-item-action mb-2 rounded"><a href="#">
                    <span class="fa fa-circle pr-1teal" id=""></span>Teal
                </a></li>
                <li class="list-group-item list-group-item-action mb-2 rounded"><a href="#">
                    <span class="fa fa-circle pr-1" id="blue"></span>Blue
                </a></li>
            </ul>
        </div>
        <div>
            <h6>Type</h6>
            <form class="ml-md-2">
                <div class="form-inline border rounded p-sm-2 my-2">
                    <input type="radio" name="type" id="boring">
                    <label for="boring" class="pl-1 pt-sm-0 pt-1">Boring</label>
                </div>
                <div class="form-inline border rounded p-sm-2 my-2">
                    <input type="radio" name="type" id="ugly">
                    <label for="ugly" class="pl-1 pt-sm-0 pt-1">Ugly</label>
                </div>
                <div class="form-inline border rounded p-md-2 p-sm-1">
                    <input type="radio" name="type" id="notugly">
                    <label for="notugly" class="pl-1 pt-sm-0 pt-1">Not Ugly</label>
                </div>
            </form>
        </div>
    </div>
    <section id="sidebar" style="width: 20%">

        <%--@elvariable id="filterform" type="com.spring.henallux.ecommerce.Model.FilterForm"--%>
        <form:form method="get" modelAttribute="filterform" cssClass="d-flex"
                   cssStyle="flex-direction: column;gap: 10px" id="filterform">
            <h6 class="p-1 border-bottom mb-3">Trie par</h6>
            <form:select path="orderby">
                <form:option value="priceasc">Prix croissant</form:option>
                <form:option value="pricedesc">Prix decroissant</form:option>
                <form:option value="labelasc">Nom croissant</form:option>
                <form:option value="labeldesc">Nom decroissant</form:option>
            </form:select>
            <div class="d-flex" style="justify-content: space-between">
                <label for="checkbox">Promotion</label>
                <form:checkbox path="ispromotion" id="checkbox"/>
            </div>
            <form:input id="minprice" path="minprice" type="number" placeholder="Prix minimum" maxlength="6"/>
            <form:input id="maxprice" path="maxprice" type="number" placeholder="Prix maximum" maxlength="6"/>
            <form:button id="submitbtn" type="submit">Filtrer</form:button>
            <div id="error" class="red d-flex"></div>
            <script defer>
                const filterform = document.getElementById("filterform");
                const minprice = document.getElementById("minprice");
                const maxprice = document.getElementById("maxprice");
                const error = document.getElementById("error");

                filterform.addEventListener("submit", (e) => {
                    e.preventDefault()
                    let errorText = ""
                    console.log({minprice: minprice.value, maxprice: maxprice.value})
                    if (minprice.value > maxprice.value && maxprice.value !== "") {
                        errorText = "Le prix minimum ne peut pas etre superieur au prix maximum";
                    }
                    if (minprice.value < 0 || maxprice.value < 0) {
                        errorText = "Le prix minimum et maximum ne peuvent pas etre negatif";
                    }
                    if (minprice.value > 100000 || maxprice.value > 100000) {
                        errorText = "Le prix minimum et maximum ne peuvent pas etre superieur a 100000";
                    }
                    if (errorText !== "") {
                        error.innerText = errorText;
                        error.style.display = "block";
                    } else {
                        error.style.display = "none";
                        filterform.submit();
                    }
                });


            </script>
        </form:form>

    </section>
    <section class="section-products">
        <div class="container">
            <div class="row">
                <c:forEach var="product" items="${products}">

                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-1" class="single-product">
                            <a href="product/${product.labelEn}-${product.id}">
                                <img src="https://placehold.co/400" alt="" width="100%">
                                <div class="part-2">
                                    <h3 class="product-title">${product.getLocalizedLabel(locale)}</h3>
                                    <c:if test="${product.isPromotion}">
                                        <h4 class="product-old-price">${product.oldPrice}</h4>
                                    </c:if>
                                    <h4 class="product-price">${String.format("%.2f",product.price)} euros</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</div>
