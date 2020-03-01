<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>服务协议</title>

    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/css/demo.css">
    <link rel="stylesheet" href="dist/css/style.css">
    <link rel="stylesheet" href="dist/css/layui/layer.css">
    <script src="dist/ckeditor/ckeditor.js"></script>
</head>

<body>
<div id="app">
    <div class="main-wrapper">
        <#include "common.ftl"/>
        <div class="main-content">
            <section class="section">
                <h1 class="section-header">
                    <div>网站管理 / 服务协议</div>
                </h1>
                <div class="section-body" style="height: 492.5px">
                    <div class="row">
                        <div class="col-12" style="margin: 0 auto">
                            <div class="card">
                                <div class="card-header">
                                    <h4>服务协议</h4>
                                </div>
                                <div class="card-body">
                                    <form method="post" action="/updateServiceContent">
                                        <textarea name="content" id="content">
                                            ${content!}
                                        </textarea>
                                        <script type="text/javascript">
                                            CKEDITOR.replace('content');
                                            CKEDITOR.instances["content"].on('instanceReady', function (e) {
                                                this.document.on("paste", function (e) {
                                                    var items = e.data.$.clipboardData.items;
                                                    for (var i = 0; i < items.length; ++i) {
                                                        var item = items[i];
                                                        if (item.kind == 'file' && item.type == 'image/png') {
                                                            var imgFile = item.getAsFile();
                                                            if (!imgFile) {
                                                                return true;
                                                            }
                                                            var reader = new FileReader();
                                                            reader.readAsDataURL(imgFile);
                                                            reader.onload = function (e) {
                                                                //显示文件
                                                                CKEDITOR.instances["content"].insertHtml('<img src="' + this.result + '" alt="" />');
                                                            }
                                                            return false;
                                                        }
                                                    }
                                                });
                                            });
                                        </script>
                                        <br/><br/>
                                        <button style="float: right" type="submit" class="btn btn-primary ">保存</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <footer class="main-footer">
            <div class="footer-left">
                Copyright &copy; 2018
                <div class="bullet"></div>
                More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from
                <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
            </div>
            <div class="footer-right"></div>
        </footer>
    </div>
</div>
<input value="${info}" hidden id="info">
<script src="dist/modules/jquery.min.js"></script>
<script src="dist/modules/popper.js"></script>
<script src="dist/modules/tooltip.js"></script>
<script src="dist/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/modules/nicescroll/jquery.nicescroll.min.js"></script>
<script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
<script src="dist/js/sa-functions.js"></script>
<script src="dist/js/layui/layer.js"></script>
<script src="dist/js/scripts.js"></script>
<script src="dist/js/custom.js"></script>
<script src="dist/js/demo.js"></script>
<script type="text/javascript">
    $(function () {
        let info = $("#info").val();
        if (info != "") {
            layer.msg(info)
        }
    })
</script>
</body>
</html>