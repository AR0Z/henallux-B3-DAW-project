<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="./include/importTags.jsp" %>

<style>
    .invalid-feedback {
        height: 15px !important;
        margin-bottom: 2px !important;
    }
</style>
<div class="wrapper d-flex align-items-center justify-content-center" style="height:100%;width:100%">
    <section class="background-image mb-2" style="width: 50vw; ">
        <div class="container d-flex align-items-center justify-content-center ">
            <form:form class="col g-4 needs-validation d-flex align-items-center justify-content-center flex-column"
                       id="needs-validation" modelAttribute="user">
                <script>
                    $('#needs-validation').on('keypress', function (e) {
                        if (e.target.value.length > 0) {
                            e.target.classList.remove('is-invalid');
                            e.target.style.border = "1px solid green";
                        }
                    });
                </script>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <spring:message code="register_name" var="namePlaceholder"/>
                        <form:input type="text" class="form-control" placeholder='${namePlaceholder}' aria-label="Nom"
                                    name="lastname"
                                    data-mdb-input-init="" required="" pattern="[A-Za-z\-]{2,}" path="lastName"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_name"/>
                        </div>
                    </div>
                    <div class="col">
                        <spring:message code="register_firstname" var="firstnamePlaceholder"/>
                        <form:input type="text" class="form-control" placeholder="${firstnamePlaceholder}"
                                    aria-label="Prenom" name="name"
                                    data-mdb-input-init="" required="" pattern="[A-Za-z]{2,}" path="firstName"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_firstname"/>
                        </div>
                    </div>
                </div>
                <!-- password -->
                <div class="row mb-4 w-100">
                    <div class="col">
                        <spring:message code="register_password" var="passwordPlaceholder"/>
                        <form:input var="password" type="password" id="password" class="form-control" placeholder="Mot de passe"
                                    name="password" aria-label="Mot de passe" data-mdb-input-init="" require="require"
                                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" path="password"/>

                    </div>
                    <div class="col-sm" id="password-field">
                        <spring:message code="register_passwordConfirm" var="passwordConfirmPlaceholder"/>
                        <form:input var="passwordConfirm" type="password" id="passwordValidation" class="form-control"
                                    name="passwordValidation" placeholder="${passwordConfirmPlaceholder}"
                                    aria-label="Confirmer mot de passe" data-mdb-input-init="" require="require"
                                    pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" path="passwordConfirm"/>

                    </div>

                    <div class="invalid-feedback" id="feedback-password" style="
                            display:block !important;
                            margin-top:2.4rem;
                            width:30%;
                        ">
                        <div class="empty" style="display: none">
                            <spring:message code="register_error_password_empty"/>
                        </div>
                        <div class="matching" style="display: none">
                            <spring:message code="register_error_password_matching" />
                        </div>
                        <div class="passwordError" style="display: none">
                            <spring:message code="register_error_password"/>
                        </div>

                    </div>

                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <spring:message code="register_email" var="emailPlaceholder"/>
                        <form:input type="email" class="form-control" placeholder="${emailPlaceholder}" name="email"
                                    aria-label="Adresse mail" path="email" require="require"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_email"/>
                        </div>
                    </div>
                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <spring:message code="register_phone" var="phonePlaceholder"/>
                        <form:input type="text" class="form-control" placeholder="${phonePlaceholder}" name="phone"
                                    aria-label="Numero de telephone" data-mdb-input-init="" require="require"
                                    pattern="\+[0-9]{1,3}[0-9]{9}" path="phoneNumber"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_phone"/>
                        </div>
                    </div>
                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <spring:message code="register_address" var="addressPlaceholder"/>
                        <form:input type="text" class="form-control" placeholder="${addressPlaceholder}"
                                    aria-label="Adresse"
                                    name="address" data-mdb-input-init="" required="required" path="deliveryAddress"/>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_address"/>
                        </div>
                    </div>
                    <div class="col-md-3 form-outlined">
                        <spring:message code="register_zipcode" var="zipCodePlaceholder"/>
                        <input type="text" class="form-control" placeholder="${zipCodePlaceholder}" name="zipCode"
                               aria-label="Code Postal" data-mdb-input-init required pattern="[0-9]{4,5}">
                        <div class="invalid-feedback">
                            <spring:message code="register_error_zipcode"/>
                        </div>
                    </div>
                </div>
                <div class="col-10 mb-4">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required/>
                        <label class="form-check-label" for="invalidCheck">
                            <spring:message code="register_agree"/>
                            <a href="terms.html" target="_blank" style="color: black;text-decoration: underline;">
                                <spring:message code="register_agree_link"/>
                            </a>
                        </label>
                        <div class="invalid-feedback">
                            <spring:message code="register_error_button"/>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <button class="btn btn-primary" id="submit-btn" data-mdb-ripple-init>
                        <spring:message code="register_button"/>
                    </button>
                    <script>
                        $('#submit-btn').on('click', (e) => {
                            const form = document.getElementById('needs-validation');

                            if (!form.checkValidity()) {
                                // e.preventDefault();
                                // e.stopPropagation();
                                const formData = new FormData(form);
                                const data = Object.fromEntries(formData);
                                const password = document.getElementById('password');
                                const passwordConfirm = document.getElementById('passwordValidation');
                                const feedBack = document.getElementById('feedback-password');
                                const empty = document.getElementsByClassName('empty')[0];
                                const matching = document.getElementsByClassName('matching')[0];
                                const passwordError = document.getElementsByClassName('passwordError')[0];
                                if (!data.password || !data.passwordConfirm) {
                                    password.classList.add('is-invalid');
                                    passwordConfirm.classList.add('is-invalid');
                                    empty.style.display = "block";
                                } else {
                                    empty.style.display = "none";
                                    const regex = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
                                    if (!data.password.match(regex) || !data.passwordConfirm.match(regex)) {
                                        password.classList.add('is-invalid');
                                        passwordConfirm.classList.add('is-invalid');
                                        passwordError.style.display = "block";
                                    } else {
                                        passwordError.style.display = "none";
                                        if (data.password !== data.passwordConfirm) {
                                            passwordConfirm.classList.add('is-invalid');
                                            matching.style.display = "block";
                                        } else {
                                            passwordConfirm.classList.remove('is-invalid');
                                            feedBack.style.display = "none";
                                            matching.style.display = "none";
                                        }
                                    }
                                }
                                formData.forEach((value, key) => {
                                    if (!value) {
                                        document.getElementsByName(key)[0].classList.add('is-invalid');
                                        document.getElementsByName(key)[0].style.border = "1px solid red";
                                    }
                                });
                            } else {
                                document.getElementById('needs-validation').submit();
                            }
                            form.classList.add('was-validated');
                        })
                    </script>
                </div>
                <strong class="error" style="color: red;">${error}</strong>
            </form:form>
        </div>
    </section>
</div>
