<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./include/importTags.jsp" %>

<section style="min-height: 75%">
        <div class="container py-3">
            <div class="col d-flex w-100" style="justify-content: space-between">
                <div class="table-responsive w-100">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="h5">
                                        <spring:message code="cart_bag" />
                                    </th>
                                    <th scope="col">
                                        <spring:message code="cart_quantity" />
                                    </th>
                                    <th scope="col">
                                        <spring:message code="cart_price" />
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="entry" items="${cart.cartLines.entrySet()}">
                                <c:set var="cartLine" value="${entry.value}" />
                                   <tr>
                                       <th scope="row">
                                           <div class="d-flex align-items-center">
                                               <img src="https://placehold.co/400" class="img-fluid rounded-3"
                                                    style="width: 120px;" alt="Book">
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

                                               <input min="0" name="quantity" data-product-id="${cartLine.product.id}" value="${cartLine.quantity}" type="number"
                                                      class="form-control form-control-sm editQuantity" style="width: 50px;" />

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
                    </div>
                <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;width: 30rem; height: 17rem">
                        <div class="card-body">
                                <div style="width: 100%">
                                    <div class="d-flex justify-content-between" style="font-weight: 500;">
                                        <p class="mb-2">
                                            <spring:message code="cart_subTotal" />
                                        </p>
                                        <p class="mb-2" id="totalPrice">${cart.getTotalPrice()}</p>
                                    </div>

                                    <div class="d-flex justify-content-between" style="font-weight: 500;">
                                        <p class="mb-0">
                                            <spring:message code="cart_shipping" />
                                        </p>
                                        <p class="mb-0">5 euros</p>
                                    </div>

                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-4 w-100" style="font-weight: 500;">
                                        <p class="mb-2">
                                            <spring:message code="cart_total" />
                                        </p>
                                        <p class="mb-2" id="totalPriceWithShippingCost">${cart.getTotalPriceWithShippingCost()} euros</p>
                                    </div>
                                </div>
                                <div id="paypal-button-container"></div>
                            </div>

                        </div>
                    </div>
            </div>
        </div>
    </section>
<script src="https://www.paypal.com/sdk/js?client-id=AfU8BZvjjUfdv1YamBcsaBux8--rf9HUnG2aAw2GbdNGdAC0fWIG1tg2RrPWo2BHY7W3GlqB6GG0TuO-&currency=EUR&disable-funding=card,credit,bancontact,sofort"></script>
<script>
    const quantityInputs = document.getElementsByClassName("editQuantity");

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

                if(quantity >= 0)
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

                        if(data.success) {
                            errorDisplay.innerText = "";
                            // Mettez à jour le prix ou toute autre logique nécessaire ici
                            const totalPriceElement = document.getElementById("totalPrice");
                            const totalPriceWithShippingCostElement = document.getElementById("totalPriceWithShippingCost");

                            // Utilisez les propriétés déstructurées
                            const { totalPrice, totalPriceWithShippingCost } = data;

                            totalPriceElement.innerText = totalPrice;
                            totalPriceWithShippingCostElement.innerText = totalPriceWithShippingCost;
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

    const sumbitCart = document.getElementById("sumbitCart");

    window.paypal.Buttons({
        async createOrder() {
            try {
                const response = await fetch("/payment/paypal", {
                    method: "POST",
                    credentials: 'include'
                });

                // Vérifiez si la réponse a un statut OK (200)
                if (response.ok) {
                    const orderData = await response.json();

                    if (orderData.id) {
                        // Si l'ID de la commande est présent, retournez-le
                        return orderData.id;
                    } else {
                        // Sinon, lancez une exception ou retournez une valeur spécifique pour indiquer une erreur
                        throw new Error("Invalid response from server. Missing order ID.");
                    }
                } else {
                    // Si la réponse n'est pas OK, lancez une exception ou retournez une valeur spécifique pour indiquer une erreur
                    throw new Error("Server returned an error: " + response.status);
                }
            } catch (error) {
                // Gérez l'erreur ici, vous pouvez la journaliser ou prendre d'autres mesures
                console.error("Error creating order:", error);
                return false; // Retournez une valeur indiquant une erreur
            }
        },
        async onApprove(data, actions) {
            const reponse = await fetch("/payment/paypal/capture/" + data.orderID, {
                method: "POST",
                credentials: 'include'
            });

            const captureData = await reponse.json();

            if(captureData.status) {
                window.location.href = "/payment/success";
            } else {
                window.location.href = "/payment/error";
            }

        },
        async onCancel(data, actions) {
            const reponse = await fetch("/payment/paypal/cancel/", {
                method: "POST",
                credentials: 'include'
            });

            const cancelData = await reponse.json();

            if(cancelData.status) {
                window.location.href = "/payment/cancel";
            } else {
                window.location.href = "/payment/error";
            }

        },
    }).render("#paypal-button-container");
</script>