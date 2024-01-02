<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="d-flex justify-content-center align-items-center" style="height: 70vh;">

    <form:form method="post" action="" modelAttribute="user">
        <!-- Email input -->
        <div class="form-outline mb-4 border">
            <form:input type="email" id="email" class="form-control"  path="email"/>
            <label class="form-label" for="email">Email address</label>
        </div>

        <!-- Password input -->
        <div class="form-outline mb-4 border">
            <form:input type="password" id="password" class="form-control" path="password" />
            <label class="form-label" for="password">Password</label>
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>

        <!-- Register buttons -->
        <div class="text-center">
            <p>Not a member? <a href="">Register</a></p>
        </div>
    </form:form>
    <%-- Ajoutez ceci dans votre page de login JSP --%>
    <c:if test="${not empty param.error}">
        <p style="color: red;">Identifiants incorrects. Veuillez réessayer.</p>
    </c:if>
</section>