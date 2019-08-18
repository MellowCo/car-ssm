<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="../static/css/font.css">
    <link rel="stylesheet" href="../static/css/xadmin.css">
    <script src="../static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../static/js/xadmin.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="username" placeholder="请输入用户名" id="username" autocomplete="off"
                                   value="${user.username}"
                                   class="layui-input">
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="email" id="email" placeholder="请输入email" autocomplete="off"
                                   value="${user.email}"
                                   class="layui-input">
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="tel" id="tel" placeholder="请输入手机" autocomplete="off"
                                   value="${user.tel}"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="../user/pageUser" lay-filter="sreach"><i
                                    class="layui-icon">&#xe615;</i></button>

                            <button class="layui-btn" id="res"><i class="iconfont">&#xe6aa;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除
                    </button>
                    <button class="layui-btn"
                            onclick="xadmin.open('添加用户','${pageContext.request.contextPath}/view/member-add.html',600,400)">
                        <i
                                class="layui-icon"></i>添加
                    </button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                            </th>
                            <th>编号</th>
                            <th>email</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>手机</th>
                            <th>地址</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach var="user" items="${pu.list}" varStatus="s">
                            <tr>
                                <td>
                                    <input type="checkbox" name="id" value="${user.email}" lay-skin="primary" class="id">
                                </td>
                                <td>${s.index + 1}</td>
                                <td>${user.email}</td>
                                <td>${user.username}</td>
                                <td>${user.sex}</td>
                                <td>${user.tel}</td>
                                <td>${user.address}</td>

                                <c:if test="${user.status == 1}">
                                <td class="td-status">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>
                                </td>
                                <td class="td-manage">
                                    <a onclick="member_stop(this,'${user.email}')" href="javascript:;"
                                       title="启用">
                                        <input type="hidden" value="${user.status}"/>
                                        <i class="layui-icon">&#xe601;</i>
                                    </a>
                                    </c:if>

                                    <c:if test="${user.status == -1}">
                                <td class="td-status">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">已拉黑</span>
                                </td>
                                <td class="td-manage">
                                    <a onclick="member_stop(this,'${user.email}')" href="javascript:;"
                                       title="拉黑">
                                        <input type="hidden" value="${user.status}" />
                                        <i class="layui-icon">&#xe62f;</i>
                                    </a>
                                    </c:if>

                                    <a title="编辑"
                                       onclick="xadmin.open('编辑','${pageContext.request.contextPath}/user/${user.email}/',600,400)"
                                       href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a onclick="xadmin.open('修改密码','${pageContext.request.contextPath}/view/member-password.jsp?email=${user.email}',600,400)"
                                       title="修改密码" href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>
                                    </a>
                                    <a title="删除" onclick="member_del(this,'${user.email}')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <c:if test="${pu.currentPage != 1}">
                                <a class="prev"
                                   href="../user/pageUser?currentPage=${pu.currentPage-1}&pageSize=5&username=${user.username}&email=${user.email}&tel=${user.tel}">&lt;&lt;</a>
                            </c:if>

                            <c:forEach end="${pu.totalPage}" var="cpage" begin="1">
                                <c:if test="${pu.currentPage == cpage}">
                                    <span class="current">${cpage}</span>
                                </c:if>

                                <c:if test="${pu.currentPage != cpage}">
                                    <a class="num"
                                       href="../user/pageUser?currentPage=${cpage}&pageSize=5&username=${user.username}&email=${user.email}&tel=${user.tel}">${cpage}</a>
                                </c:if>
                            </c:forEach>

                            <c:if test="${pu.currentPage != pu.totalPage}">
                                <a class="next"
                                   href="../user/pageUser?currentPage=${pu.currentPage+1}&pageSize=5&username=${user.username}&email=${user.email}&tel=${user.tel}">&gt;&gt;</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function (data) {

            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-停用*/
    function member_stop(obj, id,) {

        if ($(obj).children("input").val() == 1) {
            layer.confirm('确认要拉黑吗？', function (index) {
                //发异步把用户状态进行更改
                $.post(
                    "${pageContext.request.contextPath}/user/",
                    {
                        email: id,
                        status: -1,
                        _method: "PUT"
                    }
                );

                $(obj).attr('title', '拉黑');
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已拉黑');
                layer.msg('已拉黑!', {icon: 5, time: 1000});
                $(obj).children("input").val(-1);
            });
        } else {
            layer.confirm('确认要恢复吗？', function (index) {
                //发异步把用户状态进行更改
                $.post(
                    "${pageContext.request.contextPath}/user/",
                    {
                        email: id,
                        status: 1,
                        _method: "PUT"
                    }
                );

                $(obj).attr('title', '启用');
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 6, time: 1000});
                $(obj).children("input").val(1);
            });
        }

    }

    /*用户-删除*/
    function member_del(obj, id) {

        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.post(
                "${pageContext.request.contextPath}/user",
                {
                    email: id,
                    _method : "DELETE"
                }, function (result) {
                    if (result == 1) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    }
                }
            );

        });
    }

    $(function () {
        $("#res").click(function () {
            $("#username").val("");
            $("#email").val("");
            $("#tel").val("");
        });
    });


    function delAll(argument) {
        var emails = [];

        // 获取选中的id
        $('tbody .id').each(function (index, el) {
            if ($(this).prop('checked')) {
                emails.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？', function (index) {

                //捉到所有被选中的，发异步进行删除
                $.ajax({
                    url: "${pageContext.request.contextPath}/user",
                    data: {
                        _method:"Delete",
                        email: emails
                    },
                    type: "post",
                    traditional: true
                });

                // layer.msg('删除成功', {icon: 1});
                // $(".layui-form-checked").not('.header').parents('tr').remove();
                location.href = "${pageContext.request.contextPath}/user/pageUser";
            }
        );
    }
</script>
</html>