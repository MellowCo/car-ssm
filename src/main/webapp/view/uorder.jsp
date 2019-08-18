<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>用户订单列表</title>
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
                            <a><cite>正在进行的订单</cite></a>

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
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>


                        <c:forEach items="${list}" var="corder" varStatus="s">
                            <tr>
                                <td>
                                    <input type="checkbox" name="" lay-skin="primary"></td>
                                <td>${s.index + 1}</td>
                                <td>${corder.oid}</td>
                                <td>${corder.email}</td>
                                <td>${corder.cname}</td>
                                <td>${corder.crent}</td>
                                <td>租借中</td>
                                <td>${corder.taketime}</td>
                                <td>${corder.gettime}</td>
                                <td class="td-manage">

                                    <div><button class="layui-btn"
                                                 onclick="member_del(this,'${corder.oid}','${corder.cid}')">
                                        <i class="layui-icon"></i>还车
                                    </button>
                                    </div>

                                </td>
                            </tr>


                        </c:forEach>


                        </tbody>
                    </table>

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

// /*用户-停用*/
// function member_stop(obj, id) {
//     layer.confirm('确认要停用吗？',
//     function(index) {
//
//         if ($(obj).attr('title') == '启用') {
//
//             //发异步把用户状态进行更改
//             $(obj).attr('title', '停用');
//             $(obj).find('i').html('&#xe62f;');
//
//             $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
//             layer.msg('已停用!', {
//                 icon: 5,
//                 time: 1000
//             });
//
//         } else {
//             $(obj).attr('title', '启用');
//             $(obj).find('i').html('&#xe601;');
//
//             $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
//             layer.msg('已启用!', {
//                 icon: 5,
//                 time: 1000
//             });
//         }
//
//     });
// }

/*用户-还车*/
function member_del(obj, oid, cid) {
    layer.confirm('确认要还车吗？',
        function (index) {
            //发异步删除数据
            $.post(
                "${pageContext.request.contextPath}/order/updateStatus", {
                    oid: oid,
                    cid: cid
                }
            );
            $(obj).parents("tr").remove();
            layer.msg('已还车!', {
                icon: 1,
                time: 1000
            });
        });
}

// function delAll(argument) {
//
//     var data = tableCheck.getData();
//
//     layer.confirm('确认要删除吗？' + data,
//     function(index) {
//         //捉到所有被选中的，发异步进行删除
//         layer.msg('删除成功', {
//             icon: 1
//         });
//         $(".layui-form-checked").not('.header').parents('tr').remove();
//     });
//
// }

</script>

</html>