<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>
<div class="wrapper d-flex align-items-center justify-content-center" style="height:100%;width:100%">
    <section class="background-image mb-2" style="width: 30vw; ">
        <div class="container d-flex align-items-center justify-content-center ">
            <form:form class="col g-4 needs-validation d-flex align-items-center justify-content-center flex-column"
                  id="needs-validation" novalidate="" modelAttribute="user" method="post">
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.lastName}" aria-label="Nom" name="lastname"
                               data-mdb-input-init="" required="true" pattern="[A-Za-z]{2,}" path="lastName"/>
                        <div class="invalid-feedback">Veuillez entrer un nom.</div>
                    </div>
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.firstName}" aria-label="Prenom" name="name"
                               data-mdb-input-init="" required="true" pattern="[A-Za-z]{2,}" path="firstName" />
                        <div class="invalid-feedback">Veuillez entrer un prénom.</div>
                    </div>
                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="email" class="form-control" value="${user.email}" name="email"
                               aria-label="Adresse mail" data-mdb-input-init="" required="true"
                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" path="email" />
                        <div class="invalid-feedback">Veuillez entrer une adresse mail valide.</div>
                    </div>
                </div>
                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.phoneNumber}" name="phone"
                               aria-label="Numéro de téléphone" data-mdb-input-init="" required="true"
                               pattern="\+[0-9]{1,3}[0-9]{9}" path="phoneNumber" />
                        <div class="invalid-feedback">Veuillez entrer un numéro de téléphone valide.(format :
                            +01234567891)</div>
                    </div>
                </div>

                <div class="row mb-4 w-100">
                    <div class="col">
                        <form:input type="text" class="form-control" value="${user.deliveryAddress}" aria-label="Adresse"
                               name="address" data-mdb-input-init="" required="true" path="deliveryAddress" />
                        <div class="invalid-feedback">Veuillez entrer une adresse valide.</div>
                    </div>
                    <div class="col-md-3">
                        <input type="text" class="form-control" placeholder="Code Postal" name="zipCode"
                               aria-label="Code Postal" data-mdb-input-init required pattern="[0-9]{4,5}">
                        <div class="invalid-feedback">Veuillez entrer un code postal valide. (4 ou 5
                            chiffres)
                        </div>
                    </div>
                </div>

                <div class="col-2">
                    <button class="btn btn-primary" type="submit" data-mdb-ripple-init> Submit form</button>
                </div>
            </form:form>
        </div>
    </section>
</div>