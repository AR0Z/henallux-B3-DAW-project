<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    body {
        color: grey;
    }

    #sidebar {
        width: 20%;
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

    .teal {
        color: rgb(69, 129, 129);
    }

    .blue {
        color: #0000ff;
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
    <section id="sidebar">
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
                    <span class="fa fa-circle pr- teal"></span>Teal
                </a></li>
                <li class="list-group-item list-group-item-action mb-2 rounded"><a href="#">
                    <span class="fa fa-circle pr-1 blue"></span>Blue
                </a></li>
            </ul>
        </div>
        <div>
            <h6>Type</h6>
            <form class="ml-md-2">
                <div class="form-inline border rounded p-sm-2 my-2">
                    <input type="radio" name="type">
                    <label for="boring" class="pl-1 pt-sm-0 pt-1">Boring</label>
                </div>
                <div class="form-inline border rounded p-sm-2 my-2">
                    <input type="radio" name="type">
                    <label for="ugly" class="pl-1 pt-sm-0 pt-1">Ugly</label>
                </div>
                <div class="form-inline border rounded p-md-2 p-sm-1">
                    <input type="radio" name="type">
                    <label for="notugly" class="pl-1 pt-sm-0 pt-1">Not Ugly</label>
                </div>
            </form>
        </div>
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
