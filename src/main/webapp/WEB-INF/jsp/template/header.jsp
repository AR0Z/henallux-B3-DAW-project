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
    #wrapper-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    #search-wrapper {
        width: 50vw;
    }

    #buttons {
        display: flex;
        justify-content: space-between;
    }

    #search {
        display: flex;
    }


    #search-bar {
        width: 70vw;

    }

    #search-input {
        width: 30vw;
    }


    @media screen and (max-width: 1100px) {
        #wrapper-header {
            display: flex;
            justify-content: space-between;
            align-items: center !important;
            flex-direction: column;
        }

        #title > a > img {
            width: 40%;
            margin-bottom: 10px;
        }

        #search-input {
            max-width: 70vw;
            width: 100%;
        }

        #search-bar {
            display: flex;
            width: 90vw;
            justify-content: center;
        }

        #search-wrapper {
            width: 100%;
        }

        #buttons {
        }
    }

</style>

<header class="mb-4 border-bottom" style="width: 100%;padding: 8px">
    <div id="wrapper-header">
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
                    <a class="btn btn-outline-primary me-2" href="/editProfile"
                       style="width: 135px;"><spring:message code="editAccount"/></a>
                    <a class="btn btn-outline-primary me-2" href="/logout" style="width: 160px;"><spring:message
                            code="disconnect"/></a>
                </sec:authorize>

                <a class="btn btn-outline-primary" href="/cart"><spring:message code="cart"/></a>
            </div>
        </div>
    </div>
</header>