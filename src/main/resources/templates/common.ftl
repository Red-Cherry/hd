<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
    <form class="form-inline mr-auto"></form>
    <ul class="navbar-nav navbar-right">
        <a href="/logout" class="nav-link nav-link-lg">
            <div class="d-sm-none d-lg-inline-block">退出</div>
        </a>
    </ul>
</nav>
<div class="main-sidebar">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="index.ftl">${title!}</a>
        </div>
        <ul class="sidebar-menu">
            <li class="menu-header">航多后台管理</li>
            <li>
                <a href="#" class="has-dropdown"><i class="ion ion-ios-albums-outline"></i><span>法规管理</span></a>
                <ul class="menu-dropdown">
                    <li><a href="/toLaw"><i class="ion ion-ios-circle"></i> 法规列表</a></li>
                    <li><a href="/toType"><i class="ion ion-ios-circle"></i> 类型列表</a></li>
                    <li><a href="/toAddLaw"><i class="ion ion-ios-circle"></i> 新增法规</a></li>
                    <li><a href="/toDirectory"><i class="ion ion-ios-circle"></i> 法规目录管理</a></li>
                    <li><a href="/toAddDir"><i class="ion ion-ios-circle"></i> 新增目录</a></li>
                    <li><a href="/toClause"><i class="ion ion-ios-circle"></i> 条款列表</a></li>
                    <li><a href="/toAddClause"><i class="ion ion-ios-circle"></i> 新增条款</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="has-dropdown"><i class="ion ion-person"></i><span>用户管理</span></a>
                <ul class="menu-dropdown">
                    <li><a href="/toUser"><i class="ion ion-ios-circle"></i>用户列表</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="has-dropdown"><i class="ion ion-ios-copy-outline"></i><span>资讯管理</span></a>
                <ul class="menu-dropdown">
                    <li><a href="/toConsult"><i class="ion ion-ios-circle"></i> 资讯列表</a></li>
                    <li><a href="/toFeedBack"><i class="ion ion-ios-circle"></i> 意见反馈列表</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="has-dropdown"><i class="ion ion-gear-a"></i> 设置</a>
                <ul class="menu-dropdown">
                    <li><a href="/toWebSet"><i class="ion ion-ios-circle"></i> 网站设置</a></li>
                    <li><a href="/toAboutUs"><i class="ion ion-ios-circle"></i> 公司介绍</a></li>
                    <li><a href="/toService"><i class="ion ion-ios-circle"></i> 服务协议</a></li>
                    <li><a href="/toEmail"><i class="ion ion-ios-circle"></i> 邮件SMTP设置</a></li>
                    <li><a href="/toSms"><i class="ion ion-ios-circle"></i> 短信设置</a></li>
                    <li><a href="/toAdmin"><i class="ion ion-ios-circle"></i> 管理员管理</a></li>
                    </li>
                </ul>
            </li>
        </ul>
    </aside>
</div>