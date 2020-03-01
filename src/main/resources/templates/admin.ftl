<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>管理员列表</title>
    <link rel="stylesheet" href="dist/css/layui/layer.css">
    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/css/azzara.min.css">
    <link rel="stylesheet" href="dist/css/demo.css">
    <link rel="stylesheet" href="dist/css/style.css">
    <script src="dist/modules/jquery.min.js"></script>
    <script src="dist/dist/js/bootstrap.min.js"></script>
    <script src="dist/js/bootstrap-show-password.js"></script>
</head>

<body>
<div id="app">
    <div class="main-wrapper">
        <#include "common.ftl"/>
        <div class="main-content">
            <section class="section">
                <h1 class="section-header">
                    <div>系统管理 / 管理员列表</div>
                </h1>
                <div class="section-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">管理员列表</h4>
                                </div>
                                <div class="card-body">
                                    <form method="POST" action="/addAdmin" autocomplete="off">
                                        <div class="row">
                                            <div class="form-group col-3">
                                                <label for="last_name">姓名</label>
                                                    <input id="adminName"  name="adminName" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group col-3">
                                                <label for="last_name">手机号</label>
                                                    <input id="adminPhone"  name="adminPhone" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group col-3">
                                                <label for="last_name">密码</label>
                                                <input data-toggle="password" data-placement="after" type="password" name="adminPassword" id="adminPassword" class="form-control" data-eye-open-class="显示" data-eye-close-class="隐藏" data-eye-class-position-inside="true" data-message="点击隐藏或显示密码" required>
                                            </div>

                                        </div>
                                        <button type="submit" class="btn btn-primary" style="position: relative; top: -56px; left: 1250px">添加</button>
                                    </form>
                                    <div class="table-responsive">
                                        <table id="basic-datatables" class="display table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th>管理员手机号</th>
                                                <th>管理员姓名</th>
                                                <th>添加日期</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>管理员手机号</th>
                                                <th>管理员姓名</th>
                                                <th>添加日期</th>
                                                <th>操作</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <#list admins as admin>
                                                <tr>
                                                    <td>${admin.adminPhone!}</td>
                                                    <td>${admin.adminName!}</td>
                                                    <td>${admin.adminCreateTime!?datetime}</td>
                                                    <td>
                                                        <a href="#" onclick="edit('${admin.adminId}', '${admin.adminPhone}', '${admin.adminName}', '${admin.adminPassword}')">编辑</a>
                                                        <a href="#" onclick="delAdmin(${admin.adminId})">删除</a>
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
    </div>
</div>
<input hidden value="${addInfo!}" id="addInfo">
<input hidden value="${updateCode!}" id="updateCode">
<script src="dist/modules/popper.js"></script>
<script src="dist/modules/tooltip.js"></script>
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
        let addInfo = $("#addInfo").val()
        let updateCode = $("#updateCode").val()
        if (addInfo == 200) {
            layer.msg("添加成功")
        } else if (addInfo == 400) {
            layer.msg("添加失败")
        }
        if (updateCode == 200) {
            layer.msg("修改成功")
        } else if (updateCode == 400) {
            layer.msg("修改失败")
        }
    })
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
    function edit(id, phone, name, password) {
        //边缘弹出
        layer.open({
            type: 1
            , area: ['500px', '370px']
            , offset: 'auto' //具体配置参考：offset参数项
            , content: '<form method="post" action="/updateAdmin?adminId=' + id + '" autocomplete="off">\n' +
                '    <div class="form-group">\n' +
                '        <label>*手机号</label>\n' +
                '        <input value="' + phone + '" type="text" name="adminPhone" id="adminPhone" class="form-control" required>\n' +
                '        <div class="invalid-feedback">\n' +
                '            请输入手机号\n' +
                '        </div>\n' +
                '        <label>*管理员姓名</label>\n' +
                '        <input value="' + name + '" type="text" name="adminName" id="adminName" class="form-control" required>\n' +
                '        <div class="invalid-feedback">\n' +
                '            请输入管理员姓名\n' +
                '        </div>\n' +
                '        <label>*密码</label>\n' +
                '        <input data-toggle="password" data-placement="after" value="' + password + '" type="password" name="adminPassword" id="adminPassword" ' +
                '               class="form-control" data-eye-open-class="显示" data-eye-close-class="隐藏" data-eye-class-position-inside="true" ' +
                '               data-message="点击隐藏或显示密码" required>\n' +
                '        <div class="invalid-feedback">\n' +
                '            请输入密码\n' +
                '        </div>\n' +
                '        <button type="submit" class="btn form-button" style="position: relative; top: 20px; left: 115px">保存</button>' +
                '        <button onclick="layer.closeAll()" type="button" class="btn form-button" style="position: relative; top: 20px; left: 215px">关闭</button>' +
                '    </div>\n' +
                '</form>'
        });
    }
    function delAdmin(id) {
        layer.confirm('确认删除？此操作不可逆', {
            btn: ['确认', '取消'] //按钮
        }, function () {
            $.ajax({
                url: "/dleAdmin",
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
                            window.location.href = "/toAdmin"
                        });
                    } else {
                        layer.confirm('删除失败', {
                            btn: ['确认'] //按钮
                        }, function () {
                            window.location.href = "/toAdmin"
                        });
                    }
                }
            })
        }, function () {
            layer.msg('删除已取消', {icon: 1});
        });
    }
</script>
</body>
</html>