<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./include/importTags.jsp" %>

<section class="h-100 h-custom">
    <div class="container h-100 py-3">
        <div class="col d-flex h-100 w-100" style="justify-content: space-between">
            <div class="table-responsive w-100">
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
                    <c:forEach var="entry" items="${order.getOrderLines()}">
                        <c:set var="orderLine" value="${entry.value}"/>
                        <tr>
                            <th scope="row">
                                <div class="d-flex align-items-center">
                                    <img src="https://placehold.co/400" class="img-fluid rounded-3"
                                         style="width: 120px;" alt="Book">
                                    <div class="flex-column ms-4">
                                        <p class="mb-2">${orderLine.product.getLocalizedLabel(locale)}</p>
                                    </div>
                                </div>
                            </th>
                            <td class="align-middle">
                                <div class="d-flex flex-row">
                                        ${orderLine.quantity}
                                </div>
                            </td>
                            <td class="align-middle">
                                <p class="mb-0" style="font-weight: 500;">${orderLine.price}</p>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="card shadow-2-strong mb-5 mb-lg-0"
                 style="border-radius: 16px;width: 30rem; height: 300px">
                <div class="card-body">
                    <div style="width: 100%">
                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                            <p class="mb-2">
                                <spring:message code="cart_subTotal"/>
                            </p>
                            <p class="mb-2" id="totalPrice">${order.getTotalPrice()}</p>
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
                            <p class="mb-2" id="totalPriceWithShippingCost">${order.getTotalPriceWithShippingCost()}
                                <spring:message code="euro"/></p>
                        </div>
                        <c:if test="${order.status eq 'Pending'}">
                            <div id="paypal-button-container"></div>
                        </c:if>
                        <c:if test="${order.status eq 'Paid'}">
                            <div class="alert alert-success">
                                <spring:message code="order_paid"/>
                            </div>
                        </c:if>
                        <c:if test="${order.status eq 'Canceled'}">
                            <div class="alert alert-danger">
                                <spring:message code="order_canceled"/>
                            </div>
                        </c:if>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>
</section>

<c:if test="${order.status eq 'Pending'}">
    <script src="https://www.paypal.com/sdk/js?client-id=AfU8BZvjjUfdv1YamBcsaBux8--rf9HUnG2aAw2GbdNGdAC0fWIG1tg2RrPWo2BHY7W3GlqB6GG0TuO-&currency=EUR&disable-funding=card,credit,bancontact,sofort"></script>
    <script>
        window.paypal.Buttons({
            async createOrder() {
                try {
                    const response = await fetch("/payment/paypal?orderId=${order.id}", {
                        method: "POST",
                        credentials: 'include'
                    });


                    // Vérifiez si la réponse a un statut OK (200)
                    if (response.ok) {
                        const orderData = await response.json();
                        console.log(orderData);
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
                const reponse = await fetch("/payment/paypal/capture/" + data.orderID + "?orderId=${order.id}", {
                    method: "POST",
                    credentials: 'include'
                });

                const captureData = await reponse.json();

                if (captureData.status) {
                    window.location.href = "/payment/paypal/success";
                } else {
                    window.location.href = "/payment/paypal/error";
                }

            },
            async onCancel(data, actions) {
                const reponse = await fetch("/payment/paypal/cancel?orderId=${order.id}", {
                    method: "POST",
                    credentials: 'include'
                });

                const cancelData = await reponse.json();

                if (cancelData.status) {
                    window.location.href = "/payment/paypal/cancel";
                } else {
                    window.location.href = "/payment/paypal/error";
                }

            },
        }).render("#paypal-button-container");
    </script>
</c:if>
