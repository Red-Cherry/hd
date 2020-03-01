<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>法规类型列表</title>

    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/css/azzara.min.css">
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
                    <div>法规管理 / 新增条款</div>
                </h1>
                <div class="section-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">新增条款</h4>
                                </div>
                                <div class="card-body">
                                    <div class="col-8">
                                        <#if clause??>
                                        <form action="/addClause?clauseId=${clause.clauseId}" method="post"
                                              onsubmit="return chack()">
                                            <#else >
                                            <form action="/addClause" method="post" onsubmit="return chack()">
                                                </#if>
                                                <div class="col-lg-6 col-md-9 col-sm-8">
                                                    <label>*法规:</label>
                                                    <select class="form-control col-8" name="regForeignKey"
                                                            id="regForeignKey" onchange="setSel(this)">
                                                        <option value="-1" selected="selected">请选择</option>
                                                        <#if clause??>
                                                            <#list regs as reg>
                                                                <#if clause.regForeignKey = reg.regulationsId>
                                                                    <option value="${reg.regulationsId}"
                                                                            selected>${reg.regulationsPartNoAlias}
                                                                        &nbsp;&nbsp;${reg.regulationsName}</option>
                                                                <#else>
                                                                    <option value="${reg.regulationsId}">${reg.regulationsPartNoAlias}
                                                                        &nbsp;&nbsp;${reg.regulationsName}</option>
                                                                </#if>
                                                            </#list>
                                                        </#if>
                                                    </select>
                                                </div>
                                                <br/>
                                                <div class="col-lg-6 col-md-9 col-sm-8">
                                                    <label>*所在目录:</label>
                                                    <select class="form-control col-8" name="directoryForeignKey"
                                                            id="directoryForeignKey">
                                                        <#if clause??>
                                                            <option value="${clause.directoryForeignKey}" selected>
                                                                <#if clause??>
                                                                    ${clause.directoryName!}
                                                                </#if>
                                                            </option>
                                                            <option value="0">请先选择法规</option>
                                                        <#else>
                                                            <option value="0" selected="selected">请先选择法规</option>
                                                        </#if>
                                                    </select>
                                                </div>
                                                <br/>
                                                <#if clause??>
                                                    <div class="form-group col-lg-6 col-md-9 col-sm-8">
                                                        <label>*条款编号:</label>
                                                        <input type="text" id="clauseNo" name="clauseNo"
                                                               placeholder="请输入条款编号" value="${clause.clauseNo}"
                                                               class="form-control" required>
                                                        <br/>
                                                        <label>条款编号别名:</label>
                                                        <input type="text" id="clauseNoAlias" name="clauseNoAlias"
                                                               placeholder="请输入条款编号别名" value="${clause.clauseNoAlias}"
                                                               class="form-control"
                                                               required>
                                                        <br/>
                                                        <label>条款版本号:</label>
                                                        <input type="text" id="clauseVersion" name="clauseVersion"
                                                               placeholder="请输入条款版本号" value="${clause.clauseVersion}"
                                                               class="form-control"
                                                               required>
                                                        <br/>
                                                        <label>*条款标题:</label>
                                                        <input type="text" id="clauseTitle" name="clauseTitle"
                                                               placeholder="请输入条款标题" value="${clause.clauseTitle}"
                                                               class="form-control" required>
                                                        <br/>
                                                        <label>关键词:</label>
                                                        <input type="text" id="clauseKeywords" name="clauseKeywords"
                                                               placeholder="请输入部号数字" value="${clause.clauseKeywords}"
                                                               class="form-control" required>
                                                    </div>
                                                <#else>
                                                    <div class="form-group col-lg-6 col-md-9 col-sm-8">
                                                        <label>*条款编号:</label>
                                                        <input type="text" id="clauseNo" name="clauseNo"
                                                               placeholder="请输入条款编号" class="form-control" required>
                                                        <br/>
                                                        <label>条款编号别名:</label>
                                                        <input type="text" id="clauseNoAlias" name="clauseNoAlias"
                                                               placeholder="请输入条款编号别名" class="form-control"
                                                               required>
                                                        <br/>
                                                        <label>条款版本号:</label>
                                                        <input type="text" id="clauseVersion" name="clauseVersion"
                                                               placeholder="请输入条款版本号" class="form-control"
                                                               required>
                                                        <br/>
                                                        <label>*条款标题:</label>
                                                        <input type="text" id="clauseTitle" name="clauseTitle"
                                                               placeholder="请输入条款标题" class="form-control" required>
                                                        <br/>
                                                        <label>关键词:</label>
                                                        <input type="text" id="clauseKeywords" name="clauseKeywords"
                                                               placeholder="请输入部号数字" class="form-control" required>
                                                    </div>
                                                </#if>
                                                <br/>
                                                <label>*条款内容:</label>
                                                <textarea name="clauseContent" id="clauseContent">
                                                    <#if clause??>
                                                        ${clause.clauseContent!}
                                                    </#if>
                                                </textarea>
                                                <script type="text/javascript">
                                                    CKEDITOR.replace('clauseContent');
                                                    CKEDITOR.instances["clauseContent"].on('instanceReady', function (e) {
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
                                                                        CKEDITOR.instances["clauseContent"].insertHtml('<img src="' + this.result + '" alt="" />');
                                                                    }
                                                                    return false;
                                                                }
                                                            }
                                                        });
                                                    });
                                                </script>
                                                <br/><br/>
                                                <button type="submit" class="btn btn-primary">保存</button>
                                                <#if clause??>
                                            </form>
                                            <#else>
                                        </form>
                                        </#if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <input id="addCode" value="${addCode!}"/>
    </div>
