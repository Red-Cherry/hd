<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no"
          name="viewport">
    <title>邮件SMTP设置</title>

    <link rel="stylesheet" href="dist/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="dist/modules/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="dist/css/layui/layer.css">
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
                    <div>网站管理 / 邮件SMTP设置</div>
                </h1>
                <div class="section-body">
                    <div class="row">
                        <div class="col-6" style="margin: 0 auto">
                            <div class="card">
                                <div class="card-header">
                                    <h4>邮件SMTP设置</h4>
                                </div>
                                <div class="card-body">
                                    <form method="post" action="/updateEmail">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input value="${email.SMTPEmail}" type="email" name="SMTPEmail" id="SMTPEmail" class="form-control" required>
                                            <div class="invalid-feedback">
                                                请输入Email
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>服务器</label>
                                            <input value="${email.SMTPServer}" type="text" name="SMTPServer" id="SMTPServer" class="form-control" required>
                                            <div class="invalid-feedback">
                                                请输入服务器
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>用户名</label>
                                            <input value="${email.SMTPUsername}" type="text" name="SMTPUsername" id="SMTPUsername" class="form-control" required>
                                            <div class="invalid-feedback">
                                                请输入用户名
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>密码</label>
                                            <input value="${email.SMTPPassword}" type="password" name="SMTPPassword" id="SMTPPassword" class="form-control" required>
                                            <div class="invalid-feedback">
                                                请输入秘密
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>一次连接服务器连续发送次数</label>
                                            <input value="${email.number}" type="number" name="number" id="number" class="form-control" placeholder="请输入数字" required/>
                                            <div class="invalid-feedback">
                                                请输入一次连接服务器连续发送
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sel1">登陆类型</label>
                                            <select class="form-control" name="loginType" id="loginType" required>
                                                <option value="1">${email.loginType}</option>
                                                <option value="2">${email.loginType}</option>
                                                <option value="3">${email.loginType}</option>
                                                <option value="4">${email.loginType}</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                请选择登陆类型
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div style="height: 5px; width: 350px"></div>
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
<input hidden id="info" value="${info!}">
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
        console.log(info)
        if (info != null && info != "") {
            layer.msg(info);
        }
    })
</script>
</body>
</html>