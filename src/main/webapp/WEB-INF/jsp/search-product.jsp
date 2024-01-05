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

    #products {
        width: 80%;
        padding: 10px;
        margin: 0;
        float: right;
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

    .filter {
        display: none;
        padding: 0;
        margin: 0;
    }

    @media (min-width: 991px) {
        .card {
            width: 190px;
            display: inline-block;
            height: 300px;
        }

        .card-img-top {
            width: 188px;
            height: 210px;
        }

        #mobile-filter {
            display: none;
        }
    }

    @media (min-width: 768px) and (max-width: 991px) {
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

        #mobile-filter {
            display: none;
        }
    }

    @media (min-width: 568px) and (max-width: 767px) {
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

        .list-group-item {
            padding: 3px;
        }

        .offset-1 {
            margin-left: 8%;
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
</style>
<section>
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
</section>
<section id="products">
    <div class="container">
        <div class="row">
            <c:forEach var="product" items="${products}">
                <a href="product/${product.labelEn}-${product.id}">

                    <div class="col-lg-3 col-sm-4 col-11 offset-sm-0 offset-1">
                        <div class="card">
                            <img class="card-img-top" src="https://placehold.co/400" alt="Card image cap">
                            <div class="card-body">
                                <p class="card-text">${product.getLocalizedLabel(locale)}</p>

                                <p>
                                    <span <c:if test="${product.isPromotion}">class="red"</c:if> >${product.price}</span>
                                    <c:if test="${product.isPromotion}">
                                        <del>${product.oldPrice}</del>
                                    </c:if>
                                    euros
                                </p>
                                <span class="fa fa-circle red"></span>
                                <span class="fa fa-circle teal"></span>
                                <span class="fa fa-circle blue"></span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</section>