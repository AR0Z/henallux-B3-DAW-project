<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
    body {
        color: grey;
    }

    #products {
        width: 80%;
        padding: 10px;
        margin: auto;
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

    .teal {
        color: rgb(69, 129, 129);
    }

    .blue {
        color: #0000ff;
    }

    .card {
        width: 250px;
        display: inline-block;
        height: 300px;
    }

    .card-img-top {
        width: 250px;
        height: 210px;
    }

    .card-body p {
        margin: 2px;
    }

    .card-body {
        padding: 0;
        padding-left: 2px;
    }


    @media(min-width:991px) {
        .card {
            width: 190px;
            display: inline-block;
            height: 300px;
        }

        .card-img-top {
            width: 188px;
            height: 210px;
        }
    }

    @media(min-width:768px) and (max-width:991px) {
        .card {
            width: 230px;
            display: inline-block;
            height: 300px;
            margin-bottom: 10px;
        }

        .card-img-top {
            width: 230px;
            height: 210px;
        }
    }

    @media(min-width:568px) and (max-width:767px) {
        .card {
            width: 205px;
            display: inline-block;
            height: 300px;
            margin-bottom: 10px;
        }

        .card-img-top {
            width: 203px;
            height: 210px;
        }

        .fa-circle {
            font-size: 15px;
        }
    }

    @media(max-width:567px) {

        #products {
            width: 100%;
            padding: 5px;
            margin: 0;
            float: right;
        }

        .card {
            width: 230px;
            display: inline-block;
            height: 300px;
            margin-bottom: 10px;
            margin-top: 10px;
        }

        .card-img-top {
            width: 230px;
            height: 210px;
        }

        .offset-1 {
            margin-left: 8%;
        }
    }
</style>

<section id="products">
    <div class="container">
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-lg-3 col-sm-4 col-11 offset-sm-0 offset-1">
                    <a href="/product/${product.labelEn}-${product.id}" >
                        <div class="card">
                            <img class="card-img-top"
                                 src="https://images.pexels.com/photos/963486/pexels-photo-963486.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                 alt="Card image cap">
                            <div class="card-body">
                                <p class="card-text">
                                    <c:if test="${product.stock >0}">
                                        <span class="badge bg-success me-2">
                                            <spring:message code="product_instock" />
                                        </span>
                                    </c:if>
                                    <c:if test="${product.stock <=0}">
                                        <span class="badge bg-danger me-2">
                                            <spring:message code="product_notInstock" />
                                        </span>
                                    </c:if>
                                    ${product.getLocalizedLabel(locale)}
                                </p>
                                <p>${product.price} euros</p>
                                <span class="fa fa-circle red" ></span>
                                <span class="fa fa-circle teal" ></span>
                                <span class="fa fa-circle blue" ></span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>