<#import "elements/main.ftlh" as main>
<@main.page true user>
    <h1 style="text-align: center">Registracija</h1>
    <hr>
    <form action="/registration" method="post">
        <div class="form-group">
            <label for="name">Vardas: </label>
            <input type="text" class="form-control" required id="name" name="name">
        </div>
        <div class="form-group">
            <label for="email">El.paštas: </label>
            <input type="email" class="form-control" required id="email" name="email" >
        </div>
        <div class="form-group">
            <label for="phoneNumber">Telefono numeris: </label>
            <input type="text" class="form-control" required id="phoneNumber" name="phoneNumber" >
        </div>
        <div class="form-group">
            <label for="phoneNumber">Slaptažodis: </label>
            <input type="password" class="form-control" required id="password" name="password" >
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Registruotis</button>
    </form>
</@main.page>