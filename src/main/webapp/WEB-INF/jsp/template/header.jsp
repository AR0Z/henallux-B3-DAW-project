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
        width: 98vw;
    }

    #title {
        width: 15%;
    }

    #search-wrapper {
        width: 40%;
        margin-right: 20px;
    }

    #search {
        display: flex;
        flex-direction: row;
    }

    #buttons {
        width: 30%;
        display: flex;
        justify-content: space-between;
    }

    #helloText {
        width: 15%;
    }

    #mainPic {
        width: 100%;
        min-width: 8vw;
        max-width: 15vw;
    }

    #category {
        width: 30%;
        margin-right: 10px;
    }

    #search-bar {
        display: flex;
        flex-direction: row;
        width: 70%;
    }

    #cartImg {
        max-width: 20px;
    }

    @media screen and (max-width: 1500px) {
        #wrapper-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 98vw;
            flex-direction: column;
        }

        #title {
            width: 15%;
        }

        #search-wrapper {
            width: 95vw;

        }

        #search {
            display: flex;
            flex-direction: row;
        }

        #buttons {
            width: 90vw;
            display: flex;
            justify-content: space-between;
        }

        #helloText {
            width: 10%;
        }

        #mainPic {
            min-width: 200px;
        }

        #category {
            width: 30%;
            margin-right: 10px;
        }
    }

</style>

<header class="mb-4 border-bottom" style="width: 100%;padding: 8px">
    <div id="wrapper-header">
        <div id="title">
            <a href="/" class="col text-dark text-decoration-none">
                <img id="mainPic" src="../../../assets/title.png" alt="logo"/>
            </a>
        </div>
        <div id="search-wrapper">
            <%--@elvariable id="searchform" type="com.spring.henallux.ecommerce.Model.SearchForm"--%>
            <form:form modelAttribute="searchform" method="get"
                       action="/search-product" cssStyle="margin:0;">
                <form:hidden path="orderby" value="labelasc"/>
                <div id="search">
                    <form:select path="categoryLabel" class="form-select btn-secondary" id="category"
                                 style="display: block;">
                        <option value="all">
                            <spring:message code="every_categories"/>
                        </option>
                        <c:forEach var="entry" items="${categories}">
                            <option value="${entry.key}"> ${entry.value} </option>
                        </c:forEach>
                    </form:select>
                    <div id="search-bar">
                        <spring:message code="searchBarPlaceholder" var="placeholderSearchbar"/>
                        <form:input cssClass="form-control" path="filter" var="search" type="text"
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
            <div class="dropdown" style="margin-right: 20px">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    <spring:message code="language"/>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${localeFr}">
                        <img width="12" src="../../../assets/icons/france.png">
                        <spring:message code="languageFr"/>
                    </a></li>
                    <li><a class="dropdown-item" href="${localeEn}">
                        <img width="12" src="../../../assets/icons/united-kingdom.png">
                        <spring:message code="languageEn"/></a></li>
                </ul>
            </div>
            <sec:authorize access="!isAuthenticated()">
                <a class="btn btn-outline-primary me-2" href="/login"><spring:message code="login"/></a>
                <a class="btn btn-outline-primary me-3" href="/register"><spring:message code="register"/></a>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <a class="btn btn-outline-primary me-2" href="/editProfile"
                   style="width: 135px;"><spring:message code="editAccount"/></a>
                <a class="btn btn-outline-primary me-2" href="/logout" style="width: 170px;"><spring:message
                        code="disconnect"/></a>
            </sec:authorize>

            <a class="btn btn-outline-primary" href="/cart">
                <img id="cartImg" src="../../../assets/icons/shopping-cart.png">
            </a>
        </div>
        <sec:authorize access="isAuthenticated()">
            <div id="helloText" class="d-flex" style="max-width: 200px; justify-content: center">
                <spring:message code="hello"/>
                <span>${username}</span>
            </div>
        </sec:authorize>
    </div>
</header>