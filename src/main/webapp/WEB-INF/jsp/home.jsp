<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./include/importTags.jsp" %>

<!-- CSS -->
<link rel="stylesheet" href="../../assets/swiper-bundle.min.css">
<link rel="stylesheet" href="../../assets/home.css">

<!-- slider section start -->
<section class="slider_section mb-170">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="slider_swiper swiper-container">
                    <div class="swiper-wrapper">
                        <div class="single_slider swiper-slide d-flex align-items-center">
                            <div class="slider_text">
                                <h2><spring:message code="home_title"/></h2>
                                <div class="slider_text_shape">
                                    <img src="../../assets/img/slider/slider-text-shape.png"/>
                                    <div class="slider_btn">
                                        <a class="btn btn-link" href="shop-left-sidebar.html">
                                            <spring:message code="home_shopnow"/>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="slider_thumb">
                                <img src="../../assets/img/slider/slider-shape1.png" alt="">
                            </div>
                        </div>
                        <div class="single_slider swiper-slide d-flex align-items-center">
                            <div class="slider_text">
                                <h2><spring:message code="home_title"/></h2>
                                <div class="slider_text_shape">
                                    <img src="../../assets/img/slider/slider-text-shape.png" alt="">
                                    <div class="slider_btn">
                                        <a class="btn btn-link" href="shop-left-sidebar.html">
                                            <spring:message code="home_shopnow"/>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="slider_thumb">
                                <img src="../../assets/img/slider/slider-shape1.png" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- slider section end -->
<!-- product section start -->
<div class="product_section mb-50">
    <div class="container">
        <div class="product_tab_button">
            <ul class="nav justify-content-center" role="tablist" id="nav-tab">
                <li>
                    <a class="active" data-toggle="tab" href="#seller" role="tab" aria-controls="seller"
                       aria-selected="false">
                        <spring:message code="home_bestSeller"/>
                    </a>
                </li>
            </ul>
        </div>
        <div class="tab-content product_container">
            <div class="product_gallery">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a href="single-product.html">
                                        <img src="../../assets/img/product/product5.png" alt="">
                                    </a>
                                </div>
                                <figcaption class="product_content">
                                    <h4><a href="single-product.html">Tufted accent chair with wood legs,
                                        Beige</a></h4>
                                    <div class="price_box">
                                        <span class="old_price">$399.99</span>
                                        <span class="current_price">$129.99</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a href="single-product.html">
                                        <img src="../../assets/img/product/product6.png" alt="">
                                    </a>
                                    <div class="label_product">
                                        <span class="label_sale">Sale</span>
                                    </div>
                                </div>
                                <figcaption class="product_content">
                                    <h4><a href="single-product.html">Tufted accent chair with wood legs,
                                        Beige</a></h4>
                                    <div class="price_box">
                                        <span class="current_price">$129.99</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a href="single-product.html"><img src="../../assets/img/product/product7.png"
                                                                       alt=""></a>
                                </div>
                                <figcaption class="product_content">
                                    <h4><a href="single-product.html">Tufted accent chair with wood legs,
                                        Beige</a></h4>
                                    <div class="price_box">
                                        <span class="old_price">$399.99</span>
                                        <span class="current_price">$129.99</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a href="single-product.html"><img src="../../assets/img/product/product8.png"
                                                                       alt=""></a>
                                </div>
                                <figcaption class="product_content">
                                    <h4><a href="single-product.html">Tufted accent chair with wood legs,
                                        Beige</a></h4>
                                    <div class="price_box">
                                        <span class="old_price">$399.99</span>
                                        <span class="current_price">$129.99</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a href="single-product.html"><img src="../../assets/img/product/product1.png"
                                                                       alt=""></a>
                                    <div class="label_product">
                                        <span class="label_hot">hot</span>
                                    </div>
                                </div>
                                <figcaption class="product_content">
                                    <h4><a href="single-product.html">Tufted accent chair with wood legs,
                                        Beige</a></h4>
                                    <div class="price_box">
                                        <span class="old_price">$399.99</span>
                                        <span class="current_price">$129.99</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a href="single-product.html"><img src="../../assets/img/product/product2.png"
                                                                       alt=""></a>
                                </div>
                                <figcaption class="product_content">
                                    <h4><a href="single-product.html">Tufted accent chair with wood legs,
                                        Beige</a></h4>
                                    <div class="price_box">
                                        <span class="old_price">$399.99</span>
                                        <span class="current_price">$129.99</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a href="single-product.html"><img src="../../assets/img/product/product3.png"
                                                                       alt=""></a>
                                </div>
                                <figcaption class="product_content">
                                    <h4><a href="single-product.html">Tufted accent chair with wood legs,
                                        Beige</a></h4>
                                    <div class="price_box">
                                        <span class="old_price">$399.99</span>
                                        <span class="current_price">$129.99</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a href="single-product.html"><img src="../../assets/img/product/product4.png"
                                                                       alt=""></a>
                                </div>
                                <figcaption class="product_content">
                                    <h4><a href="single-product.html">Tufted accent chair with wood legs,
                                        Beige</a></h4>
                                    <div class="price_box">
                                        <span class="old_price">$399.99</span>
                                        <span class="current_price">$129.99</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- product section end -->

