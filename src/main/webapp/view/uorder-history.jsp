<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>用户历史订单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="${pageContext.request.contextPath}/car/carList">首页</a>
                            <a><cite>历史订单</cite></a>

            </span>

    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">



                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="" lay-skin="primary">
                            </th>
                            <th>编号</th>
                            <th>订单号</th>
                            <th>邮箱账号</th>
                            <th>车名</th>
                            <th>总金额</th>
                            <th>车辆状态</th>
                            <th>取车时间</th>
                            <th>还车时间</th>
                        </tr>
                        </thead>
                        <tbody>


                        <c:forEach items="${list}" var="order" varStatus="s">
                            <tr>
                                <td>
                                    <input type="checkbox" name="" lay-skin="primary"></td>
                                <td>${s.index + 1}</td>
                                <td>${order.oid}</td>
                                <td>${order.email}</td>
                                <td>${order.cname}</td>
                                <td>${order.crent}</td>
                                <td>已还车</td>
                                <td>${order.taketime}</td>
                                <td>${order.gettime}</td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>layui.use(['laydate', 'form'],
    function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

</script>

</html>