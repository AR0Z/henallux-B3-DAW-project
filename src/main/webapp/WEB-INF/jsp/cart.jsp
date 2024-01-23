<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./include/importTags.jsp" %>

<section style="min-height: 75%">
    <div class="container py-3">
        <div class="col d-flex w-100" style="justify-content: space-between">
            <div class="table-responsive w-100">
                <c:if test="${isEmpty}">
                    <div class="w-100 d-flex justify-content-center">
                        <spring:message code="cart_empty"/>
                    </div>
                </c:if>
                <c:if test="${!isEmpty}">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" class="h5">
                                <spring:message code="cart_bag"/>
                            </th>
                            <th scope="col">
                                <spring:message code="cart_quantity"/>
                            </th>
                            <th scope="col">
                                <spring:message code="cart_price"/>
                            </th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="entry" items="${cart.cartLines.entrySet()}">
                            <c:set var="cartLine" value="${entry.value}"/>
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="../../assets/img/products/${cartLine.product.getImages().get(0)}.jpg"
                                             class="img-fluid rounded-3"
                                             style="width: 120px; height: 100px" alt="Book">
                                        <div class="flex-column ms-4">
                                            <p class="mb-2">${cartLine.product.getLocalizedLabel(locale)}</p>
                                        </div>
                                    </div>
                                </th>
                                <td class="align-middle">
                                    <div class="d-flex flex-row">
                                        <button class="btn btn-link px-2">
                                            <i class="fas fa-minus"></i>
                                        </button>

                                        <input min="0" name="quantity" data-product-id="${cartLine.product.id}"
                                               value="${cartLine.quantity}" type="number"
                                               class="form-control form-control-sm editQuantity" style="width: 50px;"/>

                                        <button class="btn btn-link px-2">
                                            <i class="fas fa-plus"></i>
                                        </button>

                                        <p class="text-danger px-2 pt-3"></p>
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <p class="mb-0" style="font-weight: 500;">${cartLine.product.price}</p>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
            <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;width: 30rem; height: 17rem">
                <div class="card-body">
                    <div style="width: 100%">
                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                            <p class="mb-2">
                                <spring:message code="cart_subTotal"/>
                            </p>
                            <p class="mb-2" id="totalPrice">${cart.getTotalPrice()}</p>
                        </div>

                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                            <p class="mb-0">
                                <spring:message code="cart_shipping"/>
                            </p>
                            <p class="mb-0">5 <spring:message code="euro"/></p>
                        </div>

                        <hr class="my-4">

                        <div class="d-flex justify-content-between mb-4 w-100" style="font-weight: 500;">
                            <p class="mb-2">
                                <spring:message code="cart_total"/>
                            </p>
                            <p class="mb-2" id="totalPriceWithShippingCost">${cart.getTotalPriceWithShippingCost()}
                                <spring:message code="euro"/></p>
                        </div>
                    </div>
                    <div id="dislayCheckout"></div>
                    <button class="btn w-100" id="submitCart">
                        <spring:message code="cart_checkout"/>
                    </button>
                </div>

            </div>
        </div>
    </div>
    </div>
</section>
<script>
    const quantityInputs = document.getElementsByClassName("editQuantity");
    const submitCart = document.getElementById("submitCart");
    submitCart.disabled = quantityInputs.length === 0;

    for (let quantityInput of quantityInputs) {
        quantityInput.addEventListener("input", function () {
            const productId = quantityInput.dataset.productId; // Obtenez l'ID du produit depuis l'attribut data
            let quantity = quantityInput.value;

            const apiUrl = "/cart/editQuantity";
            const data = new URLSearchParams();
            data.append("productId", productId);

            if (quantity !== "") {
                if (quantity <= 0) {
                    quantityInput.value = 0;
                    quantity = 0;
                }

                if (quantity === 0) {
                    quantityInput.parentNode.parentNode.parentNode.remove();
                }

                data.append("quantity", quantity);

                if (quantity >= 0)

                    fetch(apiUrl, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/x-www-form-urlencoded",
                        },
                        body: data,
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error(`HTTP error! Status: ${response.status}`);
                            }
                            return response.json();
                        })
                        .then(data => {
                            // Logique à exécuter après la réception de la réponse
                            let errorDisplay = this.parentNode.querySelector(".text-danger")

                            if (data.success) {
                                errorDisplay.innerText = "";
                                // Mettez à jour le prix ou toute autre logique nécessaire ici
                                const totalPriceElement = document.getElementById("totalPrice");
                                const totalPriceWithShippingCostElement = document.getElementById("totalPriceWithShippingCost");

                                // Utilisez les propriétés déstructurées
                                const {totalPrice, totalPriceWithShippingCost} = data;

                                totalPriceElement.innerText = totalPrice;
                                totalPriceWithShippingCostElement.innerText = totalPriceWithShippingCost;
                                submitCart.disabled = quantityInputs.length === 0;

                            } else if (data.error) {
                                quantityInput.value = data.maxQuantity;
                                errorDisplay.innerText = data.error;
                            }
                        })
                        .catch(error => {
                            console.error("Fetch error:", error);
                        });
            }
        });

        // Ajoutez ces lignes pour gérer le bouton de plus
        const increaseButton = quantityInput.nextElementSibling;
        increaseButton.addEventListener("click", function () {
            quantityInput.stepUp();
            quantityInput.dispatchEvent(new Event("input"));
        });

        // Ajoutez ces lignes pour gérer le bouton de moins
        const decreaseButton = quantityInput.previousElementSibling;
        decreaseButton.addEventListener("click", function () {
            quantityInput.stepDown();
            quantityInput.dispatchEvent(new Event("input"));
        });
    }


    submitCart.addEventListener("click", function () {
        const apiUrl = "/order/create";
        let display = document.getElementById("dislayCheckout");
        display.innerText = "";
        fetch(apiUrl, {
            method: "POST",
            credentials: "include",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                console.log(data)
                // Logique à exécuter après la réception de la réponse
                if (data.status === "success") {
                    window.location.href = "/order/" + data.orderId;
                } else {
                    display.innerText = data.message;
                }
            })
            .catch(error => {
                console.error("Fetch error:", error);
            });
    });

</script>