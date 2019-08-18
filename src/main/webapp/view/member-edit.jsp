<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>修改用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <input type="hidden" value="${user.email}" id="email">
            <input type="hidden" value="PUT" name="_method">

            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red">*</span>昵称</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_username" name="username" required="" lay-verify="nikename"
                           autocomplete="off" class="layui-input" value="${user.username}"></div>
            </div>

            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red">*</span>手机号</label>
                <div class="layui-input-inline">
                    <input type="text" id="L_tel" name="tel" required="" lay-verify="tel" autocomplete="off"
                           class="layui-input" value="${user.tel}"></div>
            </div>

            <div class="layui-form-item">
                <label for="sex" class="layui-form-label">
                    <span class="x-red">*</span>性别</label>
                <div class="layui-input-inline">
                    <select name="sex" class="valid" id="sex">
                        <c:if test="${user.sex  == '男'}">
                            <option value="男" selected>男</option>
                            <option value="女">女</option>
                        </c:if>

                        <c:if test="${user.sex  == '女'}">
                            <option value="男">男</option>
                            <option value="女" selected>女</option>
                        </c:if>

                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="address" class="layui-form-label">
                    <span class="x-red">*</span>地址</label>
                <div class="layui-input-inline">
                    <select name="address" id="address">

                        <c:if test="${user.address == '北京'}">
                            <option value="北京" selected>北京</option>
                            <option value="绍兴">绍兴</option>
                            <option value="上海">上海</option>
                            <option value="宁波">宁波</option>
                        </c:if>

                        <c:if test="${user.address == '绍兴'}">
                            <option value="北京">北京</option>
                            <option value="绍兴" selected>绍兴</option>
                            <option value="上海">上海</option>
                            <option value="宁波">宁波</option>
                        </c:if>

                        <c:if test="${user.address == '上海'}">
                            <option value="北京">北京</option>
                            <option value="绍兴">绍兴</option>
                            <option value="上海" selected>上海</option>
                            <option value="宁波">宁波</option>
                        </c:if>

                        <c:if test="${user.address == '宁波'}">
                            <option value="北京">北京</option>
                            <option value="绍兴">绍兴</option>
                            <option value="上海">上海</option>
                            <option value="宁波" selected>宁波</option>
                        </c:if>

                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">修改</button>
            </div>
        </form>
    </div>
</div>
<script>
    var flag = false;

    layui.use(['form', 'layer', 'jquery'],
        function () {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;

            //自定义验证规则
            form.verify({
                nikename: function (value) {
                    if (value.length < 3) {
                        return '昵称至少得3个字符啊';
                    }
                },
                pass: [/(.+){6,12}$/, '密码必须6到12位'],
                repass: function (value) {
                    if ($('#L_pass').val() != $('#L_repass').val()) {
                        return '两次密码不一致';
                    }
                },
                tel: function (value) {
                    if (value == "") {
                        return '电话为空';
                    }
                }
            });

            //监听提交
            form.on('submit(add)',
                function (data) {
                    $.post(
                        "${pageContext.request.contextPath}/user/",
                        {
                            email:$("#email").val(),
                            username: $("#L_username").val(),
                            sex: $("#sex").val(),
                            tel: $("#L_tel").val(),
                            address: $("#address").val(),
                            _method:"PUT"
                        }, function (result) {
                            if (result == 1) {
                                layer.alert("修改成功", {
                                        icon: 6
                                    },
                                    function () {
                                        //关闭当前frame
                                        xadmin.close();
                                        // 可以对父窗口进行刷新
                                        xadmin.father_reload();
                                    });
                            }
                        }
                    );
                    return false;
                });

        });

</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>

</html>