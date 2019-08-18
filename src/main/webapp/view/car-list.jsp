<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>车辆列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
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
                            <input type="text" name="cname" placeholder="请输入车名" id="cname" autocomplete="off"
                                   value="${carport.cname}"
                                   class="layui-input">
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="crent" id="crent" placeholder="请输入租金" autocomplete="off"
                                   value="${carport.crent}"
                                   class="layui-input">
                        </div>

                        <div class="layui-input-inline layui-show-xs-block">
                            <select name="status" id="status">
                                <c:if test="${carport.status == 1}">
                                    <option value="">车辆状态</option>
                                    <option value="1" selected>上架</option>
                                    <option value="-1">下架</option>
                                </c:if>

                                <c:if test="${carport.status == -1}">
                                    <option value="">车辆状态</option>
                                    <option value="1">上架</option>
                                    <option value="-1" selected>下架</option>
                                </c:if>

                                <c:if test="${empty carport.status}">
                                    <option value="" selected>车辆状态</option>
                                    <option value="1">上架</option>
                                    <option value="-1">下架</option>
                                </c:if>

                            </select>
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="${pageContext.request.contextPath}/car/page"
                                    lay-filter="sreach"><i
                                    class="layui-icon">&#xe615;</i></button>
                            <button class="layui-btn" id="res"><i class="iconfont">&#xe6aa;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量下架
                    </button>
                    <button class="layui-btn" onclick="putAll()"><i
                            class="layui-icon"></i>批量上架
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
                            <th>车名</th>
                            <th>车辆信息</th>
                            <th>租金/天</th>
                            <th>车辆状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach var="car" items="${pu.list}" varStatus="s">
                            <tr>
                                <td>
                                    <c:if test="${car.status == -1 || car.status == 1}">
                                        <input type="checkbox" name="id" value="${car.cid}" lay-skin="primary">
                                    </c:if>
                                </td>
                                <td>${s.index + 1}</td>
                                <td>${car.cname}</td>
                                <td>${car.cinfo}</td>
                                <td>${car.crent}</td>


                                <c:if test="${car.status == 1}">
                                <td class="td-status">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini">已上架</span>
                                </td>
                                <td class="td-manage">
                                    <a onclick="member_stop(this,'${car.cid}','${car.status}')" href="javascript:;"
                                       title="上架">
                                        <i class="layui-icon">&#xe601;</i>
                                    </a>
                                    </c:if>


                                    <c:if test="${car.status == 0}">
                                <td class="td-status">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini"
                                          style="background-color: #0e9b12">租借中</span>
                                </td>
                                <td class="td-manage">
                                        <%--                                        <a onclick="member_stop(this,'${car.cid}','${car.status}')" href="javascript:;"--%>
                                        <%--                                       title="上架">--%>
                                        <%--                                        <i class="layui-icon">&#xe601;</i>--%>
                                    </a>
                                    </c:if>


                                    <c:if test="${car.status == -1}">
                                <td class="td-status">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">已下架</span>
                                </td>
                                <td class="td-manage">
                                    <a onclick="member_stop(this,'${car.cid}','${car.status}')" href="javascript:;"
                                       title="下架">
                                        <i class="layui-icon">&#xe62f;</i>
                                    </a>
                                    </c:if>

                                        <%--                                    <a title="编辑"--%>
                                        <%--                                       onclick="xadmin.open('编辑','',600,400)"--%>
                                        <%--                                       href="javascript:;">--%>
                                        <%--                                        <i class="layui-icon">&#xe642;</i>--%>
                                        <%--                                    </a>--%>
                                        <%--                                    <a onclick="xadmin.open('修改密码','',600,400)"--%>
                                        <%--                                       title="修改密码" href="javascript:;">--%>
                                        <%--                                        <i class="layui-icon">&#xe631;</i>--%>
                                        <%--                                    </a>--%>
                                        <%--                                    <a title="删除" onclick="member_del(this,'id')" href="javascript:;">--%>
                                        <%--                                        <i class="layui-icon">&#xe640;</i>--%>
                                        <%--                                    </a>--%>
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
                                   href="${pageContext.request.contextPath}/car/page?currentPage=${pu.currentPage-1}&pageSize=5&cname=${carport.cname}&crent=${carport.crent}&status=${carport.status}">&lt;&lt;</a>
                            </c:if>

                            <c:forEach end="${pu.totalPage}" var="cpage" begin="1">
                                <c:if test="${pu.currentPage == cpage}">
                                    <span class="current">${cpage}</span>
                                </c:if>

                                <c:if test="${pu.currentPage != cpage}">
                                    <a class="num"
                                       href="${pageContext.request.contextPath}/car/page?currentPage=${cpage}&pageSize=5&cname=${carport.cname}&crent=${carport.crent}&status=${carport.status}">${cpage}</a>
                                </c:if>
                            </c:forEach>

                            <c:if test="${pu.currentPage != pu.totalPage}">
                                <a class="next"
                                   href="${pageContext.request.contextPath}/car/page?currentPage=${pu.currentPage+1}&pageSize=5&cname=${carport.cname}&crent=${carport.crent}&status=${carport.status}">&gt;&gt;</a>
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
    function member_stop(obj, cid, status) {
        layer.confirm('确认要下架吗？', function (index) {

            if ($(obj).attr('title') == '上架') {

                //发异步把用户状态进行更改
                $.post(
                    "${pageContext.request.contextPath}/car/status",
                    {
                        ids: cid,
                        status: -1
                    }
                );
                $(obj).attr('title', '下架')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已下架');
                layer.msg('已下架!', {icon: 5, time: 1000});

            } else {
                //发异步把用户状态进行更改
                $.post(
                    "${pageContext.request.contextPath}/car/status",
                    {
                        ids: cid,
                        status: 1
                    }
                );

                $(obj).attr('title', '上架')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已上架');
                layer.msg('已上架!', {icon: 6, time: 1000});
            }

        });
    }


    $(function () {
        $("#res").click(function () {
            $("#cname").val("");
            $("#cent").val("");
            $("#status").val("");
        });
    });


    function delAll(argument) {
        var cids = [];

        // 获取选中的id
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                cids.push($(this).val())
            }
        });

        layer.confirm('确认要下架吗？', function (index) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/car/status",
                    data: {
                        ids: cids,
                        status: -1
                    },
                    type: "post",
                    traditional: true
                });

                location.href = "${pageContext.request.contextPath}/car/page";
            }
        );
    }

    function putAll(argument) {
        var cids = [];

        // 获取选中的id
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                cids.push($(this).val())
            }
        });

        layer.confirm('确认要上架吗？', function (index) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/car/status",
                    data: {
                        ids: cids,
                        status: 1
                    },
                    type: "post",
                    traditional: true
                });

                location.href = "${pageContext.request.contextPath}/car/page";
            }
        );
    }


</script>
</html>