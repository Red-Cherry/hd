<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>添加目录</title>

    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/css/layui/layer.css">
    <link rel="stylesheet" href="dist/modules/toastr/build/toastr.min.css">
    <link rel="stylesheet" href="dist/css/demo.css">
    <link rel="stylesheet" href="dist/css/style.css">
</head>

<body>
<div id="app">
    <div class="main-wrapper">
        <#include "common.ftl"/>
        <div class="main-content">
            <section class="section">
                <h1 class="section-header">
                    <div>法规管理 / 新增目录</div>
                </h1>
                <div class="section-body">
                    <div class="card">
                        <div class="card-body">
                            <div class="col-lg-5 col-md-12 col-12 col-sm-12">
                                <#if dir??>
                                <form action="/addDIr?directoryId=${dir.directoryId}" method="post" onsubmit="check()"
                                      class="needs-validation" novalidate>
                                    <#else>
                                    <form action="/addDIr" method="post" onsubmit="check()" class="needs-validation"
                                          novalidate>
                                        </#if>
                                        <div class="card">
                                            <div class="card-header">
                                                <h4>新增目录</h4>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label>目录名称</label>
                                                    <#if dir??>
                                                        <input id="directoryName" value="${dir.directoryName}"
                                                               type="text" name="directoryName" placeholder="不超过100字"
                                                               class="form-control" required>
                                                    <#else>
                                                        <input type="text" id="directoryName" name="directoryName"
                                                               placeholder="不超过100字" class="form-control" required>
                                                    </#if>
                                                </div>
                                                <div class="form-group">
                                                    <label>同级目录排序</label>
                                                    <#if dir??>
                                                        <input name="level" id="level" type="number"
                                                               class="form-control" placeholder="请输入数字"
                                                               value="${dir.level}" step="1"/>
                                                    <#else>
                                                        <input name="level" id="level" type="number"
                                                               class="form-control" placeholder="请输入数字" required/>
                                                    </#if>
                                                </div>
                                                <div class="form-group">
                                                    <label>选择所属法规:</label>
                                                    <select id="regulationsForeignKey" name="regulationsForeignKey"
                                                            class="form-control" onchange="setSel(this)" required>
                                                        <option value="">请选择</option>
                                                        <#if dir??>
                                                            <#list regulations as law>
                                                                <#if dir.regulationsId == law.regulationsId>
                                                                    <option selected
                                                                            value="${dir.regulationsId}">${dir.regulationsName}</option>
                                                                <#else>
                                                                    <option value="${law.regulationsId}">${law.regulationsName}</option>
                                                                </#if>
                                                            </#list>
                                                        <#else>
                                                            <#list regulations as law>
                                                                <option value="${law.regulationsId}">${law.regulationsName}</option>
                                                            </#list>
                                                        </#if>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>选择父级目录:</label>
                                                    <select id="parentId" name="parentId" class="form-control" required>
                                                        <#if dir??>
                                                            <#if dir.parentId == 0>
                                                                <option selected value="${dir.parentId}">此目录是最高级目录
                                                                </option>
                                                            </#if>
                                                            <#list dirs as d>
                                                                <option value="${d.directoryId}">${d.directoryName}</option>
                                                            </#list>
                                                        <#else>
                                                            <option selected value="">请先选择法规</option>
                                                        </#if>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="card-footer ">
                                                <#if dir??>
                                                    <button type="submit" class="btn btn-primary ">修改目录</button>
                                                <#else>
                                                    <button type="submit" class="btn btn-primary ">新增目录</button>
                                                </#if>
                                            </div>
                                        </div>
                                        <#if dir??>
                                    </form>
                                    <#else>
                                </form>
                                </#if>
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
<input hidden id="addInfo" value="${info!}">
<script src="dist/modules/jquery.min.js "></script>
<script src="dist/modules/popper.js "></script>
<script src="dist/modules/tooltip.js "></script>
<script src="dist/modules/bootstrap/js/bootstrap.min.js "></script>
<script src="dist/modules/nicescroll/jquery.nicescroll.min.js "></script>
<script src="dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js "></script>
<script src="dist/js/sa-functions.js "></script>
<script src="dist/js/layui/layer.js"></script>
<script src="dist/modules/toastr/build/toastr.min.js "></script>
<script src="dist/js/scripts.js "></script>
<script src="dist/js/custom.js "></script>
<script src="dist/js/demo.js "></script>
<script type="text/javascript">
    $(function () {
        let info = $("#addInfo").val();
        console.log(info)
        if (info != null && info != "") {
            layer.msg(info);
        }
    })

    function setSel(obj) {
        var regId = obj.value;//下拉框一的值
        $.ajax({
            url: "/getDIrByRegId",
            type: "post",
            dataType: "json",
            data: {
                regId
            },
            success: function (data) {
                var s = '<option selected value="">请选择</option>\n' +
                    '<option value="0">无</option>\n';
                if (data != 201) {
                    $("#parentId").empty();
                    for (let i = 0; i < data.length; i++) {
                        s += '<option value=\"' + data[i].directoryId + '\">' + data[i].directoryName + '</option>\n'
                    }
                    $("#parentId").append(s)
                } else {
                    $("#parentId").empty();
                    let s1 = '<option value="0" selected>' + "该法规还未添加目录默认为第一级目录" + '</option>\n'
                    $("#parentId").append(s1)
                }
            }
        })
    }

    function check() {
        let directoryName = $("#directoryName").val();
        let level = $("#level").val();
        let regulationsForeignKey = $("#regulationsForeignKey").val();
        if (directoryName == null || directoryName == ""
            || level <= 0 || regulationsForeignKey <= 0) {
            layer.msg("请填写完整数据");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>

</html>