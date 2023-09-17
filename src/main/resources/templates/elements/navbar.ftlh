<#macro navbar user>
    <div>
        <a href="/"></a>
        <span>Free Shop</span>
        <#if user.email??>
            <div>
                <a href="/profile">
                    <img src="<#if user.avatar??>/images/${user.avatar.id}<#else>/img/avatar.png</#if>" alt="mdo"
                         width="32" height="32">
                </a>
            </div>
            <#else>
            <button type="button" onclick="window.location.href='/login'">
                Prisijungti
            </button>
        </#if>
    </div>
</#macro>