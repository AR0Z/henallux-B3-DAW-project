<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="./include/importTags.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="d-flex justify-content-center align-items-center" style="height: 70vh;">
    <form:form method="post" action="" modelAttribute="user">
        <!-- Email input -->
        <div class="mb-4">
            <spring:message code="register_email" var="emailPlaceholder"/>
            <form:input type="email" class="form-control" placeholder="${emailPlaceholder}" name="email"
                        aria-label="Adresse mail" path="email" require="require"/>
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

        <c:if test="${not empty param.error}">
            <p style="color: red;">
                <spring:message code="credentials_error"/>
            </p>
        </c:if>

        <!-- Register buttons -->
        <div class="text-center">
            <p>
                <spring:message code="login_notAMember"/>
                <a href="">
                    <spring:message code="login_notAMember_button"/>
                </a>
            </p>
        </div>
    </form:form>

</section>