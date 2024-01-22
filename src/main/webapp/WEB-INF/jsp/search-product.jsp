<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
    #wrapper {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: flex-start;
    }

    #sidebar {
        padding: 10px;
        margin: 0;
        float: left;
        width: 20%;
        height: 100vh;
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


    .red {
        color: #e94545d7;
    }

    .card-body p {
        margin: 2px;
    }


    @media (max-width: 1000px) {
        #sidebar {
            width: 100%;
            padding: 10px;
            margin: 0;
            float: left;
            height: 30vh;
        }

        #wrapper {
            flex-direction: column;
            align-items: center;
        }
    }


    .section-products {
        padding: 80px 0 54px;
        width: 100%;
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
<div id="wrapper" style="min-height: 75vh">

    <section id="sidebar">

        <%--@elvariable id="filterform" type="com.spring.henallux.ecommerce.Model.FilterForm"--%>
        <form:form method="get" modelAttribute="filterform" cssClass="d-flex"
                   cssStyle="flex-direction: column;gap: 10px" id="filterform">
            <h6 class="p-1 border-bottom mb-3"><spring:message code="orderBy"/></h6>
            <form:select path="orderby" cssClass="form-select">
                <form:option value="priceasc"><spring:message code="price_asc"/></form:option>
                <form:option value="pricedesc"><spring:message code="price_desc"/></form:option>
                <form:option value="labelasc"><spring:message code="name_asc"/></form:option>
                <form:option value="labeldesc"><spring:message code="name_desc"/></form:option>
            </form:select>
            <div class="d-flex" style="justify-content: space-between">
                <label for="checkbox">Promotion</label>
                <form:checkbox path="ispromotion" id="checkbox"/>
            </div>
            <form:input cssClass="form-control" id="minprice" path="minprice" type="number" placeholder="Prix minimum"
                        maxlength="6"/>
            <form:input cssClass="form-control" id="maxprice" path="maxprice" type="number" placeholder="Prix maximum"
                        maxlength="6"/>
            <button class="btn btn-secondary" type="submit" id="submitbtn">
                <spring:message code="filter"/>
            </button>
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
                        errorText = "<spring:message code="filter_price_error" javaScriptEscape="true" />";
                    }
                    if (minprice.value < 0 || maxprice.value < 0) {
                        errorText = "<spring:message code="filter_min_price_error" javaScriptEscape="true" />";
                    }
                    if (minprice.value > 100000 || maxprice.value > 100000) {
                        errorText = "<spring:message code="filter_max_price_error" javaScriptEscape="true" />";
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
