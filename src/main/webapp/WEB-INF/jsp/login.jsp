<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="./include/importTags.jsp" %>

<section class="d-flex justify-content-center align-items-center" style="height: 75%;">
    <form:form method="post" action="login" modelAttribute="user" id="form">
        <!-- Email input -->
        <div class="mb-4">
            <spring:message code="register_email" var="emailPlaceholder"/>
            <form:input type="email" class="form-control" placeholder="${emailPlaceholder}" name="email"
                        aria-label="Adresse mail" path="email" require="require" id="email"/>
        </div>

        <!-- Password input -->
        <div class="mb-4">
            <spring:message code="register_password" var="passwordPlaceholder"/>
            <form:input var="password" type="password" id="password" class="form-control"
                        placeholder="${passwordPlaceholder}"
                        name="password" aria-label="Mot de passe" data-mdb-input-init="" require="require"
                        path="password"/>
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">
            <spring:message code="login_button"/>
        </button>

        <div class="d-flex justify-content-center" style="color: red" id="errorText">
            <c:if test="${not empty param.error}">
                <spring:message code="credentials_error"/>
            </c:if>
        </div>

        <!-- Register buttons -->
        <div class="text-center">
            <p>
                <spring:message code="login_notAMember"/>
                <a href="/register">
                    <spring:message code="login_notAMember_button"/>
                </a>
            </p>
        </div>
    </form:form>

</section>

<script>
    const passwordInput = document.getElementById('password');
    const emailInput = document.getElementById('email');
    const form = document.getElementById('form');
    const error = document.getElementById('errorText');
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        if (passwordInput.value.length === 0) {
            error.innerText = "<spring:message code="register_error_password_empty" javaScriptEscape="true"/>";
            return;
        }
        if (emailInput.value.length === 0) {
            error.innerText = "<spring:message code="register_error_email" javaScriptEscape="true" />";
            return;
        }

        form.submit();
    })
</script>