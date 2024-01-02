<section class="py-5">
    <div class="container">
        <div class="row gx-5">
            <aside class="col-lg-6">
                <div id="carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carousel" data-bs-slide-to="0" class="active"
                                aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carousel" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carousel" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://placehold.co/400" class="d-block w-100" alt="400">
                        </div>
                        <div class="carousel-item">
                            <img src="https://placehold.co/500" class="d-block w-100" alt="500">
                        </div>
                        <div class="carousel-item">
                            <img src="https://placehold.co/600" class="d-block w-100" alt="600">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carousel"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <script>
                    new bootstrap.Carousel(document.getElementById('carousel'), {
                        interval: 2000,
                    })
                </script>
            </aside>
            <main class="col-lg-6">
                <div class="ps-lg-3">
                    <h4 class="title text-dark">
                        Nom de l'objet
                    </h4>
                    <div class="d-flex flex-row my-3">
                        <span class="text-success">In stock</span>
                    </div>

                    <div class="mb-3">
                        <span class="h5">99.00€</span>
                        <span class="text-muted">/par objet</span>
                    </div>

                    <p>
                        Description
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit minus magnam molestiae,
                        vero temporibus porro distinctio voluptatibus maiores repudiandae eius pariatur
                        reprehenderit adipisci, sequi at expedita iusto unde dolor nisi.
                    </p>

                    <div class="row">
                        <dt class="col-3">Type:</dt>
                        <dd class="col-9">Regular</dd>

                        <dt class="col-3">Color</dt>
                        <dd class="col-9">Brown</dd>

                        <dt class="col-3">Material</dt>
                        <dd class="col-9">Cotton, Jeans</dd>

                        <dt class="col-3">Brand</dt>
                        <dd class="col-9">Reebook</dd>
                    </div>

                    <hr />

                    <div class="row mb-4">
                        <div class="col-md-4 col-6">
                            <label class="mb-2">Size</label>
                            <select class="form-select border border-secondary" style="height: 35px;">
                                <option>Small</option>
                                <option>Medium</option>
                                <option>Large</option>
                            </select>
                        </div>
                        <!-- col.// -->
                        <div class="col-md-4 col-6 mb-3">
                            <label class="mb-2 d-block">Quantity</label>
                            <div class="input-group mb-3" style="width: 170px;">
                                <button class="btn btn-white border border-secondary px-3" type="button"
                                        id="button-addon1" data-mdb-ripple-color="dark">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <input type="text" class="form-control text-center border border-secondary"
                                       placeholder="14" aria-label="Example text with button addon"
                                       aria-describedby="button-addon1" />
                                <button class="btn btn-white border border-secondary px-3" type="button"
                                        id="button-addon2" data-mdb-ripple-color="dark">
                                    <i class="fas fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-shopping-basket"></i> Add to
                        cart
                    </a>
                </div>
            </main>
        </div>
    </div>
</section>
<!-- content -->
<section class="bg-light border-top py-4">
    <div class="container">
        <div class="row gx-4">
            <div class="col-lg-8 mb-4">
                <div class="border rounded-2 px-3 py-2 bg-white">
                    <!-- Pills navs -->
                    <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                        <li class="nav-item d-flex" role="presentation">
                            <a class="nav-link d-flex align-items-center justify-content-center w-100 active"
                               id="ex1-tab-1" data-bs-toggle="pill" href="#ex1-pills-1" role="tab"
                               aria-controls="ex1-pills-1" aria-selected="true">Specification</a>
                        </li>
                        <li class="nav-item d-flex" role="presentation">
                            <a class="nav-link d-flex align-items-center justify-content-center w-100"
                               id="ex1-tab-2" data-bs-toggle="pill" href="#ex1-pills-2" role="tab"
                               aria-controls="ex1-pills-2" aria-selected="true">Specification2</a>
                        </li>
                        <!-- https://placehold.co/400 Other tab links https://placehold.co/400 -->
                    </ul>
                    <!-- Pills navs -->

                    <!-- Pills content -->
                    <div class="tab-content" id="ex1-content">
                        <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel"
                             aria-labelledby="ex1-tab-1">
                            exemple 1
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius odio aliquid ducimus,
                            impedit quidem nemo cum quis praesentium! Modi delectus excepturi corporis molestias
                            natus expedita numquam ullam dolores enim labore.
                        </div>
                        <div class="tab-pane fade show" id="ex1-pills-2" role="tabpanel"
                             aria-labelledby="ex1-tab-2">
                            exemple 2
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius odio aliquid ducimus,
                            impedit quidem nemo cum quis praesentium! Modi delectus excepturi corporis molestias
                            natus expedita numquam ullam dolores enim labore.
                        </div>
                    </div>
                    <!-- Pills content -->
                </div>
            </div>
            <div class="col-lg-4">
                <div class="px-0 border rounded-2 shadow-0">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Similar items</h5>
                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img src="https://placehold.co/400" style="min-width: 96px; height: 96px;"
                                         class="img-md img-thumbnail" />
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1">
                                        Rucksack Backpack Large <br />
                                        Line Mounts
                                    </a>
                                    <strong class="text-dark"> $38.90</strong>
                                </div>
                            </div>

                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img src="https://placehold.co/400" style="min-width: 96px; height: 96px;"
                                         class="img-md img-thumbnail" />
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1">
                                        Summer New Men's Denim <br />
                                        Jeans Shorts
                                    </a>
                                    <strong class="text-dark"> $29.50</strong>
                                </div>
                            </div>

                            <div class="d-flex mb-3">
                                <a href="#" class="me-3">
                                    <img src="https://placehold.co/400" style="min-width: 96px; height: 96px;"
                                         class="img-md img-thumbnail" />
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1"> T-shirts with multiple colors, for men and
                                        lady
                                    </a>
                                    <strong class="text-dark"> $120.00</strong>
                                </div>
                            </div>

                            <div class="d-flex">
                                <a href="#" class="me-3">
                                    <img src="https://placehold.co/400" style="min-width: 96px; height: 96px;"
                                         class="img-md img-thumbnail" />
                                </a>
                                <div class="info">
                                    <a href="#" class="nav-link mb-1"> Blazer Suit Dress Jacket for Men, Blue color
                                    </a>
                                    <strong class="text-dark"> $339.90</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>