<#import "elements/main.ftlh" as main>
<@main.page true user>
    <h1 style="text-align: center">Paskyros aktyvinimas</h1>
    <hr>
    <h3 style="text-align: center">
    <#if activate>
        Sveikiname! Tavo elektroninis paštas
        buvo sėkmingai patvirtintas.
        <br>
        <a href="/login">Dabar galite prisijungti</a>
        <#else>
            Raktas nerastas! El. pašto patvirtinimo klaida.
    </#if>
</@main.page>