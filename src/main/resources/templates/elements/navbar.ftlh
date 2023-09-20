<#macro navbar user>


    <nav class="navbar navbar-dark bg-dark">



        <div class="container-fluid">
            <a href="/">
                <span class="navbar-brand mb-0 h1">Free Shop</span>
            </a>

            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <@spring.message 'lang.lt'/>/<@spring.message 'lang.en'/>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item "  onclick="setLanguage('lt')"><@spring.message 'lang.lt'/></a>
                    <a class="dropdown-item " onclick="setLanguage('en')"><@spring.message 'lang.en'/></a>
                </div>
            </div>




            <#if user.email??>
                <div class="dropdown text-end">
                    <a href="/profile">
                        <img src="<#if user.avatar??>/images/${user.avatar.id}<#else>/img/avatar.jpg</#if>" alt="mdo"
                             width="32" height="32" class="rounded-circle">
                    </a>
                </div>

            <#else>
                <button class="btn btn-dark my-2 my-sm-0" type="button"
                        onclick="window.location.href = '/login'">
                    Prisijungti
                </button>
            </#if>

        </div>
    </nav>
</#macro>