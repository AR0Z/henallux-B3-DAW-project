<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="./include/importTags.jsp" %>

<style>
    #product-wrapper {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
    }

    #infos {
        width: 80%;
    }

    #similar {
        width: 20%;
        height: 100%;
    }

    @media screen and (max-width: 1500px) {
        #product-wrapper {
            flex-direction: column;
        }

        #infos {
            width: 100%;
        }

        #similar {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            padding: 10px;
        }

    }
</style>
<div id="product-wrapper">
    <div id="infos" class="py-5">
        <div class="container">
            <div class="row gx-5">
                <aside class="col-lg-6">
                    <div id="carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carousel" data-bs-slide-to="0" class="active"
                                    aria-current="true" aria-label="Slide 1" style="background-color: darkred"></button>
                            <button type="button" data-bs-target="#carousel" data-bs-slide-to="1"
                                    aria-label="Slide 2" style="background-color: darkred"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../../assets/img/products/${product.getImages().get(0)}.jpg"
                                     class="d-block w-100" alt="400" style="max-height: 620px">
                            </div>
                            <div class="carousel-item">
                                <img src="../../assets/img/products/${product.getImages().get(1)}.jpg"
                                     class="d-block w-100" alt="500">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel"
                                data-bs-slide="prev" style="color: darkred">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carousel"
                                data-bs-slide="next" style="color: darkred">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <script>
                        new bootstrap.Carousel(document.getElementById('carousel'), {
                            interval: 2000,
                        })
                    </script>
                </aside>
                <main class="col-lg-6">
                    <div class="ps-lg-3">
                        <h4 class="title text-dark">
                            ${product.getLocalizedLabel(locale)}
                        </h4>
                        <div class="d-flex flex-row my-3">
                            <c:if test="${product.stock >0}">
                            <span class="badge bg-success me-2">
                                <spring:message code="product_instock"/>
                            </span>
                            </c:if>
                            <c:if test="${product.stock <=0}">
                            <span class="badge bg-danger me-2">
                                <spring:message code="product_notInstock"/>
                            </span>
                            </c:if>
                        </div>

                        <div class="mb-3">
                        <span class="h5">
                            <span
                                    <c:if test="${product.isPromotion}">class="red"</c:if> >${String.format("%.2f",product.price)}</span>
                                <c:if test="${product.isPromotion}">
                                    <del>${product.oldPrice}</del>
                                </c:if>
                                <spring:message code="euro"/>
                        </span>
                            <span class="text-muted">/
                            <spring:message code="product_each"/>
                        </span>
                        </div>

                        <p>
                            ${product.getLocalizedDescription(locale)}
                        </p>

                        <div class="row">
                            <dt class="col-3">
                                <spring:message code="product_size"/>
                                :
                            </dt>
                            <dd class="col-9">${product.dimension}</dd>

                            <dt class="col-3">
                                <spring:message code="product_weight"/>
                                :
                            </dt>
                            <dd class="col-9">${product.weight}</dd>

                            <dt class="col-3">
                                <spring:message code="product_category"/>
                                :
                            </dt>
                            <dd class="col-9">${product.getCategoryId().getLocalizedLabel(locale)}</dd>
                            <dt class="col-3">Stock:</dt>
                            <dd class="col-9">${product.stock}</dd>
                        </div>

                        <hr/>
                        <div class="row mb-4">
                            <div class="col-md-4 col-6 mb-3">
                                <label class="mb-2 d-block">Quantity</label>
                                <div class="input-group mb-3" style="width: 170px;">
                                    <button class="btn btn-white border border-secondary px-3" type="button"
                                            data-mdb-ripple-color="dark">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <input id="quantity" type="number"
                                           class="form-control text-center border border-secondary"
                                           placeholder="14" value="1" aria-label="Example text with button addon"
                                           aria-describedby="button-addon1"/>
                                    <button class="btn btn-white border border-secondary px-3" type="button"
                                            data-mdb-ripple-color="dark">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="p-2" id="displayMessage"></div>
                        <button type="submit" id="sumbitAddProduct" class="btn btn-primary shadow-0"><i
                                class="me-1 fa fa-shopping-basket"></i> <spring:message code="button_addToCart"/>
                        </button>
                    </div>
                </main>
            </div>
        </div>
    </div>
    <c:if test="${similarProducts.size() != 0}">
        <div id="similar" class="bg-light">
            <div class="card border rounded-2 shadow-0" style="width: 300px !important; padding: 10px">
                <h5 class="card-title" style="width: 200px">
                    <spring:message code="similar"/>
                </h5>

                    <%--@elvariable id="similarProducts" type="java.util.List<com.spring.henallux.ecommerce.Model.Product>"--%>
                <c:forEach var="p" items="${similarProducts}" end="3">
                    <div class="d-flex mb-3" style="width: 200px">
                        <a href="/product/${p.labelEn}-${p.id}" class="me-3">
                            <img src="../../assets/img/products/${p.getImages().get(0)}.jpg"
                                 style="min-width: 96px; height: 96px;"
                                 class="img-md img-thumbnail"/>
                        </a>
                        <div class="info">
                            <a href="/product/${p.labelEn}-${p.id}" class="nav-link mb-1">
                                    ${p.getLocalizedLabel(locale)}
                            </a>
                            <strong class="text-dark">${p.price}e</strong>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </c:if>
</div>
<script>
    let quantity = document.getElementById("quantity");

    quantity.addEventListener("input", function () {
        if (this.value !== "" && this.value < 1)
            this.value = 1;
    });

    const increaseButton = quantity.nextElementSibling;
    increaseButton.addEventListener("click", function () {
        quantity.stepUp();
        quantity.dispatchEvent(new Event("input"));
    });

    // Ajoutez ces lignes pour gérer le bouton de moins
    const decreaseButton = quantity.previousElementSibling;
    decreaseButton.addEventListener("click", function () {
        quantity.stepDown();
        quantity.dispatchEvent(new Event("input"));
    });

    let submitAddProduct = document.getElementById("sumbitAddProduct");
    submitAddProduct.addEventListener("click", function () {
        let quantity = document.getElementById("quantity").value;
        const apiUrl = "/cart/addProduct";
        const data = new URLSearchParams();
        data.append("productId", ${product.id});
        data.append("quantity", quantity);

        fetch(apiUrl, {
            method: "POST",
            body: data
        }).then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        }).then(data => {
            let displayMessage = document.getElementById("displayMessage");
            displayMessage.innerHTML = "";
            if (data.success) {
                let span = document.createElement("span");
                span.classList.add("text-success");
                span.innerText = data.success;
                displayMessage.appendChild(span);
            } else {
                let span = document.createElement("span");
                span.classList.add("text-danger");
                span.innerText = data.error;
                displayMessage.appendChild(span);
            }
        }).catch(error => {
            console.log(error);
        });

    });
</script>