<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>新增法规</title>
    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/modules/toastr/build/toastr.min.css">
    <link rel="stylesheet" href="dist/modules/summernote/summernote-lite.css">
    <link rel="stylesheet" href="dist/css/demo.css">
    <link rel="stylesheet" href="dist/css/style.css">
</head>

<body>
<div id="app">
    <div class="main-wrapper">
        <#include "common.ftl">
        <div class="main-content">
            <section class="section">
                <h1 class="section-header">
                    <div>法规管理 / 新增法规</div>
                </h1>
                <div class="section-body">
                    <div class="card">
                        <div class="card-body">
                            <div class="col-lg-5 col-md-12 col-12 col-sm-12">
                                <div class="form" action="/addRegulations" method="post" class="needs-validation"
                                     novalidate>
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>新增法规 ${erroe!}</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group form-show-notify row">
                                                <div class="col-lg-4 col-md-9 col-sm-8">
                                                    <label>一级类别:</label>
                                                    <select class="form-control input-fixed" id="test1"
                                                            onchange="setSel(this)">
                                                        <option value="0" selected="selected">请选择</option>
                                                        <#list types as type>
                                                            <option value="${type.id}">${type.typeName}</option>
                                                        </#list>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group form-show-notify row">
                                                <div class="col-lg-4 col-md-9 col-sm-8">
                                                    <label>二级类别:</label>
                                                    <select class="form-control input-fixed" name="typeId"
                                                            id="notify_style">
                                                        <option value="0" selected="selected">请选择</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>法规部号</label>
                                                <input type="text" id="regulationsPartNo" name="regulationsPartNo"
                                                       placeholder="请输入部号数字" class="form-control" required>
                                                <div class="invalid-feedback">
                                                    请填写法规编号
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>法规部号别名</label>
                                                <input type="text" id="regulationsPartNoAlias"
                                                       name="regulationsPartNoAlias" placeholder="不超过100字"
                                                       class="form-control" required>
                                                <div class="invalid-feedback">
                                                    请填写法规部号别名
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>法规版本号</label>
                                                <input type="text" id="regulationsVersion" name="regulationsVersion"
                                                       placeholder="提示文字" class="form-control"
                                                       required>
                                                <div class="invalid-feedback">
                                                    请填写法规版本号
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>法规名称</label>
                                                <input type="text" id="regulationsName" name="regulationsName"
                                                       placeholder="提示文字" class="form-control"
                                                       required>
                                                <div class="invalid-feedback">
                                                    请填写法规名称
                                                </div>
                                            </div>
                                            <div class="form-group form-show-notify row">
                                                <div class="col-lg-4 col-md-9 col-sm-8">
                                                    <label>是否显示:</label>
                                                    <select class="form-control input-fixed" id="show"
                                                            name="regulationsShowStatus">
                                                        <option value="0" selected="selected">请选择</option>
                                                        <option value="1">显示</option>
                                                        <option value="2">不显示</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>首页法规图标：</label>
                                                <input class="form-control-file" type="file">
                                                <div class="invalid-feedback">
                                                    请选择首页法规图标
                                                </div>
                                            </div>
                                            <div class="form-group custom-file">
                                                <label>请上传PDF文件</label>
                                                <input class="form-control-file" type="file">
                                                <div class="invalid-feedback">
                                                    请上传PDF文件
                                                </div>
                                            </div>
                                            <br/><br/><br/>
                                            <div class="form-group">
                                                <label>法规PDF文件名称</label>
                                                <input type="text" id="regulationsPdfName" name="regulationsPdfName"
                                                       placeholder="不超过100字"
                                                       class="form-control" required>
                                                <div class="invalid-feedback">
                                                    请填写法规PDF文件名称
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>法规PDF文件下载链接</label>
                                                <input type="text" id="regulationsPdfPath" name="regulationsPdfPath"
                                                       placeholder="不超过100字"
                                                       class="form-control" required>
                                                <div class="invalid-feedback">
                                                    请填写法规PDF文件下载链接
                                                </div>
                                            </div>
                                            <br/><br/><br/><br/><br/><br/><br/><br/>
                                            <div class="form-group ">
                                                <label>法规版本说明</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <textarea class="summernote-simple" id="regulationsVersionExplain"
                                                          name="regulationsVersionExplain"></textarea>
                                            </div>
                                            <div class="card-footer ">
                                                <button type="submit" onclick="check()" class="btn btn-primary">保存</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <footer class="main-footer ">
            <div class="footer-left ">
                Copyright &copy; 2018
                <div class="bullet "></div>
                More Templates <a href="http://www.cssmoban.com/ " target="_blank " title="模板之家 ">模板之家</a> - Collect
                from <a href="http://www.cssmoban.com/ " title="网页模板 " target="_blank ">网页模板</a>
            </div>
            <div class="footer-right "></div>
        </footer>
    </div>
</div>

<script src="dist/modules/jquery.min.js "></script>
<script src="dist/modules/popper.js "></script>
<script src="dist/modules/tooltip.js "></script>
<script src="dist/modules/bootstrap/js/bootstrap.min.js "></script>
<script src="dist/modules/nicescroll/jquery.nicescroll.min.js "></script>
<script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js "></script>
<script src="dist/js/sa-functions.js "></script>

<script src="dist/modules/toastr/build/toastr.min.js "></script>
<script src="dist/js/scripts.js "></script>
<script src="dist/js/custom.js "></script>
<script src="dist/js/demo.js "></script>

<script src="dist/modules/summernote/summernote-lite.js"></script>
<script type="text/javascript">
    function setSel(obj) {
        var k1 = obj.value;//下拉框一的值
        $.ajax({
            url: "/getTopTwo",
            type: "post",
            dataType: "json",
            data: {
                "id": k1
            },
            success: function (data) {
                console.log(data)
                var s = '';
                if (data != null && data.length > 0) {
                    $("#notify_style").empty();
                    for (let i = 0; i < data.length; i++) {
                        s += '<option value=\"' + data[i].id + '\">' + data[i].typeName + '</option>\n'
                    }
                    $("#notify_style").append(s)
                } else {
                    $("#notify_style").empty();
                    s = '<option selected=selected>该类别没有下级</option>\n'
                    $("#notify_style").append(s)
                }
            }
        })
    }

    function check() {
        var no = $("#regulationsPartNo").val()
        var alias = $("#regulationsPartNoAlias").val()
        var version = $("#regulationsVersion").val()
        var name = $("#regulationsName").val()
        var show = $("#regulationsShowStatus").val()
        var pdfName = $("#regulationsPdfName").val()
        var pdfPath = $("#regulationsPdfPath").val()
        var vExplain = $("#regulationsVersionExplain").val()
        var type = $("#typeId").val()
        if (no == null || no == "" || alias == null || alias == ""
            || version == null || version == "" || name == null || name == "" || pdfPath == null || pdfPath == ""
            || show == 0 || pdfName == null || pdfName == "" || vExplain == null || vExplain == ""
            || type == 0) {
            return false
            alert("请将信息填写完整")
        }
    }
</script>
</body>

</html>