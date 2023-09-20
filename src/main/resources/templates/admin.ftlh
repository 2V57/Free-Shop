<#import "elements/main.ftlh" as main>
<@main.page false user>


<h1 style="text-align: center">Administratoriaus skydelis</h1><hr>
<table class="table table-hover table-dark">
    <tr>
        <th scope="col">El. paštas</th>
        <th scope="col">Telefono numeris</th>
        <th scope="col">Aktyvuotas</th>
        <th scope="col">Rolė</th>
        <th scope="col">Užblokuoti</th>
        <th scope="col">Redaguoti</th>
        <th scope="col">Detali informacija</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th>${user.phoneNumber}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" class="btn btn-light" value="Užblokuoti">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Redaguoti</a></th>
            <th><a href="/user/${user.id}">Detali informacija</a></th>
        </tr>
    </#list>
</table>

</@main.page>