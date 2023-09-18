<#import "elements/main.ftlh" as main>
<@main.page true user>
<h1 style="text-align: center">Mano prekės</h1>
<hr>
<a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
   data-toggle="collapse" href="#collapseExample" role="button"
   aria-expanded="true" aria-controls="collapseExample">
    Pridėti prekę
</a>
<div class="collapse mb-3" id="collapseExample" style="">
    <form action="/product/create" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="productName">Prekės pavadinimas: </label>
            <input type="text" required class="form-control"
                   id="productName" name="name">
        </div>
        <div class="form-group">
            <label for="price">Kaina: </label>
            <div class="input-group mb-3">
                <input type="number" required class="form-control" id="price" name="price">
                <div class="input-group-append">
                    <span class="input-group-text">EUR</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="searchCity">Miestas</label>
            <select id="searchCity" required name="city" class="form-control">
                <option value="">Pasirinkti miesta</option>
                <#list towns as t>
                    <option value="${t}">${t}</option>
                </#list>
            </select>
        </div>
        <div class="form-group">
            <label for="description">Prekės aprašymas</label>
            <textarea required class="form-control" id="description" name="description"></textarea>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input required type="file" name="file1" id="file1">
                <label class="custom-file-label" for="file1">Pirmoji nuotrauka</label>
            </div>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input required type="file" name="file2" id="file2">
                <label class="custom-file-label" for="file2">Antroji nuotrauka</label>
            </div>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input required type="file" name="file3" id="file3">
                <label class="custom-file-label" for="file3">Trečioji nuotrauka</label>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit" style="width: 100%" class="btn btn-dark">Pridėti</button>
    </form>
</div>
<div class="card-columns">
    <#list products as product>
        <a href="/product/${product.id}" class="product-link">
            <div class="card text-white bg-dark my-3 product">
                <div class="card-top">
                    <form action="/product/delete/${product.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger m-3">
                            Pašalinti
                        </button>
                    </form>
                </div>
                <img src="/images/${product.previewImageId}"
                     class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="card-text">${product.price} EUR</p>
                </div>
                <div class="card-footer">
                    ${product.city}
                </div>
                <div class="card-footer">
                    ${product.user.name}
                </div>
            </div>
        </a>
    <#else>
        <h1 style="text-align: center">Nerasta</h1>
    </#list>
</div>
</@main.page>