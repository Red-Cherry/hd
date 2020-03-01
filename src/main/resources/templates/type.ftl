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
</head>

<body>
<div id="app">
    <div class="main-wrapper">
        <#include "common.ftl"/>
        <div class="main-content">
            <section class="section">
                <h1 class="section-header">
                    <div>法规管理 / 法规类型列表</div>
                </h1>
                <div class="section-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">法规类型列表</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="basic-datatables" class="display table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th>序号</th>
                                                <th>级别一</th>
                                                <th>级别二</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>序号</th>
                                                <th>级别一</th>
                                                <th>级别二</th>
                                                <th>操作</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <#list typeInfo as type>
                                                <tr>
                                                    <td>${type_index + 1!}</td>
                                                    <td>${type.top1Name!}</td>
                                                    <td>${type.top2Name!}</td>
                                                    <td>
<#--                                                        <a href="#" id="alert_demo_8">删除</a>-->
                                                        <a href="#" onclick="add(2, ${type.id})" id="alert_demo_5">添加</a>
                                                    </td>
                                                </tr>
                                            </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                    <a href="#">
                                        <button onclick="add(1, 0)" type="button" class="btn btn-primary"
                                                id="alert_demo_5">一级目录添加
                                        </button>
                                    </a>
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
<script src="dist/js/sweetalert.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#basic-datatables').dataTable({
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "aLengthMenu": [1, 2, 5, 10],//设置每页显示数据条数的下拉选项
                "sZeroRecords": "抱歉， 没有找到",
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

    function add(num, id) {
        swal({
            title: '请输入法规类型',
            html: '<br><input class="form-control" placeholder="请输入法规类型" id="input-field">',
            content: {
                element: "input",
                attributes: {
                    placeholder: "请输入法规类型",
                    type: "text",
                    id: "input-field",
                    className: "form-control"
                },
            },
            buttons: {
                confirm: {
                    name: "添加",
                    className: 'btn btn-success'
                }
            },
        }).then(function (isConfirm) {
            if (isConfirm != null && isConfirm != "") {
                $.ajax({
                    type: "post",
                    url: "/addType",
                    dataType: "json",
                    data: {
                        "typeNum": num,
                        "typeName": $("#input-field").val(),
                        "topId": id
                    },
                    success: function (data) {
                        if (data == 200) {
                            swal("添加成功", $('#input-field').val())
                            setTimeout(function () {
                                window.location.href = "/toType"
                            }, 2000);
                        }
                    }
                })
            }
        });
    }

    $('#alert_demo_8').click(function (e) {
        swal({
            title: '确认删除？',
            text: "此操作不可逆",
            type: 'warning',
            buttons: {
                cancel: {
                    visible: true,
                    text: 'No, cancel!',
                    className: 'btn btn-danger'
                },
                confirm: {
                    text: 'Yes, delete it!',
                    className: 'btn btn-success'
                }
            }
        }).then((willDelete) => {
            if (willDelete) {
                swal("Poof! Your imaginary file has been deleted!", {
                    icon: "success",
                    buttons: {
                        confirm: {
                            className: 'btn btn-success'
                        }
                    }
                });
            } else {
                swal("Your imaginary file is safe!", {
                    buttons: {
                        confirm: {
                            className: 'btn btn-success'
                        }
                    }
                });
            }
        });
    })
</script>
</body>
</html>