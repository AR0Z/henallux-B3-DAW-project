<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../include/importTags.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<spring:url var="localeFr" value="">
    <spring:param name="locale" value="fr"/>
</spring:url>

<spring:url var="localeEn" value="">
    <spring:param name="locale" value="en"/>
</spring:url>

<header
        class="d-flex flex-nowrap align-items-center justify-content-between justify-content-md-between p-3 mb-4 border-bottom w-90">
    <a href="/"
       class="d-flex align-items-center text-dark text-decoration-none flex-shrink-1">
        <span class="fs-4">Furniture paradise</span>
    </a>
    <div class="d-flex justify-content-center" style="width: 50vw">
        <form:form modelAttribute="searchform" method="get" action="/search-product">
            <div class="d-flex align-items-center">
                <form:select path="categoryLabel" class="btn btn-secondary" id="category" style="display: block">
                    <option value="all">
                        Toutes les catégories
                    </option>
                    <c:forEach var="entry" items="${categories}">
                        <option value="${entry.key}"><a class="dropdown-item">${entry.value}</a></option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="search w-100">
                <div class="row w-100">
                    <div class="col-md-6 w-100">
                        <div>
                            <div class="search-2 d-flex">
                                <spring:message code="searchBarPlaceholder" var="placeholderSearchbar" />
                                <form:input path="filter" var="search" class="w-100" type="text" placeholder='${placeholderSearchbar}' id="search" />
                                <form:button type="submit" class="btn btn-outline-secondary pb-2"
                                        style="border-radius: 0 5px 5px 0;" id="submit">
                                    <i class="bi bi-search"></i>
                                </form:button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
        </div>
    </div>
    <div class=" text-end w-20 d-flex">
        <div class="container d-flex align-items-center justify-content-end">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    <spring:message code="language"/>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${localeFr}"><spring:message code="languageFr"/></a></li>
                    <li><a class="dropdown-item" href="${localeEn}"><spring:message code="languageEn"/></a></li>
                </ul>
            </div>
        </div>
        <div class="container d-flex">
            <sec:authorize access="!isAuthenticated()">
                <a class="btn btn-outline-primary me-2" href="/login"><spring:message code="login"/></a>
                <a class="btn btn-outline-primary me-3" href="/register"><spring:message code="register"/></a>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <a class="btn btn-outline-primary me-2" href="/editProfile"><spring:message code="editAccount"/></a>
                <a class="btn btn-outline-primary me-2" href="/logout"><spring:message code="disconnect"/></a>
            </sec:authorize>

            <a class="btn btn-outline-primary" href="/cart"><spring:message code="cart"/></a>
        </div>
    </div>
</header>