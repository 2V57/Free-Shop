<#import "elements/main.ftlh" as main>
<@main.page false user>
    <h1 style="text-align: center">Vartotojo paskyra</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <#if avatar??><a href="/images/${avatar.id}"></#if>
            <img src="<#if avatar??>/images/${avatar.id}<#else>/img/avatar.jpg</#if>"
                 style="border:2px solid black; border-radius: 20px" height="120">
            <#if avatar??></a></#if>
        <br>
        <br>
        <h2>${updateUser.name}</h2>
        <br>
        El.paštas: <b>${updateUser.email}</b>
        <br>
        Telefono numeris: <b>${updateUser.phoneNumber}</b>
        <br>

        <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
           data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true"
           aria-controls="collapseExample">
            Redaguoti profilį
        </a>
        <div class="collapse mb-3" id="collapseExample" style="">
            <form action="/profile/edit" method="post" enctype="multipart/form-data">
                <input type="hidden" name="email" value="${updateUser.email}"/>
                <div class="form-group">
                    <label for="name">Vartotojo vardas: </label>
                    <input type="text" class="form-control" id="name" name="name" value="${updateUser.name}">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Telefono numberis: </label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber"
                           value="${updateUser.phoneNumber}">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" style="width: 100%" class="btn btn-success">Išsaugoti</button>
            </form>
        </div>
        <br>
        <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
           href="/my/products">
            Mano prekės
        </a>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="text-align: center; width: 100%" class="btn btn-danger mb-2">
                Išeiti iš paskyros
            </button>
        </form>
    </div>
</@main.page>