<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>用户列表</title>

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
                    <div>用户管理 / 用户列表</div>
                </h1>
                <div class="section-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">用户列表</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="basic-datatables" class="display table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th>姓名</th>
                                                <th>手机号</th>
                                                <th>性别</th>
                                                <th>会员类型</th>
                                                <th>注册日期</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>姓名</th>
                                                <th>手机号</th>
                                                <th>性别</th>
                                                <th>会员类型</th>
                                                <th>注册日期</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <#if usersErr??>
                                                <tr>
                                                    <td colspan="5" style="text-align: center">${usersErr}</td>
                                                </tr>
                                            </#if>
                                            <#list users as user>
                                                <tr>
                                                    <td>${user.userName}</td>
                                                    <td>${user.userPhone}</td>
                                                    <td>
                                                        <#if user.userSex == 1>
                                                            男
                                                        <#elseif user.userSex == 2>
                                                            女
                                                        </#if>
                                                    </td>
                                                    <td>
                                                        <#if user.userType == 1>
                                                            <input type="radio" name="sex" value="1" checked="true"/>免费
                                                            <input type="radio" name="sex" value="2"/>付费
                                                        <#elseif user.userType == 2>
                                                            <input type="radio" name="sex" value="1"/>免费
                                                            <input type="radio" name="sex" value="2" checked="true"/>付费
                                                        </#if>
                                                    </td>
                                                    <td>${user.userCreateTime?datetime}</td>
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
</script>
</body>
</html>