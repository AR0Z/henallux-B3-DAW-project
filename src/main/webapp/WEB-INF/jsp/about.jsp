<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sprig" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    section {
        margin: 0 auto;
        width: 80%;
        text-align: justify;
    }

    h1 {
        text-align: center;
        font-size: 2.5em;
        margin: 1em 0;
    }

    h2 {
        font-size: 1.5em;
        margin: 1em 0;
    }

    p {
        font-size: 1.2em;
        margin: 1em 0;
        padding: 10px;
    }
</style>
<section>
    <h1><spring:message code="title"/></h1>
    <h2>Introduction</h2>
    <p><spring:message code="introduction-content"/></p>
    <h2><spring:message code="genesis"/></h2>
    <p><spring:message code="aboutus-content"/></p>
    <h2><spring:message code="philosophy"/></h2>
    <p><spring:message code="philosophy-content"/></p>
    <h2><spring:message code="collection"/></h2>
    <p><spring:message code="collection-content"/></p>
    <h2><spring:message code="innovation"/></h2>
    <p><spring:message code="innovation-content"/></p>
    <h2><spring:message code="sustainability"/></h2>
    <p><spring:message code="sustainability-content"/></p>
    <h2><spring:message code="service-title"/></h2>
    <p><spring:message code="service-content"/></p>
    <h2><spring:message code="conclusion"/></h2>
    <p><spring:message code="conclusion-content"/></p>

</section>