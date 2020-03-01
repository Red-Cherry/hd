<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>法规目录</title>

    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/css/azzara.min.css">
    <link rel="stylesheet" href="dist/css/demo.css">
    <link rel="stylesheet" href="dist/css/style.css">
    <link rel="stylesheet" href="dist/css/layui/layer.css">
</head>

<body>
<div id="app">
    <div class="main-wrapper">
        <#include "common.ftl"/>
        <div class="main-content">
            <section class="section">
                <h1 class="section-header">
                    <div>法规管理 / 法规目录</div>
                </h1>
                <div class="section-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="float-right">
                                        <a href="/toAddDir" class="btn btn-lg btn-primary">新增目录</a>
                                    </div>
                                    <h4>法规目录</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        选择法规:
                                        <select name="law" id="law" class="custom-select-sm col-lg-3"
                                                onchange="setSel(this)">
                                            <option selected value="0">请先选择法规</option>
                                            <#list regulations as law >
                                                <option value="${law.regulationsId}">${law.regulationsPartNoAlias}&nbsp;&nbsp;${law.regulationsName}</option>
                                            </#list>
                                        </select>
                                    </div>
                                    <div class="table-responsive">
                                        <table id="basic-datatables" class="display table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th>目录名称</th>
                                                <th>排序</th>
                                                <th>操作</th>
                                                <th>查看</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>目录名称</th>
                                                <th>排序</th>
                                                <th>操作</th>
                                                <th>查看</th>
                                            </tr>
                                            </tfoot>
                                            <tbody id="dirBody">
                                            </tbody>
                                        </table>
                                    </div>
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
    $(document).ready(function () {
        $('#basic-datatables').dataTable({
            searching: false,
            bLengthChange: false,
            iDisplayLength: 2,
            bInfo: false,
            bSort: false,
            bPaginate: true,
            "oLanguage": {
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据"
            },
        });
    });

    function setSel(obj) {
        var lawId = obj.value;
        $.ajax({
            url: "/getDir",
            type: "post",
            dataType: "json",
            data: {
                lawId
            },
            success: function (data) {
                var s = '';
                var c = '';
                if (data != null && data.length > 0) {
                    $("#dirBody").empty();
                    for (let i = 0; i < data.length; i++) {
                        if (i % 2 == 0) {
                            c = 'odd'
                        } else {
                            c = 'even'
                        }
                        s += '<tr role="row" class= ' + c + ' id="' + data[i].directoryId + '"><td>' + data[i].directoryName + '</td>' +
                            '<td>' + data[i].level + '</td>' +
                            '<td>' +
                            '<a href="/toAddDir?id=' + data[i].directoryId + '&regId=' + data[i].regulationsForeignKey + '" class="btn btn-primary btn-action mr-1" data-toggle="tooltip" title="编辑"><i class="ion ion-edit"></i></a>' +
                            '<a onclick="delDir(' + data[i].directoryId + ')" class="btn btn-danger btn-action" data-toggle="tooltip" title="删除"><i class="ion ion-trash-b"></i></a>' +
                            '</td>' +
                            '<td>' +
                            '<a onclick="showTopTwoDir(' + lawId + ',' + data[i].directoryId + ')" class="btn btn-action btn-secondary">' +
                            '<font style="vertical-align: inherit;">详情</font>' +
                            '</a>' +
                            '</td></tr>';
                    }
                    $("#dirBody").append(s)
                } else {
                    $("#dirBody").empty();
                    s = '<tr><td>该法规还未添加目录</td><td></td><td></td><td></td></tr>'
                    console.log(s)
                    $("#dirBody").append(s)
                }
            }
        })
    }

    function delDir(id) {
        layer.confirm('确认删除？此操作不可逆', {
            btn: ['确认', '取消'] //按钮
        }, function () {
            $.ajax({
                url: "/removeDir",
                type: "post",
                dataType: "json",
                data: {
                    id
                },
                success: function (data) {
                    if (data) {
                        layer.confirm('删除成功', {
                            btn: ['确认'] //按钮
                        }, function () {
                            window.location.href = "/toDirectory"
                        });
                    } else {
                        layer.confirm('删除失败', {
                            btn: ['确认'] //按钮
                        }, function () {
                            window.location.href = "/toDirectory"
                        });
                    }
                }
            })
        }, function () {
            layer.msg('删除已取消', {icon: 1});
        });
    }

    function showTopTwoDir(lawId, parentId) {
        $.ajax({
            url: "/getDir",
            type: "post",
            dataType: "json",
            data: {
                parentId,
                lawId
            },
            success: function (data) {
                var s = '';
                if (data != null && data.length > 0) {
                    $("#parentId").empty();
                    for (let i = 0; i < data.length; i++) {
                        // s += '<tr id="'+ data[i].directoryId + '"><td>' + data[i].directoryName + '</td>' +
                        //     '<td>' + data[i].level + '</td>' +
                        //     '<td>' +
                        //     '<a class="btn btn-primary btn-action mr-1" data-toggle="tooltip" title="编辑"><i class="ion ion-edit"></i></a>' +
                        //     '<a class="btn btn-danger btn-action" data-toggle="tooltip" title="删除"><i class="ion ion-trash-b"></i></a>' +
                        //     '</td>' +
                        //     '<td>' +
                        //     '<a onclick="showTopTwoDir(' + lawId + ',' + data[i].directoryId + ')" class="btn btn-action btn-secondary">' +
                        //     '<font style="vertical-align: inherit;">详情</font>' +
                        //     '</a>'+
                        //     '</td></tr>';
                        s += '<tr><td>aaaaaaa</td><td></td><td></td><td></td></tr>'
                    }
                    $("#parentId").append(s)
                } else {
                    $("#parentId").empty();
                    s = '<tr><td>该目录没有下级</td><td></td><td></td><td></td></tr>'
                    $("#parentId").append(s)
                }
            }
        })
    }
</script>
</body>
</html>