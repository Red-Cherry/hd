<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>条款列表</title>

    <link rel="stylesheet" href="dist/css/layui/layer.css">
    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/css/azzara.min.css">
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
                    <div>法规管理 / 条款列表</div>
                </h1>
                <div class="section-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">条款列表</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="basic-datatables" class="display table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th>条款号</th>
                                                <th>条款号别名</th>
                                                <th>条款标题</th>
                                                <th>所属法规名称</th>
                                                <th>版本号</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>条款号</th>
                                                <th>条款号别名</th>
                                                <th>条款标题</th>
                                                <th>所属法规名称</th>
                                                <th>版本号</th>
                                                <th>操作</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <#if clausesErr??>
                                                <td colspan="6" style="text-align: center">${clausesErr}</td>
                                            </#if>
                                            <#list clauses as clause>
                                                <tr>
                                                    <td>${clause.clauseNo!}</td>
                                                    <td>${clause.clauseNoAlias!}</td>
                                                    <td>${clause.clauseTitle!}</td>
                                                    <td>${clause.regulationsName!}</td>
                                                    <td>${clause.clauseVersion}</td>
                                                    <td>
                                                        <a href="/toAddClause?id=${clause.clauseId}">编辑</a>
                                                        <a href="#" onclick="delClause(${clause.clauseId})">删除</a>
                                                    </td>
                                                </tr>
                                            </#list>
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
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "aLengthMenu": [1, 2, 5, 10],//设置每页显示数据条数的下拉选项
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据",
                "sSearch": "综合查找"
            }
        });
    });

    function delClause(id) {
        layer.confirm('确认删除？此操作不可逆', {
            btn: ['确认', '取消'] //按钮
        }, function () {
            $.ajax({
                url: "/removeClause",
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
                            window.location.href = "/toClause"
                        });
                    } else {
                        layer.confirm('删除失败', {
                            btn: ['确认'] //按钮
                        }, function () {
                            window.location.href = "/toClause"
                        });
                    }
                }
            })
        }, function () {
            layer.msg('删除已取消', {icon: 1});
        });
    }
    
    function f() {

    }
</script>
</body>
</html>