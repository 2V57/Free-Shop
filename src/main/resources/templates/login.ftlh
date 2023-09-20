<#import "elements/main.ftlh" as main>



<@main.page true user>



    <h1 style="text-align: center"><@spring.message 'user.name'/></h1> <!-- Autorizacija -->

    <hr>
    <form action="/login " method="post">
        <div class="form-group">
            <label for="email">El. paštas</label>
            <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
            <div id="email" class="invalid-feedback">
                Netaisingai nurodytas
            </div>
        </div>
        <div class="form-group">
            <label for="password">Slaptažodis</label>
            <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
            <div id="password" class="invalid-feedback">
                Netaisingai nurodytas
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Prisijungti</button>
    </form>
    <hr>
    <h2>Neturite paskyros Free Shop? <a href="/registration">Registruokis!</a></h2>
</@main.page>