<script>
  (() => {
    setTimeout(() => {
      'use strict';
      const form = document.getElementById('needs-validation');
      form.addEventListener('submit', (event) => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
          let formData = new FormData(form);
          let data = Object.fromEntries(formData);
          if (!data.password || !data.passwordValidation) {
            document.getElementById('password').classList.add('is-invalid');
            document.getElementById('passwordValidation').classList.add('is-invalid');
            document.getElementById('feedback-password').innerHTML = "Veuillez entrer un mot de passe.";
            document.getElementById('feedback-password').style.display = "block";
          } else {
            if (!data.password.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/) || !data.passwordValidation.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/)) {
              document.getElementById('password').classList.add('is-invalid');
              document.getElementById('passwordValidation').classList.add('is-invalid');
              document.getElementById('feedback-password').innerHTML = "8 caractères, une majuscule et un chiffre.";
              document.getElementById('feedback-password').style.display = "block";
            } else {
              if (data?.password !== data?.passwordValidation) {
                document.getElementById('passwordValidation').classList.add('is-invalid');
                document.getElementById('feedback-password').innerHTML = "Les mots de passe ne correspondent pas.";
                document.getElementById('feedback-password').style.display = "block";

              } else {
                document.getElementById('passwordValidation').classList.remove('is-invalid');
                document.getElementById('feedback-password').style.display = "none";
              }
            }

          }



        }
        form.classList.add('was-validated');
      }, false);
      form.addEventListener('input', (event) => {
        if (event.target.value.length > 0) {
          event.target.classList.remove('is-invalid');
        }
      }, false);
    }, 100);
  })();
</script>
<style>
  .invalid-feedback {
    height: 15px !important;
    margin-bottom: 2px !important;
  }
</style>
<div class="wrapper d-flex align-items-center justify-content-center" style="height:100%;width:100%">
  <section class="background-image mb-2" style="width: 30vw; ">
    <div class="container d-flex align-items-center justify-content-center ">
      <form class="col g-4 needs-validation d-flex align-items-center justify-content-center flex-column"
            id="needs-validation" novalidate>
        <div class="row mb-4 w-100">
          <div class="col">
            <input type="text" class="form-control" placeholder="Nom" aria-label="Nom" name="lastname"
                   data-mdb-input-init required pattern="[A-Za-z]{2,}">
            <div class="invalid-feedback">Veuillez entrer un nom.</div>
          </div>
          <div class="col">
            <input type="text" class="form-control" placeholder="Prenom" aria-label="Prenom" name="name"
                   data-mdb-input-init required pattern="[A-Za-z]{2,}">
            <div class="invalid-feedback">Veuillez entrer un prénom.</div>
          </div>
        </div>
        <!-- password -->
        <div class="row mb-4 w-100">
          <div class="col">
            <input type="password" id="password" class="form-control" placeholder="Mot de passe"
                   name="password" aria-label="Mot de passe" data-mdb-input-init required
                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">

          </div>
          <div class="col-sm" id="password-field">
            <input type="password" id="passwordValidation" class="form-control"
                   name="passwordValidation" placeholder="Confirmer mot de passe"
                   aria-label="Confirmer mot de passe" data-mdb-input-init required
                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">

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
            <input type="email" class="form-control" placeholder="Adresse mail" name="email"
                   aria-label="Adresse mail" data-mdb-input-init required
                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
            <div class="invalid-feedback">Veuillez entrer une adresse mail valide.</div>
          </div>
        </div>
        <div class="row mb-4 w-100">
          <div class="col">
            <input type="text" class="form-control" placeholder="Numéro de téléphone" name="phone"
                   aria-label="Numéro de téléphone" data-mdb-input-init required
                   pattern="\+[0-9]{1,3}[0-9]{9}">
            <div class="invalid-feedback">Veuillez entrer un numéro de téléphone valide.(format :
              +01234567891)</div>
          </div>
          <div class=" col-md-5" style="position: relative">
            <input type="text" class="form-control datetimepicker-input" id="datetimepicker"
                   name="birthday" data-toggle="datetimepicker" data-target="#datetimepicker" required
                   placeholder="Date de naissance">
            <div class="invalid-feedback">Veuillez entrer une date de naissance valide.</div>
            <script type="text/javascript">
              $(function () {
                $('#datetimepicker').datetimepicker({
                  autoclose: true,
                  maxDate: "01/01/2006",
                  minDate: "01/01/1900",
                  format: 'DD/MM/YYYY',
                  locale: 'fr'
                });
              });
            </script>
          </div>
        </div>

        <div class="row mb-4 w-100">
          <div class="col">
            <input type="text" class="form-control" placeholder="Adresse" aria-label="Adresse"
                   name="address" data-mdb-input-init required>
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
          <button class="btn btn-primary" type="submit" data-mdb-ripple-init> Submit form</button>
        </div>
      </form>
    </div>
  </section>
</div>
