<%--<%@ page import="java.text.SimpleDateFormat" %>--%>
<%--<%@ page import="java.util.Date" %>--%>
<%--<%@ page import="com.li.dao.impl.UserDaoImpl" %>--%>
<%--<%@ page import="com.li.dao.impl.CarDaoImpl" %>--%>
<%--<%@ page import="com.li.dao.impl.OrderDaoImpl" %>--%>
<%--<!DOCTYPE html>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html class="x-admin-sm">--%>
<%--    <head>--%>
<%--        <meta charset="UTF-8">--%>
<%--        <title>欢迎页面</title>--%>
<%--        <meta name="renderer" content="webkit">--%>
<%--        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
<%--        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
<%--        <link rel="stylesheet" href="../css/font.css">--%>
<%--        <link rel="stylesheet" href="../css/xadmin.css">--%>
<%--        <script src="../lib/layui/layui.js" charset="utf-8"></script>--%>
<%--        <script type="text/javascript" src="../js/xadmin.js"></script>--%>
<%--        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->--%>
<%--        <!--[if lt IE 9]>--%>
<%--          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>--%>
<%--          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>--%>
<%--        <![endif]-->--%>
<%--        <style>--%>
<%--            body {--%>
<%--                background-image: url("../img/car.jpg");--%>
<%--                overflow:auto;--%>
<%--            }--%>
<%--        </style>--%>

<%--    </head>--%>
<%--    <body>--%>
<%--        <div class="layui-fluid">--%>
<%--            <div class="layui-row layui-col-space15">--%>
<%--                <div class="layui-col-md12">--%>
<%--                    <div class="layui-card">--%>
<%--                        <div class="layui-card-body ">--%>
<%--                            <blockquote class="layui-elem-quote">欢迎管理员--%>
<%--                                <span class="x-red"></span>！当前时间:--%>
<%--                                <%--%>
<%--                                    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");--%>
<%--                                    out.print(sf.format(new Date()));--%>
<%--                                %>--%>
<%--                            </blockquote>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="layui-col-md12">--%>
<%--                    <div class="layui-card">--%>
<%--                        <div class="layui-card-header">数据统计</div>--%>
<%--                        <div class="layui-card-body ">--%>
<%--                            <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">--%>
<%--                                <li class="layui-col-md2 layui-col-xs6">--%>
<%--                                    <a href="javascript:;" class="x-admin-backlog-body">--%>
<%--                                        <h3>会员数</h3>--%>
<%--                                        <p>--%>
<%--                                            <cite>--%>
<%--                                                <%--%>
<%--                                                     out.print(new UserDaoImpl().totalData());--%>
<%--                                                %>--%>
<%--                                            </cite></p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="layui-col-md2 layui-col-xs6">--%>
<%--                                    <a href="javascript:;" class="x-admin-backlog-body">--%>
<%--                                        <h3>拉黑会员数</h3>--%>
<%--                                        <p>--%>
<%--                                            <cite>--%>
<%--                                                <%--%>
<%--                                                    out.print(new UserDaoImpl().totalBlack());--%>
<%--                                                %>--%>
<%--                                            </cite></p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="layui-col-md2 layui-col-xs6">--%>
<%--                                    <a href="javascript:;" class="x-admin-backlog-body">--%>
<%--                                        <h3>车库数量</h3>--%>
<%--                                        <p>--%>
<%--                                            <cite>--%>
<%--                                                <%--%>
<%--                                                    out.print(new CarDaoImpl().totalCar());--%>
<%--                                                %>--%>

<%--                                            </cite></p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="layui-col-md2 layui-col-xs6">--%>
<%--                                    <a href="javascript:;" class="x-admin-backlog-body">--%>
<%--                                        <h3>历史总订单数</h3>--%>
<%--                                        <p>--%>
<%--                                            <cite>--%>
<%--                                                <%--%>
<%--                                                    out.print(new OrderDaoImpl().totalData());--%>
<%--                                                %>--%>
<%--                                            </cite></p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="layui-col-md2 layui-col-xs6">--%>
<%--                                    <a href="javascript:;" class="x-admin-backlog-body">--%>
<%--                                        <h3>正在进行的订单</h3>--%>
<%--                                        <p>--%>
<%--                                            <cite>--%>
<%--                                                <%--%>
<%--                                                    out.print(new OrderDaoImpl().orderOnline());--%>
<%--                                                %>--%>
<%--                                            </cite></p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="layui-col-md2 layui-col-xs6 ">--%>
<%--                                    <a href="javascript:;" class="x-admin-backlog-body">--%>
<%--                                        <h3>李铖龙</h3>--%>
<%--                                        <p>--%>
<%--                                            <cite>182173415</cite></p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>


<%--                <div class="layui-col-md12">--%>
<%--                    <div class="layui-card">--%>
<%--                        <div class="layui-card-header">开发团队</div>--%>
<%--                        <div class="layui-card-body ">--%>
<%--                            <table class="layui-table">--%>
<%--                                <tbody>--%>
<%--                                    <tr>--%>
<%--                                        <th>版权所有</th>--%>
<%--                                        <td>xuebingsi(xuebingsi)--%>
<%--                                            <a href="http://x.xuebingsi.com/" target="_blank">访问官网</a></td>--%>
<%--                                    </tr>--%>
<%--                                    <tr>--%>
<%--                                        <th>开发者</th>--%>
<%--                                        <td>李铖龙</td></tr>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <style id="welcome_style"></style>--%>

<%--        </div>--%>
<%--        </div>--%>
<%--    </body>--%>
<%--</html>--%>