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
                                <h2 style="margin-bottom: 60px"
                                ><spring:message code="home_title"/></h2>
                                <div class="slider_text_shape">
                                    <div class="slider_btn">
                                        <a class="btn btn-link" href="/product/Living%20Room%20Sofa-17"
                                           style="display: flex; align-items: center; justify-content: center;">
                                            <spring:message code="home_shopnow"/>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="slider_thumb">
                                <img src="../../assets/img/products/17-1.jpg" alt="">
                            </div>
                        </div>
                        <div class="single_slider swiper-slide d-flex align-items-center">
                            <div class="slider_text">
                                <h2 style="margin-bottom: 60px"
                                ><spring:message code="home_title"/></h2>
                                <div class="slider_text_shape">
                                    <div class="slider_btn">
                                        <a class="btn btn-link"
                                           style="display: flex; align-items: center; justify-content: center;"
                                           href="product/Living%20Room%20Chair-18">
                                            <spring:message code="home_shopnow"/>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="slider_thumb" style="width: 30vw">
                                <img src="../../assets/img/products/18-2.jpg" width="100%" alt="">
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
                    <c:forEach items="${products}" end="3" var="product">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a href="/product/${product.labelEn}-${product.id}">
                                            <img src="../../assets/img/products/${product.getImages().get(0)}.jpg"
                                                 alt=""
                                                 style="max-height: 200px;">
                                        </a>
                                    </div>
                                    <figcaption class="product_content">
                                        <h4><a href="/product/${product.labelEn}-${product.id}">
                                                ${product.getLocalizedLabel(locale)}
                                        </a></h4>

                                        <div class="price_box">
                                            <c:if test="${product.promotion != null}">
                                                <span class="old_price">${product.price}
                                                    <spring:message code="euro"/>
                                                </span>
                                            </c:if>
                                            <span class="current_price">${product.price * (1-(product.promotion.percentage / 100))}
                                                <spring:message code="euro"/>
                                            </span>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                    </c:forEach>
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
                        <a class="btn btn-link"
                           href="/product/Outdoor%20Sofa-11"
                           style="display: flex; align-items: center; justify-content: center; width: 200px"
                        >
                            <spring:message code="home_shopnow"/>
                        </a>
                    </div>
                </div>
            </div>
            <div class="banner_position_img">
                <img src="../../assets/img/products/11-1.jpg" alt="">
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