</div>

<script src="dist/modules/jquery.min.js"></script>
<script src="dist/modules/popper.js"></script>
<script src="dist/modules/tooltip.js"></script>
<script src="dist/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="dist/modules/nicescroll/jquery.nicescroll.min.js"></script>
<script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
<script src="dist/js/sa-functions.js"></script>
<script src="dist/js/datatables.min.js"></script>
<script src="dist/js/scripts.js"></script>
<script src="dist/js/custom.js"></script>
<script src="dist/js/demo.js"></script>
<script src="dist/js/layui/layer.js"></script>
<script type="text/javascript">
    $(function () {
        let addCode = $("#addCode").val()
        if (addCode == 200) {
            layer.msg("添加成功")
        } else if (addCode == 2000) {
            layer.msg("修改成功")
        }

    function setSel(obj) {
        var regId = obj.value;//下拉框一的值
        $.ajax({
            url: "/getRegDir",
            type: "post",
            dataType: "json",
            data: {
                regId
            },
            success: function (data) {
                var s = '<option value="-2" selected="selected">请选择</option>' +
                    '<option value="-1">无</option>';
                if (data != null && data.length > 0) {
                    $("#directoryForeignKey").empty();
                    for (let i = 0; i < data.length; i++) {
                        s += '<option value=\"' + data[i].directoryId + '\">' + data[i].directoryName + '</option>\n'
                    }
                    $("#directoryForeignKey").append(s)
                } else {
                    $("#directoryForeignKey").empty();
                    s = '<option selected=selected>该法规还没有目录</option>\n'
                    $("#directoryForeignKey").append(s)
                }
            }
        })
    }

    function chack() {
        let regForeignKey = $("#regForeignKey").val()
        let directoryForeignKey = $("#directoryForeignKey").val()
        let clauseContent = CKEDITOR.instances.clauseContent.getData()
        console.log(clauseContent)
        if (regForeignKey == -1) {
            layer.msg("请选择法规")
            return false;
        } else if (directoryForeignKey == -2) {
            layer.msg("请选择目录")
            return false;
        } else if (clauseContent == null || clauseContent == "") {
            layer.msg("请输入条款内容")
        }
        return true;
    }
</script>
</body>
</html>