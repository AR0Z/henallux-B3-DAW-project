<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../include/importTags.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<spring:url var="localeFr" value="">
    <spring:param name="locale" value="fr"/>
</spring:url>

<spring:url var="localeEn" value="">
    <spring:param name="locale" value="en"/>
</spring:url>

<style>
    #wrapper {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
    }

    #search-wrapper {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;
    }

    #buttons {
        display: flex;
        align-items: center;
        width: 40%;
    }

    #search {
        display: flex;
        align-items: center;
        margin: 0;
        width: 100%;
    }

    #title {
        width: 20%;
        margin-right: 5px;
    }

    #search-bar {
        display: flex;
        width: 100%;

    }


</style>

<header class="p-2 mb-4 border-bottom" style="width: 100%;">
    <div id="wrapper">
        <div id="title">
            <a href="/" class="col text-dark text-decoration-none">
                <img src="../../../assets/title.png" alt="logo" style="width: 15vw"/>
            </a>
        </div>
        <div id="search-wrapper">
            <%--@elvariable id="searchform" type="com.spring.henallux.ecommerce.Model.SearchForm"--%>
            <form:form modelAttribute="searchform" method="get"
                       action="/search-product" cssStyle="margin:0;">
                <form:hidden path="orderby" value="labelasc"/>
                <div id="search">
                    <form:select path="categoryLabel" class="btn btn-secondary" id="category" style="display: block">
                        <option value="all">
                            <spring:message code="every_categories"/>
                        </option>
                        <c:forEach var="entry" items="${categories}">
                            <option value="${entry.key}">${entry.value}</option>
                        </c:forEach>
                    </form:select>
                    <div id="search-bar">

                        <spring:message code="searchBarPlaceholder" var="placeholderSearchbar"/>
                        <form:input path="filter" var="search" type="text"
                                    placeholder='${placeholderSearchbar}' id="search-input"/>
                        <form:button type="submit" class="btn btn-outline-secondary pb-2"
                                     style="border-radius: 0 5px 5px 0;" id="submit">
                            <i class="bi bi-search"></i>
                        </form:button>
                    </div>

                </div>
            </form:form>
        </div>
        <div id="buttons">
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
    </div>
</header>