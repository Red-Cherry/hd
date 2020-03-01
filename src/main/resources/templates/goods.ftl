<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/toPay" method="post">
    商品名称:<input id="goodsName" name="goodsName" placeholder="请输入想买的商品名称"/><br>
    购买个数:<input id="num" name="num" placeholder="请输入购买个数"/><br>
    商品单价:<input id="price" name="price" placeholder="商品单价，单位元"><br>
    <button type="submit">提交</button>
</form>
</body>
</html>