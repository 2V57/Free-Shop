<#import "navbar.ftlh" as navbar>
<#macro page main user>
    <!doctype html>
    <html>
    <head>
        <title>Free Shop</title>
    </head>
    <body>
        <@navbar.navbar user />

        <#nested />

        <#include "footer.ftlh"/>
        </body>
    </html>
</#macro>