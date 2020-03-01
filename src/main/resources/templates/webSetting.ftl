<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>网站设置</title>

    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/css/layui/layer.css">
    <link rel="stylesheet" href="dist/modules/summernote/summernote-lite.css">
    <link rel="stylesheet" href="dist/modules/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="dist/css/demo.css">
    <link rel="stylesheet" href="dist/css/style.css">
</head>

<body>
<div id="app">
    <div class="main-wrapper">
        <#include "common.ftl"/>
        <section class="section">
            <h1 class="section-header">
                <div>网站管理 / 网站设置</div>
            </h1>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h4>网站设置</h4>
                            </div>
                            <div class="card-body">
                                <form method="POST" action="/updateWeb">
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label for="last_name">网站状态</label>
                                            <select id="webStatus" name="webStatus" class="form-control" required>
                                                <#if web??>
                                                    <#if web.webStatus == 1>
                                                        <option selected value="1">正常</option>
                                                        <option value="2">关闭</option>
                                                    <#else>
                                                        <option value="1">正常</option>
                                                        <option selected value="2">关闭</option>
                                                    </#if>
                                                <#else>
                                                    <option>${webErr}</option>
                                                </#if>
                                            </select>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="last_name">网站标题</label>
                                            <#if web??>
                                                <input value="${web.webTitle}" id="webTitle"  name="webTitle" type="text" class="form-control" required>
                                            </#if>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>网站域名</label>
                                        <#if web??>
                                            <input value="${web.webDomainName}" id="webDomainName" name="webDomainName" type="text" class="form-control" required>
                                        </#if>
                                    </div>

                                    <div class="row">
                                        <div class="form-group">
                                            <label class="d-block">网站logo</label>
                                            <#if web??>
                                                <img src="dist/img/news/img01.jpg">
                                            </#if>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="webEmail" class="d-block">公司邮箱</label>
                                        <#if web??>
                                            <input value="${web.webEmail}" id="webEmail" type="email" class="form-control" name="webEmail" required>
                                        </#if>
                                    </div>
                                    <div class="form-group">
                                        <label for="last_name">站点语言</label>
                                        <select id="language" name="language" class="form-control" required>
                                            <option selected value="1">简体中文</option>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div style="height: 5px; width: 320px"></div>
                                        <button type="submit" class="btn form-button-action">保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<input hidden id="info" value="${info!}">
<script src="dist/modules/jquery.min.js"></script>
<script src="dist/modules/popper.js"></script>
<script src="dist/modules/tooltip.js"></script>
<script src="dist/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/modules/nicescroll/jquery.nicescroll.min.js"></script>
<script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
<script src="dist/js/sa-functions.js"></script>
<script src="dist/modules/chart.min.js"></script>
<script src="dist/modules/summernote/summernote-lite.js"></script>
<script src="dist/js/scripts.js"></script>
<script src="dist/js/custom.js"></script>
<script src="dist/js/demo.js"></script>
<script src="dist/js/layui/layer.js"></script>
<script type="text/javascript">
    $(function () {
        let info = $("#info").val()
        if (info != ""){
            layer.msg(info)
        }
    })
</script>
</body>
</html>