<!-- shipping area start -->
<section class="shipping_section mb-105">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="shipping_inner d-flex justify-content-between">
                    <div class="single_shipping">
                        <div class="shipping_title d-flex align-items-center wow fadeInUp" data-wow-delay="0.1s"
                             data-wow-duration="1.1s">
                            <img src="../../assets/img/others/shipping1.png" alt="">
                            <h3>
                                <spring:message code="home_manyChoices"/>
                            </h3>
                        </div>
                        <div class="shipping_desc wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1.2s">
                            <p>
                                <spring:message code="home_manyChoices_text"/>
                            </p>
                        </div>
                    </div>
                    <div class="single_shipping">
                        <div class="shipping_title d-flex align-items-center wow fadeInUp" data-wow-delay="0.1s"
                             data-wow-duration="1.1s">
                            <img src="../../assets/img/others/shipping2.png" alt="">
                            <h3>
                                <spring:message code="home_goodFacilities"/>
                            </h3>
                        </div>
                        <div class="shipping_desc wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1.2s">
                            <p>
                                <spring:message code="home_goodFacilities_text"/>
                            </p>
                        </div>
                    </div>
                    <div class="single_shipping">
                        <div class="shipping_title d-flex align-items-center wow fadeInUp" data-wow-delay="0.1s"
                             data-wow-duration="1.1s">
                            <img src="../../assets/img/others/shipping3.png" alt="">
                            <h3>
                                <spring:message code="home_affordablePrice"/>
                            </h3>
                        </div>
                        <div class="shipping_desc wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1.2s">
                            <p>
                                <spring:message code="home_affordablePrice_text"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- shipping area end -->


<!-- banner advice section start -->
<section class="banner_advice_section mb-100">
    <div class="container">
        <div class="banner_advice_inner">
            <div class="row">
                <div class="col-lg-5 offset-lg-7 col-md-5 offset-md-7">
                    <div class="banner_advice_text">
                        <h3 class="wow fadeInUp" data-wow-delay="0.1s" data-wow-duration="1.1s">
                            <spring:message code="home_armchair"/>
                        </h3>
                        <a class="btn btn-link wow fadeInUp" href="#" data-wow-delay="0.2s"
                           data-wow-duration="1.2s">
                            <spring:message code="home_shopnow"/>
                        </a>
                    </div>
                </div>
            </div>
            <div class="banner_position_img">
                <img src="../../assets/img/others/armchair.png" alt="">
            </div>
        </div>
    </div>
    <div class="banner_position_text">
        <h2>
            <spring:message code="home_armchair"/>
        </h2>
    </div>
</section>
<!-- Main JS -->
<script src="../../assets/js/main.js"></script>