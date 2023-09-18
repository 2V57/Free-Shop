<#import "elements/main.ftlh" as main>
<@main.page false user>
    <h1 style="text-align: center">Vartotojo informacija</h1>
    <hr>
    <div style="text-align: center">
        <#if userInfo.avatar??><a href="/images/${userInfo.avatar.id}"></#if>
            <img src="<#if userInfo.avatar??>/images/${userInfo.avatar.id}<#else>/img/avatar.jpg</#if>"
                 style="border:2px solid black; border-radius: 20px" height="120">
            <#if userInfo.avatar??></a></#if>
        <br>
        <br>
        <h2>${userInfo.name}</h2>
        <br>
        Telefono numeris: <b>${userInfo.phoneNumber}</b>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">Vartotojo prekės ${userInfo.name}</h1>
    <br>
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
                        ${product.user.name}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Nerasta</h1>
        </#list>
    </div>
</@main.page>