<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>用户黑名单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
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
                            <input type="text" name="email" placeholder="请输入email" id="email" autocomplete="off"
                                   value="${user.email}"
                                   class="layui-input">
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="tel" placeholder="请输入手机" autocomplete="off" id="tel"
                                   value="${user.tel}"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="${pageContext.request.contextPath}/blackUser/page"
                                    lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                            <button class="layui-btn" id="res"><i class="iconfont">&#xe6aa;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量恢复
                    </button>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                            </th>
                            <th>ID</th>
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


                        <c:forEach items="${pu.list}" var="user" varStatus="s">
                            <tr>
                                <td>
                                    <input type="checkbox" value="${user.email}" lay-skin="primary">
                                </td>
                                <td>${s.index + 1}</td>
                                <td>${user.email}</td>
                                <td>${user.username}</td>
                                <td>${user.sex}</td>
                                <td>${user.tel}</td>
                                <td>${user.address}</td>

                                <td class="td-status">
                                    <span class="layui-btn layui-btn-danger layui-btn-mini">已拉黑</span>
                                <td class="td-manage">
                                    <a title="恢复" onclick="member_remove(this,'${user.email}')" href="javascript:;">
                                        <i class="layui-icon">&#xe669;</i>
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
                            <c:if test="${pu.currentPage != 1 && pu.currentPage != 0}">
                                <a class="prev"
                                   href="${pageContext.request.contextPath}/blackUser/page?currentPage=${pu.currentPage-1}&pageSize=5&username=${user.username}&email=${mp.eamil[0]}&tel=${user.tel}">&lt;&lt;</a>
                            </c:if>

                            <c:forEach end="${pu.totalPage}" var="cpage" begin="1">
                                <c:if test="${pu.currentPage == cpage}">
                                    <span class="current">${cpage}</span>
                                </c:if>

                                <c:if test="${pu.currentPage != cpage}">
                                    <a class="num"
                                       href="${pageContext.request.contextPath}/blackUser/page?currentPage=${cpage}&pageSize=5&username=${user.username}&email=${mp.eamil[0]}&tel=${user.tel}">${cpage}</a>
                                </c:if>
                            </c:forEach>

                            <c:if test="${pu.currentPage != pu.totalPage}">
                                <a class="next"
                                   href="${pageContext.request.contextPath}/blackUser/page?currentPage=${pu.currentPage+1}&pageSize=5&username=${user.username}&email=${mp.eamil[0]}&tel=${user.tel}">&gt;&gt;</a>
                            </c:if>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
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


    /*用户-移除黑名单*/
    function member_remove(obj, id) {
        layer.confirm('确认要移出黑名单吗？', function (index) {
            //发异步把用户状态进行更改
            $.post(
                "${pageContext.request.contextPath}/blackUser/updateStatus",
                {
                    email: id,
                }
            );
            $(obj).parents("tr").remove();
            layer.msg('已移出黑名单!', {icon: 1, time: 1000});
        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.post(
                "${pageContext.request.contextPath}/user",
                {
                    email: id,
                    _method: "DELETE"
                }
            );
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }

    $(function () {
        $("#res").click(function () {
            $("#username").val("");
            $("#email").val("");
            $("#tel").val("");
        });
    });


    // function delAll (argument) {
    //
    //   var data = tableCheck.getData();
    //
    //   layer.confirm('确认要恢复吗？'+data,function(index){
    //       //捉到所有被选中的，发异步进行删除
    //       $.ajax({
    //           url: "SelectBlackServlet",
    //           data: {
    //               emails: data
    //           },
    //           type: "post",
    //           traditional: true
    //       });
    //
    //       layer.msg('恢复成功', {icon: 1});
    //       $(".layui-form-checked").not('.header').parents('tr').remove();
    //   });
    //
    //
    // }

    function delAll(argument) {
        var emails = [];

        // 获取选中的id
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                emails.push($(this).val())
            }
        });

        layer.confirm('确认全部移除黑名单吗？', function (index) {
                //捉到所有被选中的，发异步进行删除
                $.ajax({
                    url: "${pageContext.request.contextPath}/blackUser/updateStatus",
                    data: {
                        email: emails
                    },
                    type: "post",
                    traditional: true
                });

                // layer.msg('删除成功', {icon: 1});
                // $(".layui-form-checked").not('.header').parents('tr').remove();
                location.href = "${pageContext.request.contextPath}/blackUser/page";
            }
        );
    }
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