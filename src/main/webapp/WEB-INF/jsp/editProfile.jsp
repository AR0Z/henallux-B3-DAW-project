<%@ include file="./include/importTags.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>
<div class="wrapper d-flex align-items-center " style="min-height:75vh;width:100%;flex-direction: column">
    <section id="orders">
        <table class="table table-striped table-hover">
            <thead>
            <tr>

                <th scope="col">Date de commande</th>
                <th scope="col">Statut</th>
                <th scope="col">Prix total</th>
                <th scope="col">Details</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td>${order.date}</td>
                    <td>${order.status}</td>
                    <td>${order.totalPrice}</td>
                    <td><a href="/order/${order.id}">Details</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>

    <section class="background-image mb-2" style="width: 50vw; ">
        <div class="container d-flex align-items-center justify-content-center ">
            <form:form class="col g-4 needs-validation d-flex align-items-center justify-content-center flex-column"
                  id="needs-validation" novalidate="" modelAttribute="user" method="post">
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.lastName}" aria-label="Nom" name="lastname"
                               data-mdb-input-init="" required="true" pattern="[A-Za-z]{2,}" path="lastName"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_name" />
                        </div>
                    </div>
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.firstName}" aria-label="Prenom" name="name"
                               data-mdb-input-init="" required="true" pattern="[A-Za-z]{2,}" path="firstName" />
                        <div class="invalid-feedback">
                            <spring:message code="register_error_firstname" />
                        </div>
                    </div>
                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="email" class="form-control" value="${user.email}" name="email"
                               aria-label="Adresse mail" data-mdb-input-init="" required="true"
                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" path="email" />
                        <div class="invalid-feedback">
                            <spring:message code="register_error_email" />
                        </div>
                    </div>
                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.phoneNumber}" name="phone"
                               aria-label="Numéro de téléphone" data-mdb-input-init="" required="true"
                               pattern="\+[0-9]{1,3}[0-9]{9}" path="phoneNumber" />
                        <div class="invalid-feedback">
                            <spring:message code="register_error_phone" />
                        </div>
                    </div>
                </div>

                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.deliveryAddress}" aria-label="Adresse"
                               name="address" data-mdb-input-init="" required="true" path="deliveryAddress" />
                        <div class="invalid-feedback">
                            <spring:message code="register_error_address" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <spring:message code="register_zipcode" var="zipcode"/>
                        <input type="text" class="form-control" placeholder="${zipcode}" name="zipCode"
                               aria-label="Code Postal" data-mdb-input-init required pattern="[0-9]{4,5}">
                        <div class="invalid-feedback">
                            <spring:message code="register_error_zipcode" />
                        </div>
                    </div>
                </div>

                <div class="col-2">
                    <button class="btn btn-primary" type="submit" data-mdb-ripple-init>
                        <spring:message code="edit_button" />
                    </button>
                </div>
            </form:form>
        </div>
    </section>
    <section id="passwordChange">
        <form:form modelAttribute="passwordchangeform">
            <form:input class="form-control mt-2" path="oldPassword" type="password" placeholder="Ancien mot de passe" />
            <form:input class="form-control mt-2" path="newPassword" type="password" placeholder="Nouveau mot de passe" />
            <form:input class="form-control mt-2" path="newPasswordConfirm" type="password" placeholder="Confirmer le nouveau mot de passe" />
            <form:button class="btn btn-primary mt-2" type="submit">Changer le mot de passe</form:button>
        </form:form>
    </section>
</div>