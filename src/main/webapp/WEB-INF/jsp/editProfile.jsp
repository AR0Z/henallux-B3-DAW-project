<%@ include file="./include/importTags.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>
<div class="wrapper d-flex align-items-center " style="min-height:75vh;width:100%;flex-direction: column">
    <section id="orders" style="border-bottom: 1px solid black">
        <c:if test="${not empty orders}">
            <h2 class="text-center">Mes commandes :</h2>
            <div style="overflow-y: auto;max-height: 300px">
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
                    <c:forEach items="${orders}" var="entry">
                        <c:set var="order" value="${entry.value}"/>
                        <tr>
                            <td>${order.date}</td>
                            <td class="d-flex" style="justify-content: center">
                                <img height="18" src="${order.getStatusIcon()}"/>
                            </td>
                            <td>${order.getTotalPrice()}</td>
                            <td><a href="/order/${order.id}">Details</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>
        </c:if>
        <c:if test="${empty orders}">
            <h2 class="text-center">Vous n'avez pas encore passe de commande</h2>
        </c:if>
    </section>

    <section class="background-image mt-4 mb-2" style="width: 100%; ">
        <div class="container d-flex align-items-center justify-content-center w-50 ">
            <%--@elvariable id="user" type="com.spring.henallux.ecommerce.Model.User"--%>
            <form:form class="col g-4 needs-validation d-flex align-items-center justify-content-center flex-column"
                       id="needs-validation" novalidate="" modelAttribute="user" method="post"
                       action="/editProfile/profile">
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.lastName}" aria-label="Nom"
                                    name="lastname"
                                    data-mdb-input-init="" required="true" pattern="[A-Za-z\-]{2,}" path="lastName"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_name"/>
                        </div>
                    </div>
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.firstName}" aria-label="Prenom"
                                    name="name"
                                    data-mdb-input-init="" required="true" pattern="[A-Za-z]{2,}" path="firstName"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_firstname"/>
                        </div>
                    </div>
                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="email" class="form-control" value="${user.email}" name="email"
                                    aria-label="Adresse mail" data-mdb-input-init="" required="true"
                                    pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" path="email"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_email"/>
                        </div>
                    </div>
                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.phoneNumber}" name="phone"
                                    aria-label="Numéro de téléphone" data-mdb-input-init="" required="true"
                                    pattern="\+[0-9]{1,3}[0-9]{9}" path="phoneNumber"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_phone"/>
                        </div>
                    </div>
                </div>

                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.deliveryAddress}"
                                    aria-label="Adresse"
                                    name="address" data-mdb-input-init="" required="true" path="deliveryAddress"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_address"/>
                        </div>
                    </div>

                </div>

                <div>
                    <button class="btn btn-primary" type="submit" data-mdb-ripple-init>
                        <spring:message code="edit_button"/>
                    </button>
                </div>
            </form:form>
        </div>
    </section>
    <section id="passwordChange" class="w-100 d-flex justify-content-center">
        <spring:message var="passwordPlaceholder" code="oldpassword"/>
        <%--@elvariable id="passwordchangeform" type="com.spring.henallux.ecommerce.Model.PasswordChangeForm"--%>
        <form:form class="w-20  needs-validation d-flex align-items-center justify-content-center flex-column"
                   id="needs-validation" novalidate="" modelAttribute="passwordchangeform" method="post"
                   action="/editProfile/password">

            <form:input type="password" class="form-control" aria-label="Mot de passe" name="oldPassword" value=""
                        data-mdb-input-init="" required="true" path="oldPassword" placeholder="${passwordPlaceholder}"/>
            <div class="invalid-feedback">
                <spring:message code="register_error_password"/>
            </div>
            <spring:message var="passwordPlaceholder" code="new_password"/>
            <form:input type="password" class="form-control" aria-label="Mot de passe" name="newPassword" value=""
                        data-mdb-input-init="" required="true" path="newPassword" placeholder="${passwordPlaceholder}"/>
            <div class="invalid-feedback">
                <spring:message code="register_error_password"/>
            </div>
            <spring:message var="passwordPlaceholder" code="register_passwordConfirm"/>
            <form:input type="password" class="form-control" aria-label="Mot de passe" name="newPasswordConfirm"
                        value=""
                        data-mdb-input-init="" required="true" path="newPasswordConfirm"
                        placeholder="${passwordPlaceholder}"/>
            <div class="invalid-feedback">
                <spring:message code="register_error_password"/>
            </div>


            <button class="btn btn-primary" type="submit" data-mdb-ripple-init>
                <spring:message code="password_change"/>
            </button>
            <div style="color:red"> ${error} </div>
        </form:form>
    </section>
</div>

<script>
    const passwordForm = document.getElementById('passwordForm');

    passwordForm.addEventListener('submit', function (event) {
        if (passwordForm.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
        }
        passwordForm.classList.add('was-validated');
    }, false);
</script>