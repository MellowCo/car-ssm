<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>更改用户密码</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="email" class="layui-form-label">你的邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" id="email" name="email" disabled="" value="${param.email}" class="layui-input"
                           readonly="readonly"></div>
            </div>
            <div class="layui-form-item">
                <label for="oldpass" class="layui-form-label">
                    <span class="x-red">*</span>旧密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="oldpass" name="oldpass" required="" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
                <span class="x-red" id="checkPwd"></span>
            </div>
            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>新密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="newpass" required="" lay-verify="pass" autocomplete="off"
                           class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">6到12个字符</div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="save" lay-submit="">修改</button>
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
                pass: [/(.+){6,12}$/, '密码必须6到12位'],
                repass: function (value) {
                    if ($('#L_pass').val() != $('#L_repass').val()) {
                        return '两次密码不一致';
                    }
                },
                checkPwd:function () {
                    if(flag == false){
                        return '旧密码错误';
                    }
                }
            });

            //监听提交
            form.on('submit(save)',
                function (data) {
                    $.post(
                        "${pageContext.request.contextPath}/user",
                        {
                            email: $("#email").val(),
                            pwd: $("#L_pass").val(),
                            _method: "PUT"
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


    //ajax请求，检查旧密码是否正确
    $(function () {
        $("#oldpass").blur(function () {

            $.post(
                "${pageContext.request.contextPath}/user/checkPwd",
                {
                    email:$("#email").val(),
                    pwd: $("#oldpass").val()
                },
                function (result) {
                    if (result == 1) {
                        $("#checkPwd").text("密码正确");
                        $("#checkPwd").css("color", "green");
                        flag = true;
                    } else {
                        $("#checkPwd").text("密码错误");
                        $("#checkPwd").css("color", "red");
                        flag = false;
                    }
                }
            );

        });
    });


</script>


<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>