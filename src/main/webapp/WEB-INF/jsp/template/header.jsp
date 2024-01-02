<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../include/importTags.jsp"%>

<spring:url var="localeFr" value="">
    <spring:param name="locale" value="fr" />
</spring:url>

<spring:url var="localeEn" value="">
    <spring:param name="locale" value="en" />
</spring:url>

<header
        class="d-flex flex-nowrap align-items-center justify-content-between justify-content-md-between p-3 mb-4 border-bottom w-90">
    <a href="/"
       class="d-flex align-items-center text-dark text-decoration-none flex-shrink-1">
        <span class="fs-4">Furniture paradise</span>
    </a>
    <div class="justify-content-center w-50">
        <div class="container d-flex align-items-center">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle " type="button" data-bs-toggle="dropdown"
                        aria-expanded="false" style="border-radius: 5px 0 0 5px;">
                    Categories
                </button>
                <ul class=" dropdown-menu">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
            </div>
            <div class="search w-100">
                <div class="row w-100">
                    <div class="col-md-6 w-100">
                        <div>
                            <div class="search-2 d-flex">
                                <input class="w-100" type="text" placeholder="Que recherchez-vous ?">
                                <button type="button" class="btn btn-outline-secondary pb-2"
                                        style="border-radius: 0 5px 5px 0;">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class=" text-end w-20 d-flex">
        <div class="container d-flex align-items-center justify-content-end">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    langues
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${localeFr}">Francais</a></li>
                    <li><a class="dropdown-item" href="${localeEn}">Anglais</a></li>
                </ul>
            </div>
        </div>
        <div class="container d-flex">
            <sec:authorize access="!isAuthenticated()">
                <a class="btn btn-outline-primary me-2" href="/login"><spring:message code="login" /></a>
                <a class="btn btn-outline-primary me-3" href="/register">S'inscrire</a>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <a class="btn btn-outline-primary me-2" href="/editProfile">Modifier mon compte</a>
                <a class="btn btn-outline-primary me-2" href="/logout">se déconnecter</a>
            </sec:authorize>

            <button type="button" class="btn btn-outline-primary">Panier</button>
        </div>
    </div>
</header>