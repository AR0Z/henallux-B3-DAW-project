<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="h-100 h-custom">
        <div class="container h-100 py-3">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="h5">Shopping Bag</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
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

                    <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
                        <div class="card-body p-4">

                            <div class="row">
                                <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
                                    <form>

                                        <div class="d-flex flex-row">
                                            <div class="d-flex align-items-center pe-2">
                                                <input class="form-check-input" type="radio" name="radioNoLabel"
                                                    id="radioNoLabel3v" value="" aria-label="..." />
                                            </div>
                                            <div class="rounded border w-100 p-3">
                                                <p class="d-flex align-items-center mb-0">
                                                    <i class="fab fa-cc-paypal fa-2x fa-lg text-dark pe-2"></i>PayPal
                                                </p>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-6 col-lg-4 col-xl-6">
                                    <div class="row">
                                        <div class="col-12 col-xl-6">
                                            <div class="form-outline mb-4 mb-xl-5">
                                                <input type="text" id="typeName" class="form-control form-control-lg"
                                                    size="17" placeholder="John Smith" />
                                                <label class="form-label" for="typeName">Name on card</label>
                                            </div>

                                            <div class="form-outline mb-4 mb-xl-5">
                                                <%--@declare id="typeExp"--%>
                                                <input type="text" class="form-control form-control-lg"
                                                    placeholder="MM/YY" size="7" minlength="7" maxlength="7" />
                                                <label class="form-label" for="typeExp">Expiration</label>
                                            </div>
                                        </div>
                                        <div class="col-12 col-xl-6">
                                            <div class="form-outline mb-4 mb-xl-5">
                                                <%--@declare id="typetext"--%>
                                                <input type="text" class="form-control form-control-lg"
                                                    size="17" placeholder="1111 2222 3333 4444" minlength="19"
                                                    maxlength="19" />
                                                <label class="form-label" for="typeText">Card Number</label>
                                            </div>

                                            <div class="form-outline mb-4 mb-xl-5">
                                                <%--@declare id="typetext"--%>
                                                    <input type="password"
                                                    class="form-control form-control-lg"
                                                    placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3"
                                                    maxlength="3" />
                                                <label class="form-label" for="typeText">Cvv</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-xl-3">
                                    <div class="d-flex justify-content-between" style="font-weight: 500;">
                                        <p class="mb-2">Subtotal</p>
                                        <p class="mb-2" id="totalPrice">${cart.getTotalPrice()}</p>
                                    </div>

                                    <div class="d-flex justify-content-between" style="font-weight: 500;">
                                        <p class="mb-0">Shipping</p>
                                        <p class="mb-0">5€</p>
                                    </div>

                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                        <p class="mb-2">Total (tax included)</p>
                                        <p class="mb-2" id="totalPriceWithShippingCost">${cart.getTotalPriceWithShippingCost()}€</p>
                                    </div>

                                    <button type="button" class="btn btn-primary btn-block btn-lg">
                                        <span class="d-flex justify-content-between">
                                            <span>Checkout</span>
                                        </span>
                                    </button>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

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
</script>