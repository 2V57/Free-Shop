<#import "elements/main.ftlh" as main>
<@main.page true user>
    <h1 style="text-align: center"><@spring.message 'product.search'/></h1>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
        <label for="searchCity"><@spring.message 'city'/></label>
        <select id="searchCity" name="searchCity" class="form-control">
            <option value="searchCity"><@spring.message 'the.city.is.not.selected'/></option>
            <#list towns as town>
                <option <#if searchCity == town>selected</#if> value="${town}">${town}</option>
            </#list>
        </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord"><@spring.message 'search.by.ad.title'/></label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control" id="searchWord" />
            </div>
        </div>
            <button style="width: 100%" type="submit" class="btn btn-dark"><@spring.message 'search'/></button>
        </div>

    </form>

    <hr />
    <div class="card-columns">
    <#list products as product>
        <a href="/product/${product.id}" class="product-link">
            <div class="card text-white bg-dark my-3 product">

                <img src="/images/${product.previewImageId}"
                     class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="card-text">${product.price}</p>
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
        <h1 style="text-align: center"><@spring.message 'not.found'/></h1>
    </#list>
    </div>

</@main.page>