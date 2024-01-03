<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
  .invalid-feedback {
    height: 15px !important;
    margin-bottom: 2px !important;
  }
</style>
<div class="wrapper d-flex align-items-center justify-content-center" style="height:100%;width:100%">
  <section class="background-image mb-2" style="width: 30vw; ">
    <div class="container d-flex align-items-center justify-content-center ">
      <form:form class="col g-4 needs-validation d-flex align-items-center justify-content-center flex-column"
            id="needs-validation" modelAttribute="user">
        <script>
          $('#needs-validation').on('keypress', function (e) {
            if (e.target.value.length > 0) {
              e.target.classList.remove('is-invalid');
              e.target.style.border = "1px solid green";
            }
          });
        </script>
        <div class="row mb-4 w-100">
          <div class="col">
            <form:input type="text" class="form-control" placeholder="Nom" aria-label="Nom" name="lastname"
                   data-mdb-input-init="" required="" pattern="[A-Za-z\-]{2,}" path="lastName" />
            <div class="invalid-feedback">Veuillez entrer un nom.</div>
          </div>
          <div class="col">
            <form:input type="text" class="form-control" placeholder="Prenom" aria-label="Prenom" name="name"
                   data-mdb-input-init="" required="" pattern="[A-Za-z]{2,}" path="firstName" />
            <div class="invalid-feedback">Veuillez entrer un prenom.</div>
          </div>
        </div>
        <!-- password -->
        <div class="row mb-4 w-100">
          <div class="col">
            <form:input type="password" id="password" class="form-control" placeholder="Mot de passe"
                   name="password" aria-label="Mot de passe" data-mdb-input-init="" require="require"
                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" path="password" />

          </div>
          <div class="col-sm" id="password-field">
            <form:input type="password" id="passwordValidation" class="form-control"
                   name="passwordValidation" placeholder="Confirmer mot de passe"
                   aria-label="Confirmer mot de passe" data-mdb-input-init="" require="require"
                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" path="passwordConfirm" />

          </div>
          <div class="invalid-feedback" id="feedback-password" style="
                            display:none;
                            margin-top:2.4rem;
                            width:30%;
                        ">
            (8 caractères minimum, 1 majuscule, 1 minuscule, 1 chiffre)
          </div>

        </div>
        <div class="row mb-4 w-100">
          <div class="col">
            <form:input type="email" class="form-control" placeholder="Adresse mail" name="email"
                        aria-label="Adresse mail" path="email" require="require"/>
            <div class="invalid-feedback">Veuillez entrer une adresse mail valide.</div>
          </div>
        </div>
        <div class="row mb-4 w-100">
          <div class="col">
            <form:input type="text" class="form-control" placeholder="Numero de telephone" name="phone"
                   aria-label="Numero de telephone" data-mdb-input-init="" require="require"
                   pattern="\+[0-9]{1,3}[0-9]{9}" path="phoneNumber" />
            <div class="invalid-feedback">Veuillez entrer un numero de telephone valide.(format :
              +01234567891)</div>
          </div>
        </div>

        <div class="row mb-4 w-100">
          <div class="col">
            <form:input type="text" class="form-control" placeholder="Adresse" aria-label="Adresse"
                   name="address" data-mdb-input-init="" required="required" path="deliveryAddress" />
            <div class="invalid-feedback">Veuillez entrer une adresse valide.</div>
          </div>
          <div class="col-md-3 form-outlined">
            <input type="text" class="form-control" placeholder="Code Postal" name="zipCode"
                   aria-label="Code Postal" data-mdb-input-init required pattern="[0-9]{4,5}">
            <div class="invalid-feedback">Veuillez entrer un code postal valide. (4 ou 5
              chiffres)
            </div>
          </div>
        </div>
        <div class="col-10 mb-4">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required />
            <label class="form-check-label" for="invalidCheck">Agree to <a href="terms.html"
                                                                           target="_blank" style="color: black;text-decoration: underline;">terms and
              conditions</a></label>
            <div class="invalid-feedback">You must agree before submitting.</div>
          </div>
        </div>
        <div class="col-2">
          <button class="btn btn-primary" id="submit-btn" data-mdb-ripple-init> Submit form</button>
          <script>
            $('#submit-btn').on('click', (e) => {
              const form = document.getElementById('needs-validation');

              if (!form.checkValidity()) {
                e.preventDefault();
                e.stopPropagation();
                const formData = new FormData(form);
                const data = Object.fromEntries(formData);
                const password = document.getElementById('password');
                const passwordConfirm = document.getElementById('passwordValidation');
                const feedBack = document.getElementById('feedback-password');
                if (!data.password || !data.passwordConfirm) {
                  password.classList.add('is-invalid');
                  passwordConfirm.classList.add('is-invalid');
                  document.getElementById('feedback-password').innerHTML = "Veuillez entrer un mot de passe.";
                  document.getElementById('feedback-password').style.display = "block";
                } else {
                  const regex = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
                  if (!data.password.match(regex) || !data.passwordConfirm.match(regex)) {
                    password.classList.add('is-invalid');
                    passwordConfirm.classList.add('is-invalid');
                    feedBack.innerHTML = "8 caractères, une majuscule et un chiffre.";
                    feedBack.style.display = "block";
                  } else {
                    if (data.password !== data.passwordConfirm) {
                      passwordConfirm.classList.add('is-invalid');
                      feedBack.innerHTML = "Les mots de passe ne correspondent pas.";
                      feedBack.style.display = "block";

                    } else {
                      passwordConfirm.classList.remove('is-invalid');
                      feedBack.style.display = "none";
                    }
                  }
                }
                formData.forEach((value, key) => {
                  if (!value) {
                    document.getElementsByName(key)[0].classList.add('is-invalid');
                    document.getElementsByName(key)[0].style.border = "1px solid red";
                  }
                });
              } else {
                document.getElementById('needs-validation').submit();
              }
              form.classList.add('was-validated');
            })
          </script>
        </div>
        <strong class="error" style="color: red;">${error}</strong>
      </form:form>
    </div>
  </section>
</div>
